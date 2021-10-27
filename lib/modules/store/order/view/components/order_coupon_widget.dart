import 'package:aroundus_app/modules/store/coupon/cubit/coupon_cubit.dart';
import 'package:aroundus_app/modules/store/order/cubit/order_cubit.dart';
import 'package:aroundus_app/repositories/coupon_repository/models/coupon.dart';
import 'package:aroundus_app/support/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

Widget orderCoupon(BuildContext context, Coupon? coupon,
    CouponCubit couponCubit, OrderCubit orderCubit) {
  print(coupon);

  return Wrap(runSpacing: 15, children: [
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text("쿠폰 할인가"),
      RichText(
        text: TextSpan(style: theme.textTheme.bodyText1, children: [
          TextSpan(
              text: "${coupon!.discount == null ? 0 : coupon.discount}",
              style: TextStyle(
                  color: theme.accentColor, fontWeight: FontWeight.w700)),
          TextSpan(text: "원"),
        ]),
      ),
    ]),
    Row(
      children: [
        Container(
          height: 30,
          width: Adaptive.w(60),
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Text("${coupon.name == null ? "" : coupon.name}"),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'coupon_screen').then((onValue) async {
                print("쿠폰 선택해라");
                orderCubit.getCoupon(onValue);
              });
            },
            child: Container(
              height: 30,
              color: Colors.black,
              alignment: Alignment.center,
              child: Text(
                "쿠폰 선택하기",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ),
  ]);
}