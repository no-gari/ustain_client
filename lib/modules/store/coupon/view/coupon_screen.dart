import 'package:aroundus_app/modules/store/coupon/cubit/coupon_cubit.dart';
import 'package:aroundus_app/repositories/coupon_repository/src/coupon_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'coupon_page.dart';

class CouponScreen extends StatefulWidget {
  static String routeName = '/coupon_screen';
  final bool? isMypage;

  CouponScreen({this.isMypage = false});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => CouponScreen());
  }

  @override
  State<CouponScreen> createState() => _CouponScreen();
}

class _CouponScreen extends State<CouponScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: BlocProvider<CouponCubit>(
        create: (context) =>
            CouponCubit(RepositoryProvider.of<CouponRepository>(context)),
        child: CouponPage(isMypage: widget.isMypage),
      ),
    );
  }
}
