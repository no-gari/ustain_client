import 'package:aroundus_app/modules/magazine/magazine_detail/cubit/magazine_detail_cubit.dart';
import 'package:aroundus_app/modules/magazine/magazine_detail/view/magazine_detail_page.dart';
import 'package:aroundus_app/repositories/magazine_repository/src/magazine_repository.dart';
import 'package:aroundus_app/repositories/magazine_repository/models/magazine.dart';
import 'package:aroundus_app/modules/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:aroundus_app/support/style/size_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class BannerMagazines extends StatefulWidget {
  final List<Magazine> bannerMagazines;

  BannerMagazines(this.bannerMagazines);

  @override
  _BannerMagazinesState createState() => _BannerMagazinesState();
}

class _BannerMagazinesState extends State<BannerMagazines> {
  late List<Magazine> _bannerMagazines = widget.bannerMagazines;

  @override
  Widget build(BuildContext context) {
    return Swiper(
        scrollDirection: Axis.horizontal,
        onTap: (int index) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                      value: BlocProvider.of<AuthenticationBloc>(context),
                      child: MultiBlocProvider(
                          providers: [
                            BlocProvider(
                                create: (context) => MagazineDetailCubit(
                                    RepositoryProvider.of<MagazineRepository>(
                                        context)))
                          ],
                          child: MagazineDetailPage(
                              id: _bannerMagazines[index].id,
                              isNotice: true)))));
        },
        itemCount: _bannerMagazines.length,
        itemBuilder: (BuildContext context, int index) =>
            Stack(fit: StackFit.expand, children: [
              Positioned(
                  child: Image.network(_bannerMagazines[index].bannerImage!,
                      fit: BoxFit.cover)),
              Positioned(
                  height: 250,
                  width: sizeWidth(100),
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                        Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0),
                        Theme.of(context).scaffoldBackgroundColor.withOpacity(1)
                      ])))),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizeWidth(5), vertical: sizeWidth(8)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(_bannerMagazines[index].title!,
                            style: Theme.of(context).textTheme.headline4),
                        SizedBox(height: 10),
                        Text(_bannerMagazines[index].subtitle!,
                            style: Theme.of(context).textTheme.bodyText2!),
                        SizedBox(height: 5),
                      ]))
            ]),
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: new DotSwiperPaginationBuilder(
                color: Colors.grey, activeColor: Colors.white)));
  }
}
