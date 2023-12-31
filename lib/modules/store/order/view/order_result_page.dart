import 'package:aroundus_app/modules/store/cart/view/cart_screen.dart';
import 'package:aroundus_app/repositories/order_repository/order_repository.dart';
import 'package:aroundus_app/modules/orderForm/cubit/orderForm_cubit.dart';
import 'package:aroundus_app/modules/orderForm/view/orderForm_page.dart';
import 'package:aroundus_app/support/base_component/base_component.dart';
import 'package:aroundus_app/support/style/size_util.dart';
import 'package:aroundus_app/support/style/theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class OrderResultPage extends StatelessWidget {
  static String routeName = '/order_result_page';

  OrderResultPage(this.result);

  final Map<String, String> result;

  bool getIsSuccessed(Map<String, String> result) {
    if (result['imp_success'] == 'true') {
      return true;
    }
    if (result['success'] == 'true') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    bool isSuccessed = getIsSuccessed(result);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        body: PageWire(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Container(
                  margin: EdgeInsets.only(top: Adaptive.h(25)),
                  child: Column(children: [
                    SvgPicture.asset(
                      isSuccessed
                          ? 'assets/icons/success.svg'
                          : 'assets/icons/error.svg',
                      color: theme.accentColor,
                      width: sizeWidth(35),
                    ),
                    Text(isSuccessed ? '주문 완료!' : '주문 실패!',
                        style: theme.textTheme.headline1!.copyWith(height: 1.5))
                  ])),
              Container(
                  child: Column(children: <Widget>[
                Wrap(runSpacing: 10, children: [
                  if (isSuccessed)
                    PlainButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BlocProvider<OrderFormCubit>(
                                      create: (_) => OrderFormCubit(
                                          RepositoryProvider.of<
                                              OrderRepository>(context)),
                                      child: OrderFormPage(
                                          result['merchant_uid']!, false))),
                              (route) => false);
                        },
                        text: '주문내역 확인'),
                  PlainButton(
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                          context, '', (route) => false),
                      text: '더 둘러보기',
                      textColor: theme.accentColor,
                      color: Colors.white,
                      borderColor: theme.accentColor),
                  SizedBox(height: Adaptive.h(10))
                ])
              ]))
            ])));
  }
}
