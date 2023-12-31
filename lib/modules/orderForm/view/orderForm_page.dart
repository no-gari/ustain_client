import 'dart:io';

import 'package:aroundus_app/repositories/order_repository/models/models.dart';
import 'package:aroundus_app/modules/orderForm/cubit/orderForm_cubit.dart';
import 'package:aroundus_app/support/base_component/base_component.dart';
import 'package:aroundus_app/support/style/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/components.dart';

class OrderFormPage extends StatefulWidget {
  OrderFormPage(this.orderId, this.viewingNavigator);

  final String orderId;
  final bool viewingNavigator;

  @override
  State<StatefulWidget> createState() => _OrderFormPageState();
}

class _OrderFormPageState extends State<OrderFormPage>
    with SingleTickerProviderStateMixin {
  String get orderId => this.widget.orderId;

  bool get viewingNavigator => this.widget.viewingNavigator;

  late OrderFormCubit _orderFormCubit;
  late OrderForm orderForm;

  @override
  void initState() {
    super.initState();
    _orderFormCubit = BlocProvider.of<OrderFormCubit>(context);
    _orderFormCubit.getOrderFormById(orderId);
  }

  @override
  void dispose() {
    super.dispose();
    _orderFormCubit.getOrderForm();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
        appBar: viewingNavigator
            ? AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black))
            : AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: false,
                title: GestureDetector(
                    child: Icon(
                        Platform.isAndroid
                            ? Icons.arrow_back
                            : Icons.arrow_back_ios_outlined,
                        color: Colors.black),
                    onTap: () {
                      Navigator.pushNamed(context, '');
                    })),
        body: SingleChildScrollView(child:
            BlocBuilder<OrderFormCubit, OrderFormState>(
                builder: (context, state) {
          if (state.isLoaded) {
            orderForm = _orderFormCubit.state.orderForm!.first;
            return PageWire(
                child: Wrap(runSpacing: 10, children: [
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text("${orderForm.orderDate}",
                        style: theme.textTheme.bodyText1!
                            .copyWith(fontWeight: FontWeight.w700)),
                    Text(
                      "주문번호 ${orderForm.Id}",
                      style: TextStyle(color: Color(0xFF606060)),
                    ),
                    Container(
                        height: 1,
                        width: double.maxFinite,
                        color: Colors.black,
                        margin: EdgeInsets.only(top: 5))
                  ])),
              orderFormOrderItemsWidget(orderForm.itemsInfo!),
              orderFormPaymentsWidget(orderForm.paymentInfo!),
              orderFormCustomerWidget(orderForm.customerInfo!),
              orderFormAddressWidget(orderForm.addressInfo!)
            ]));
          } else {
            return Center(child: Image.asset('assets/images/indicator.gif'));
          }
        })));
  }
}
