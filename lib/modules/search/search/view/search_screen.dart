import 'package:aroundus_app/support/base_component/title_with_underline.dart';
import 'package:aroundus_app/modules/search/search/view/search_page.dart';
import 'package:aroundus_app/support/base_component/base_component.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = '/search_screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white,
            elevation: 0),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          LeftPageWire(
              child: TitleWithUnderline(
                  title: 'SEARCH', subtitle: '상품 명, 브랜드 명을 검색해 주세요.')),
          PageWire(child: SearchPage())
        ])));
  }
}
