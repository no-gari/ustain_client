import 'package:aroundus_app/repositories/authentication_repository/authentication_repository.dart';
import 'package:aroundus_app/modules/authentication/account/cubit/finding_account_cubit.dart';
import 'package:aroundus_app/modules/authentication/account/view/finding_password_page.dart';
import 'package:aroundus_app/modules/authentication/bloc/authentication_bloc.dart';
import 'package:aroundus_app/modules/mypage/user_info/view/user_info_screen.dart';
import 'package:aroundus_app/modules/orderForm/view/orderForm_list_screen.dart';
import 'package:aroundus_app/modules/mypage/address/view/address_screen.dart';
import 'package:aroundus_app/repositories/user_repository/models/user.dart';
import 'package:aroundus_app/modules/store/coupon/view/coupon_screen.dart';
import 'package:aroundus_app/modules/authentication/authentication.dart';
import 'package:aroundus_app/support/base_component/company_info.dart';
import 'package:aroundus_app/support/base_component/login_needed.dart';
import 'package:aroundus_app/support/base_component/page_wire.dart';
import 'package:aroundus_app/repositories/repositories.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:aroundus_app/support/style/size_util.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:aroundus_app/support/style/theme.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'components/menu_widgets.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late User user;
  late bool is_authenticated;
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    user = context.read<AuthenticationBloc>().state.user;
    is_authenticated = context.read<AuthenticationBloc>().state.status ==
        AuthenticationStatus.authenticated;
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() => _packageInfo = info);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(children: [
          if (is_authenticated)
            Container(color: Colors.black, child: myPageInfo())
          else
            PageWire(child: LoginNeeded()),
          SizedBox(height: sizeWidth(5)),
          shoppingWire(context),
          SizedBox(height: sizeWidth(5)),
          helpcenterWire(context),
          SizedBox(height: sizeWidth(5)),
          helpcenterWire2(context),
          SizedBox(height: sizeWidth(5)),
          PageWire(
              child: Container(
                  child: Column(children: [
            menuWidget("ETC."),
            Container(
                width: sizeWidth(100),
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration:
                    BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('버전 정보',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: Adaptive.dp(14))),
                      Text(_packageInfo.version,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: Adaptive.dp(14)))
                    ]))
          ]))),
          SizedBox(height: Adaptive.h(5)),
          if (is_authenticated) logOutMethod(context),
          if (is_authenticated) SizedBox(height: Adaptive.h(5)),
          CompanyInfo()
        ]));
  }

  Row logOutMethod(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
          onTap: () => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(title: Text("로그아웃 하시겠습니까?"), actions: [
                  MaterialButton(
                      onPressed: () =>
                          RepositoryProvider.of<AuthenticationRepository>(
                                  context)
                              .logOut(),
                      child: Text("확인"))
                ]);
              }),
          child: Text('로그아웃',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.grey, decoration: TextDecoration.underline))),
      Container(
          height: 12,
          width: 1,
          color: Colors.black,
          margin: EdgeInsets.symmetric(horizontal: 30)),
      GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(title: Text("회원 탈퇴 하시겠습니까?"), actions: [
                    MaterialButton(
                        onPressed: () {
                          RepositoryProvider.of<AuthenticationRepository>(
                                  context)
                              .signOut();
                        },
                        child: Text("확인"))
                  ]);
                });
          },
          child: Text('회원탈퇴',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.grey, decoration: TextDecoration.underline)))
    ]);
  }

  PageWire helpcenterWire(BuildContext context) {
    return PageWire(
        child: Column(children: [
      menuWidget("SERVICE"),
      subMenuWidget(
          title: "비밀번호 수정",
          tapped: () {
            is_authenticated == true
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BlocProvider<FindingAccountCubit>(
                            create: (context) => FindingAccountCubit(
                                RepositoryProvider.of<AuthenticationRepository>(
                                    context)),
                            child: FindingPasswordPage())))
                : showLoginNeededDialog(context);
            ;
          }),
      subMenuWidget(
          title: "1:1 문의하기",
          tapped: () => isWebRouter(context, 'https://ed83p.channel.io'))
    ]));
  }

  PageWire helpcenterWire2(BuildContext context) {
    return PageWire(
        child: Column(children: [
      menuWidget("ABOUT"),
      subMenuWidget(
          title: "개인정보 처리방침",
          tapped: () =>
              isWebRouter(context, 'https://aroundusprivacypolicy.oopy.io/')),
      subMenuWidget(
          title: "서비스 이용약관",
          tapped: () => isWebRouter(context, 'https://arounduspp2.oopy.io/')),
      subMenuWidget(
          title: "개인정보 수집, 이용 방침",
          tapped: () =>
              isWebRouter(context, 'https://aroundusprivacypolicy.oopy.io/')),
    ]));
  }

  PageWire shoppingWire(BuildContext context) {
    return PageWire(
        child: Column(children: [
      menuWidget("SHOPPING"),
      subMenuWidget(
          title: "내 쿠폰",
          tapped: () {
            if (is_authenticated) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CouponScreen(isMypage: true)));
            } else {
              showLoginNeededDialog(context);
            }
          }),
      subMenuWidget(
          title: "배송지 관리",
          tapped: () {
            if (is_authenticated) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AddressScreen(isOrdering: false)));
            } else {
              showLoginNeededDialog(context);
            }
          }),
      subMenuWidget(
          title: "주문 내역",
          tapped: () {
            if (is_authenticated) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => OrderFormListScreen()));
            } else {
              showLoginNeededDialog(context);
            }
          })
    ]));
  }

  Widget myPageInfo() {
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, UserInfoScreen.routeName),
        child: PageWire(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Row(children: [
                Text("Lv.${user.group![0]['level']} ${user.name}",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white)),
                SizedBox(
                    height: Adaptive.dp(30),
                    width: Adaptive.dp(20),
                    child: IconButton(
                        padding: EdgeInsets.only(
                            left: Adaptive.dp(2), bottom: Adaptive.dp(20)),
                        onPressed: () => showTopSnackBar(
                            context,
                            CustomSnackBar.info(
                                message:
                                    "회원 등급은 매월 1일, \n이전 달의 기록에 따라 정해집니다. :)")),
                        iconSize: Adaptive.dp(15),
                        icon: Icon(Icons.info),
                        color: Colors.grey))
              ]),
              Container(
                  height: 3,
                  margin: EdgeInsets.only(top: 10, bottom: 15),
                  color: HexColor("${user.group![0]['hexCode']}")),
              userCategories(),
              SizedBox(height: 15)
            ])));
  }

  RichText userCategories() {
    return RichText(
        text: TextSpan(children: [
      for (var category in user.selectedCategories!)
        WidgetSpan(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                margin: EdgeInsets.only(right: 5, bottom: 3),
                decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(sizeWidth(5))),
                child: Text(category.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.white))))
    ]));
  }
}
