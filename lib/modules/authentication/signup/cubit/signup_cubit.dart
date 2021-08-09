import 'package:aroundus_app/modules/authentication/signup/models/models.dart';
import 'package:aroundus_app/modules/authentication/signup/view/view.dart';
import 'package:aroundus_app/repositories/authentication_repository/authentication_repository.dart';
import 'package:aroundus_app/support/networks/api_result.dart';
import 'package:aroundus_app/support/networks/network_exceptions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._authenticationRepository) : super(const SignupState());

  final AuthenticationRepository _authenticationRepository;

  void errorMessageInit() {
    emit(state.copyWith(
      errorMessage: null,
    ));
  }

  void phoneNumberVerifyInit() async {
    emit(state.copyWith(phoneNumberVerifyStatus: VerifyStatus.init));
  }

  Future<void> phoneNumberVerifyRequest() async {
    if (!state.phoneNumber.valid) return;
    emit(state.copyWith(phoneNumberVerifyStatus: VerifyStatus.request));
    ApiResult<bool> apiResult =
        await _authenticationRepository.requestPhoneVerifier(
      phoneNumber: state.phoneNumber.value,
    );
    apiResult.when(success: (bool? isVerified) {
      emit(state.copyWith(phoneNumberVerifyStatus: VerifyStatus.request));
    }, failure: (NetworkExceptions? error) {
      emit(state.copyWith(errorMessage: error!.toString()));
    });
  }

  Future<void> confirmVerifierCode() async {
    if (!state.phoneNumber.valid) return;
    ApiResult<String> apiResult =
        await _authenticationRepository.confirmVerifierCode(
            phoneNumber: state.phoneNumber.value,
            code: state.verifyNumber.value);
    apiResult.when(success: (String? phoneToken) {
      emit(state.copyWith(
          phoneNumberVerifyStatus: VerifyStatus.verified,
          phoneToken: phoneToken));
    }, failure: (NetworkExceptions? error) {
      emit(state.copyWith(
          phoneNumberVerifyStatus: VerifyStatus.unverified,
          unverifiedFlag: true));

      // emit(state.copyWith(errorMessage: error!.toString()));
    });
  }

  void phoneNumberVerifyExpired() async {
    emit(state.copyWith(
        phoneNumberVerifyStatus: VerifyStatus.expiered, expiredFlag: true));
  }

  void verifyNumberChanged(String value) {
    final verifyNumber = VerifyNumber.dirty(value);
    emit(state.copyWith(
      verifyNumber: verifyNumber,
    ));
  }

  Future<void> phoneNumberVerify() async {
    if (!state.phoneNumber.valid) return;
    ApiResult<String> apiResult = await _authenticationRepository.verifyCode(
      phoneNumber: state.phoneNumber.value,
      verifyCode: state.verifyNumber.value,
    );
    apiResult.when(success: (String? token) {
      print("token $token");
      emit(state.copyWith(
          phoneNumberVerifyStatus: VerifyStatus.verified, phoneToken: token));
     logger.d("${state.phoneToken}");

    }, failure: (NetworkExceptions? error) {
      emit(state.copyWith( phoneNumberVerifyStatus: VerifyStatus.unverified, unverifiedFlag: true, errorMessage: error.toString()));
    });
  }

  void republishAuth() {
    emit(state.copyWith(republishFlag: true));
  }

  void phoneNumberChanged(String value) {
    final phoneNumber = PhoneNumber.dirty(value);
    emit(state.copyWith(
      phoneNumber: phoneNumber,
      status: Formz.validate([
        state.email,
        state.password,
        state.nickName,
        phoneNumber,
      ]),
      phoneNumberVerifyStatus: null,
    ));
  }

  void republishAuthInit() {
    emit(state.copyWith(republishFlag: false));
  }

  void expiredFlagFalse() {
    emit(state.copyWith(expiredFlag: false));
  }

  void unverifiedFlagFalse() {
    emit(state.copyWith(unverifiedFlag: false));
  }

  Future<void> emailVerifyRequest() async {
    if (!state.email.valid) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    ApiResult<String> apiResult =
        await _authenticationRepository.emailVerifyRequest(
      email: state.email.value,
    );
    apiResult.when(success: (String? email) {
      emit(state.copyWith(
        isDupCheckedSnsId: false,
        status: FormzStatus.pure,
        // errorMessage: isDuplicated
        //     ? NetworkExceptions.getErrorMessage(
        //     NetworkExceptions.defaultError('email-already-in-use'))
        //     : NetworkExceptions.getErrorMessage(
        //     NetworkExceptions.defaultError('email-useable'))
      ));
    }, failure: (NetworkExceptions? error) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    });
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        email,
        state.password,
      ]),
      isDupCheckedSnsId: true,
    ));
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(state.copyWith(
      confirmedPassword: confirmedPassword,
      status: Formz.validate([
        state.email,
        state.password,
        confirmedPassword,
        state.nickName,
      ]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    // final confirmedPassword = ConfirmedPassword.dirty(
    //   password: password.value,
    //   value: state.confirmedPassword.value,
    // );
    emit(state.copyWith(
      password: password,
      // confirmedPassword: confirmedPassword,
      status: Formz.validate([
        state.email,
        password,
        state.nickName,
        state.phoneNumber,
      ]),
    ));
  }

  Future<void> emailAuthCheck(SignupState _state) async {
    if (!state.email.valid || !state.password.valid) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    ApiResult<String> apiResult =
        await _authenticationRepository.emailAuthCheck(
      email: state.email.value,
      password: state.password.value,
    );
    apiResult.when(success: (String? email) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }, failure: (NetworkExceptions? error) {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        errorMessage: NetworkExceptions.getErrorMessage(error!),
      ));
    });
  }

  Future<void> signUpFormSubmitted(SignupState _state) async {

    print("signUpFormSubmitted $state");
    print("signUpFormSubmitted ${state.phoneToken}");
    if (!state.email.valid ||
        !state.password.valid ||
        !state.phoneNumber.valid ||
        state.phoneToken == null) return;

    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    ApiResult<Map> apiResult = await _authenticationRepository.signUp(
      email: state.email.value,
      phone: state.phoneNumber.value,
      password: state.password.value,
      passwordConfirm: state.password.value,
      phoneToken: state.phoneToken!,
    );

    apiResult.when(success: (Map? email) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }, failure: (NetworkExceptions? error) {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        errorMessage: NetworkExceptions.getErrorMessage(error!),
      ));
    });
  }

  void phoneTokenInit(String phoneToken){
    emit(state.copyWith(phoneToken: phoneToken));
  }
}
