import 'dart:async';
import 'dart:convert';

import 'package:aroundus_app/modules/authentication/authentication.dart';
import 'package:aroundus_app/support/networks/api_result.dart';
import 'package:aroundus_app/support/networks/dio_client.dart';
import 'package:aroundus_app/support/networks/network_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, profile }

class AuthenticationRepository {
  final DioClient _dioClient;

  AuthenticationRepository(this._dioClient);

  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));

    String? accessToken = await getAccessToken();
    logger.d("Stream<AuthenticationStatus> get status");

    if (accessToken != null) {
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  Future<void> logIn() async {
    _controller.add(AuthenticationStatus.authenticated);
  }

  Future<void> travel() async {
    _controller.add(AuthenticationStatus.unknown);
  }

  void logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('access')) {
      await prefs.remove("clayful");
      await prefs.remove("refresh");
      await prefs.remove("access").whenComplete(() {
        _controller.add(AuthenticationStatus.unauthenticated);
      });
    } else {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  void signOut() async {
    try {
      _dioClient
          .deleteWithClayful('/api/v1/user/profile/')
          .whenComplete(() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove("clayful");
        await prefs.remove("refresh");
        await prefs.remove("access").whenComplete(
            () => _controller.add(AuthenticationStatus.unauthenticated));
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<ApiResult<Map>> requestPhoneVerifier({
    required String phoneNumber,
  }) async {
    try {
      String body = json.encode({"phone": phoneNumber});
      var response =
          await _dioClient.post('/api/v1/user/phone-verifier/', data: body);
      return ApiResult.success(
        data: response,
      );
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
      );
    }
  }

  Future<ApiResult<String>> confirmVerifierCode(
      {required String phoneNumber, required String code}) async {
    try {
      String body = json.encode({"phone": phoneNumber, "code": code});

      var response = await _dioClient
          .post('/api/v1/user/phone-verifier/confirm/', data: body);
      return ApiResult.success(
        data: response['phoneToken'],
      );
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<String>> verifyCode({
    required String phoneNumber,
    required String verifyCode,
  }) async {
    try {
      String body = json.encode({
        "phone": phoneNumber.replaceAll("-", ""),
        "code": verifyCode,
      });

      print(body);
      var response = await _dioClient
          .post('/api/v1/user/phone-verifier/confirm/', data: body);
      return ApiResult.success(
        data: response['phoneToken'],
      );
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<String>> emailVerifyRequest({
    required String email,
  }) async {
    try {
      String body = json.encode({"email": email});
      var response =
          await _dioClient.post('/api/v1/user/email-verifier/', data: body);
      return ApiResult.success(
        data: response,
      );
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<Map>> signUp(
      {required String password,
      required String phone,
      required String phoneToken,
      required String passwordConfirm}) async {
    try {
      String body = json.encode({
        "phone": phone,
        "password": password,
        "phone_token": phoneToken,
        "passwordConfirm": passwordConfirm
      });

      logger.w(body);

      var response =
          await _dioClient.post('/api/v1/user/register/', data: body);
      return ApiResult.success(data: response);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<Map>> signIn(
      {required String phoneNumber, required String password}) async {
    try {
      String body = json.encode({
        "phone": phoneNumber,
        "password": password,
      });

      logger.d(body);

      var response = await _dioClient.post('/api/v1/user/login/', data: body);
      return ApiResult.success(data: response);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<String?> getAccessToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('access');
    } on Exception {
      logger.d(Error);
    }
  }

  Future<ApiResult<Map>> requestFindingPassWordVerifier({
    required String phoneNumber,
  }) async {
    try {
      String body = json.encode({"phone": phoneNumber});
      var response =
          await _dioClient.post('/api/v1/user/password-reset/', data: body);
      return ApiResult.success(
        data: response['phone'],
      );
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
      );
    }
  }

  Future<ApiResult<Map>> updateUserProfile(
      Map<String, dynamic> updateUserProfile) async {
    try {
      String body = json.encode(updateUserProfile);
      var response = await _dioClient.put('/api/v1/user/profile/', data: body);

      return ApiResult.success(
        data: response,
      );
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
      );
    }
  }

  Future<ApiResult<String>> resetPassWord({
    required String phoneNumber,
    required String phoneToken,
    required String password,
    required String passwordConfirm,
  }) async {
    try {
      String body = json.encode({
        "phone": phoneNumber,
        "phone_token": phoneToken,
        "password": password,
        "password_confirm": passwordConfirm,
      });
      var response =
          await _dioClient.post('/api/v1/user/password-reset/', data: body);
      return ApiResult.success(
        data: response['phone'],
      );
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
