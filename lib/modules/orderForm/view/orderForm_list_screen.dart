import 'package:aroundus_app/repositories/order_repository/order_repository.dart';
import 'package:aroundus_app/modules/orderForm/view/orderForm_list_page.dart';
import 'package:aroundus_app/modules/orderForm/orderForm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrderFormListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderFormListScreenState();
}

class _OrderFormListScreenState extends State<OrderFormListScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black)),
        body: BlocProvider(
            create: (_) =>
                OrderFormCubit(RepositoryProvider.of<OrderRepository>(context)),
            child: OrderFormListPage()));
  }
}
