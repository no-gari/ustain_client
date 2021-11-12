import 'package:aroundus_app/modules/authentication/bloc/authentication_bloc.dart';
import 'package:aroundus_app/modules/magazine/cubit/magazine_cubit.dart';
import 'package:aroundus_app/repositories/magazine_repository/src/magazine_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home_screen';

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  late AuthenticationBloc _authenticationBloc;

  @override
  bool get wantKeepAlive => true;

  @override
  void initSate() {
    super.initState();
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => MagazineCubit(
                  RepositoryProvider.of<MagazineRepository>(context)))
        ],
        child: Scaffold(
          backgroundColor: Colors.black,
          body: HomePage(),
        ));
  }
}
