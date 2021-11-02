import 'package:aroundus_app/repositories/order_repository/models/models.dart';
import 'package:aroundus_app/repositories/order_repository/src/order_repository.dart';
import 'package:aroundus_app/support/networks/api_result.dart';
import 'package:aroundus_app/support/networks/network_exceptions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this._orderRepository) : super(const PaymentState());
  final OrderRepository _orderRepository;

  Future<void> createOrder(Map<String, dynamic> orderTemp) async {
    ApiResult<Order> apiResult = await _orderRepository.createOrder(orderTemp);

    apiResult.when(success: (Order? response) {
      emit(state.copyWith(order: response!, isLoaded: true, isLoading: false));
      print(state.order);
    }, failure: (NetworkExceptions? error) {
      emit(state.copyWith(
        error: error,
        errorMessage: NetworkExceptions.getErrorMessage(error!),
      ));
    });
  }
}
