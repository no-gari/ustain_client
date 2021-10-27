import 'package:aroundus_app/modules/store/product/cubit/product_cubit.dart';
import 'package:aroundus_app/repositories/cart_repository/models/cart_temp.dart';
import 'package:aroundus_app/repositories/repositories.dart';
import 'package:aroundus_app/support/base_component/base_component.dart';
import 'package:aroundus_app/support/style/format_unit.dart';
import 'package:aroundus_app/support/style/size_util.dart';
import 'package:aroundus_app/support/style/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class ProductPurchaseSheet extends StatefulWidget {
  @override
  _ProductPurchaseSheetState createState() => _ProductPurchaseSheetState();
}

class _ProductPurchaseSheetState extends State<ProductPurchaseSheet> {
  late ProductCubit _productCubit;
  late Product _product;
  late double modalHeight;

  @override
  void initState() {
    super.initState();
    _productCubit = BlocProvider.of<ProductCubit>(context);
    _product = _productCubit.state.products!.first;
    modalHeight = _product.options!.length * 5 + 20;
  }

  /*
  selectedOptions : 사용자가 선택한 옵션
  - 옵션 조합마다 Id값이 유니크해서, type씩 맵핑해줘야함

  quantity : 구매할 옵션의 수량
  */
  late List<TypeGroup> selectedOptions = List.generate(
      _product.options!.length,
          (index) =>
          TypeGroup(
              option: Option(
                  Id: _product.options![index].Id,
                  name: _product.options![index].name)));

  int selected = 0;
  bool hasCart = false;
  List<CartTemp> cartTempList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
        builder: (context, comments) {
          hasCart = !selectedOptions
              .map((e) => e.variation != null)
              .toList()
              .contains(false);

          return Container(
            height: Adaptive.h(65),
            padding: EdgeInsets.only(top: Adaptive.h(5)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PageWire(
                  child: hasCart
                      ? GestureDetector(
                    onTap: () {
                      print(selectedOptions);

                      setState(() {
                        selectedOptions = List.generate(
                            _product.options!.length,
                                (index) =>
                                TypeGroup(
                                    option: Option(
                                        Id: _product.options![index].Id,
                                        name: _product.options![index].name)));
                      });
                    },
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "옵션을 선택해주세요",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          Icon(Icons.keyboard_arrow_down_sharp),
                        ],
                      ),
                    ),
                  )
                      : Wrap(
                      runSpacing: 5,
                      children: optionPurchase(_product.options!)),
                ),
                hasCart
                    ? Expanded(
                  child: Container(
                      padding: basePadding(),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey),
                            ),
                            minVerticalPadding: 15,
                            title: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${cartTempList[index].variants!
                                      .variantName}",
                                  style: theme.textTheme.bodyText2,
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.centerRight,
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    print(cartTempList);

                                    if (index == 0 &&
                                        cartTempList.length == 1) {
                                      setState(() {
                                        cartTempList = [];
                                        selectedOptions = List.generate(
                                            _product.options!.length,
                                                (index) =>
                                                TypeGroup(
                                                    option: Option(
                                                        Id: _product
                                                            .options![index].Id,
                                                        name: _product
                                                            .options![index]
                                                            .name)));
                                      });
                                    } else {
                                      setState(() {
                                        cartTempList.removeAt(index);
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            subtitle: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: Adaptive.h(5),
                                  margin: EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: () {
                                          setState(() {
                                            if (cartTempList[index]
                                                .quantity! >
                                                1) {
                                              cartTempList[
                                              index] = cartTempList[
                                              index]
                                                  .copyWith(
                                                  quantity:
                                                  cartTempList[index]
                                                      .quantity! -
                                                      1);
                                            }
                                          });
                                        },
                                      ),
                                      Text("${cartTempList[index].quantity}"),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            if (cartTempList[index]
                                                .quantity! <
                                                100) {
                                              cartTempList[
                                              index] = cartTempList[
                                              index]
                                                  .copyWith(
                                                  quantity:
                                                  cartTempList[index]
                                                      .quantity! +
                                                      1);
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                    "${currencyFromString(
                                        (cartTempList[index].variants!
                                            .discountPrice! *
                                            cartTempList[index].quantity!)
                                            .toString())}",
                                    style: theme.textTheme.bodyText1!
                                        .copyWith(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          );
                        },
                        itemCount: cartTempList.length,
                        separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 10),
                      )),
                )
                    : SizedBox(height: 0),
                cartTempList.length > 0 ? purchaseSummary() : SizedBox(
                    height: 0),
                Container(
                  height: Adaptive.h(10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _productCubit.createCard(_product, cartTempList);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("장바구니에 상품이 담겼습니다."),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: Text("확인"),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Container(
                            width: sizeWith(50),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              color: Colors.white,
                            ),
                            child: Text("장바구니 담기", style: theme.textTheme
                                .button)),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO 오더 쪽 하면 작업
                        },
                        child: Container(
                            color: Colors.black,
                            width: sizeWith(50),
                            alignment: Alignment.center,
                            child: Text(
                              "구매하기",
                              style: theme.textTheme.button!
                                  .copyWith(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  List<Widget> optionPurchase(List<Option> options) {
    return List.generate(
        options.length,
            (i) =>
            Card(
              child: ExpansionTile(
                  key: GlobalKey(),
                  title: RichText(
                    text:
                    TextSpan(style: theme.textTheme.bodyText1!, children: [
                      TextSpan(text: "${options[i].name} "),
                      TextSpan(
                          text:
                          "${selectedOptions[i].variation == null
                              ? ""
                              : selectedOptions[i].variation!.value}"),
                    ]),
                  ),
                  // maintainState: true,
                  initiallyExpanded: i == selected,
                  children: ListTile.divideTiles(
                      color: Colors.grey[200],
                      tiles: List.generate(
                          options[i].variations!.length,
                              (index) =>
                              ListTile(
                                title: Text(
                                    "${options[i].variations![index].value}"),
                                onTap: () {
                                  // 선택 옵션 추가
                                  setState(() {
                                    selectedOptions[i] = selectedOptions[i]
                                        .copyWith(
                                        variation:
                                        options[i].variations![index]);
                                    selected = selected + 1;
                                  });

                                  if (!selectedOptions
                                      .map((e) => e.variation != null)
                                      .toList()
                                      .contains(false)) {
                                    // cartTemp 생성

                                    Variants? variant;

                                    _product.variants!.forEach((element) {
                                      if (listEquals(
                                          element.types, selectedOptions)) {
                                        variant = element;
                                      }
                                    });


                                    bool generated = false;
                                    // 이미 생성되어 있는 경우
                                    cartTempList.forEach((element) {
                                      if(listEquals(element.variants!.types, selectedOptions)){
                                        index = cartTempList.indexOf(element);
                                        setState(() {
                                          generated = true;
                                          cartTempList[index] = cartTempList[index].copyWith(quantity: cartTempList[index].quantity!+1);
                                        });
                                      }
                                    });

                                    if(!generated) {
                                      setState(() {
                                        selected = 0;
                                        cartTempList.add(CartTemp(
                                            variants: variant, quantity: 1));
                                      });
                                    }
                                  }
                                },
                              ))).toList()),
            ));
  }

  Widget purchaseSummary() {
    num total = cartTempList.fold(
        0,
            (pre, cartTemp) =>
        pre + (cartTemp.quantity! * cartTemp.variants!.discountPrice!));

    return Container(
      padding: basePadding(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: theme.dividerColor),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("총 ${cartTempList.length}개의 상품"),
          RichText(
            text: TextSpan(style: theme.textTheme.bodyText2, children: [
              TextSpan(text: "총 금액 "),
              TextSpan(
                  text: "${currencyFromString(total.toString())}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
            ]),
          )
        ],
      ),
    );
  }

  List<Widget> productQuantity() {
    return [
      Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "수량",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Adaptive.sp(15)),
            ),
          ],
        ),
      )
    ];
  }
}