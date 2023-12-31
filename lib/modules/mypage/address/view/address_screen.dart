import 'package:aroundus_app/modules/mypage/address/cubit/address_cubit.dart';
import 'package:aroundus_app/repositories/address_repository/src/address_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'address_page.dart';

class AddressScreen extends StatefulWidget {
  static String routeName = '/address_screen';

  final bool isOrdering;

  AddressScreen({
    Key? key,
    required this.isOrdering,
  }) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreen();
}

class _AddressScreen extends State<AddressScreen>
    with SingleTickerProviderStateMixin {
  bool? get isOrdering => this.widget.isOrdering;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: BlocProvider<AddressCubit>(
        create: (context) =>
            AddressCubit(RepositoryProvider.of<AddressRepository>(context)),
        child: AddressPage(isOrdering: isOrdering!),
      ),
    );
  }
}
