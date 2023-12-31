import 'dart:io';

import 'package:aroundus_app/modules/store/product/product_detail/view/product_detail_page.dart';
import 'package:aroundus_app/repositories/product_repository/src/product_repository.dart';
import 'package:aroundus_app/modules/brands/brand_detail/cubit/brand_detail_cubit.dart';
import 'package:aroundus_app/repositories/brand_repository/src/brand_repository.dart';
import 'package:aroundus_app/modules/authentication/bloc/authentication_bloc.dart';
import 'package:aroundus_app/modules/store/product/cubit/product_cubit.dart';
import 'package:aroundus_app/modules/magazine/cubit/magazine_cubit.dart';
import 'package:aroundus_app/support/style/format_unit.dart';
import 'package:aroundus_app/support/style/size_util.dart';
import 'package:aroundus_app/support/style/theme.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CatalogPage extends StatefulWidget {
  CatalogPage({required this.id});

  final int id;

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  int get _id => this.widget.id;
  late MagazineCubit _magazineCubit;

  @override
  void initState() {
    _magazineCubit = BlocProvider.of<MagazineCubit>(context);
    _magazineCubit.getCatalogMagazineDetail(_id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<MagazineCubit, MagazineState>(builder: (context, state) {
      return state.catalogMagazineDetail != null
          ? CustomScrollView(slivers: [
              SliverAppBar(
                  systemOverlayStyle: SystemUiOverlayStyle.dark,
                  leading: IconButton(
                      icon: Icon(
                          Platform.isAndroid
                              ? Icons.arrow_back
                              : Icons.arrow_back_ios_outlined,
                          color: Colors.black),
                      onPressed: () => Navigator.of(context).pop()),
                  backgroundColor: Colors.white,
                  expandedHeight: Adaptive.w(100),
                  floating: false,
                  pinned: false,
                  snap: false,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Stack(children: [
                    Image.network(state.catalogMagazineDetail!.bannerImage!,
                        fit: BoxFit.cover,
                        height: sizeWidth(100) + AppBar().preferredSize.height),
                    Container(
                        height: sizeWidth(30),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                              Colors.white.withOpacity(0.8),
                              Colors.white.withOpacity(0)
                            ])))
                  ]))),
              SliverToBoxAdapter(
                  child: Padding(
                      padding: EdgeInsets.all(sizeWidth(5)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('#${state.catalogMagazineDetail!.title}',
                                style: Theme.of(context).textTheme.headline5),
                            SizedBox(height: 5),
                            Text('${state.catalogMagazineDetail!.description}')
                          ]))),
              SliverToBoxAdapter(
                  child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: sizeWidth(5)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(height: 3, color: Colors.grey),
                                SizedBox(height: 12),
                                Text('PRODUCTS',
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                SizedBox(height: 12),
                                GridView.count(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: sizeWidth(5),
                                    mainAxisSpacing: sizeWidth(0),
                                    childAspectRatio: 0.6,
                                    children: [
                                      for (var product in state
                                          .catalogMagazineDetail!.products!)
                                        productGridTile(product: product)
                                    ])
                              ]))))
            ])
          : Container();
    }));
  }
}

class productGridTile extends StatelessWidget {
  const productGridTile({required this.product});

  final Map product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<AuthenticationBloc>(context),
                      child: MultiBlocProvider(providers: [
                        BlocProvider<ProductCubit>(
                            create: (_) => ProductCubit(
                                RepositoryProvider.of<ProductRepository>(
                                    context))),
                        BlocProvider<BrandDetailCubit>(
                            create: (_) => BrandDetailCubit(
                                RepositoryProvider.of<BrandRepository>(
                                    context)))
                      ], child: ProductDetailPage(product['Id'])))));
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              height: Adaptive.w(40),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(product['thumbnail']!)))),
          SizedBox(height: 5),
          SizedBox(
              child: Text('${product['brand']!}',
                  style: TextStyle(
                      fontSize: Adaptive.dp(10), color: Colors.grey))),
          SizedBox(
              child: Text('${product['name']!}',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: Adaptive.dp(12)),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis)),
          SizedBox(
              child: Text(
                  '${currencyFromString(product['discountPrice']!.toString())}',
                  style: theme.textTheme.bodyText1!
                      .copyWith(height: 1.5, fontSize: Adaptive.dp(12))))
        ]));
  }
}
