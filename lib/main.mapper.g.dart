// This file has been generated by the dart_json_mapper package.
// https://github.com/k-paxian/dart-json-mapper
// @dart = 2.12
import 'package:aroundus_app/repositories/address_repository/models/address.dart' as x19 show Address;
import 'package:aroundus_app/repositories/cart_repository/models/cart.dart' as x23 show Cart;
import 'package:aroundus_app/repositories/cart_repository/models/cart_temp.dart' as x14 show CartTemp;
import 'package:aroundus_app/repositories/coupon_repository/models/coupon.dart' as x15 show Coupon;
import 'package:aroundus_app/repositories/magazine_repository/models/catalog.dart' as x12 show Catalog;
import 'package:aroundus_app/repositories/magazine_repository/models/magazine.dart' as x2 show Magazine;
import 'package:aroundus_app/repositories/magazine_repository/models/magazine_category.dart' as x3 show MagazineCategory;
import 'package:aroundus_app/repositories/magazine_repository/models/magazine_comment.dart' as x11 show MagazineComment;
import 'package:aroundus_app/repositories/magazine_repository/models/magazine_detail.dart' as x4 show MagazineDetail;
import 'package:aroundus_app/repositories/order_repository/models/customer_requests.dart' as x16 show CustomerRequests;
import 'package:aroundus_app/repositories/order_repository/models/order.dart' as x18 show Order;
import 'package:aroundus_app/repositories/order_repository/models/order_form.dart' as x22 show OrderForm;
import 'package:aroundus_app/repositories/order_repository/models/order_item.dart' as x21 show OrderItem;
import 'package:aroundus_app/repositories/order_repository/models/order_temp.dart' as x20 show OrderTemp;
import 'package:aroundus_app/repositories/order_repository/models/shipping_request.dart' as x17 show ShippingRequest;
import 'package:aroundus_app/repositories/product_repository/models/brand.dart' as x6 show Brand;
import 'package:aroundus_app/repositories/product_repository/models/product.dart' as x5 show Product;
import 'package:aroundus_app/repositories/product_repository/models/product_composition/option.dart' as x7 show Option;
import 'package:aroundus_app/repositories/product_repository/models/product_composition/type_group.dart' as x9 show TypeGroup;
import 'package:aroundus_app/repositories/product_repository/models/product_composition/variants.dart' as x10 show Variants;
import 'package:aroundus_app/repositories/product_repository/models/product_composition/variation.dart' as x8 show Variation;
import 'package:aroundus_app/repositories/store_repository/models/collection.dart' as x1 show Collection;
import 'package:aroundus_app/repositories/store_repository/models/menu.dart' as x0 show Menu;
import 'package:aroundus_app/support/networks/page_response.dart' as x13 show PageResponse;
import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper, JsonMapperAdapter, typeOf;

// ignore_for_file: invalid_language_version_override
// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.
// @dart = 2.12

import 'dart:core';
import 'package:dart_json_mapper/src/model/annotations.dart' as prefix0;
import 'package:iamport_flutter/model/payment_data.dart' as prefix1;
import 'package:iamport_flutter/model/pg/naver/naver_interface.dart' as prefix2;
import 'package:iamport_flutter/model/pg/naver/naver_products.dart' as prefix4;
import 'package:iamport_flutter/model/url_data.dart' as prefix3;

// ignore_for_file: prefer_adjacent_string_concatenation
// ignore_for_file: prefer_collection_literals
// ignore_for_file: unnecessary_const
// ignore_for_file: implementation_imports

// ignore:unused_import
import 'package:reflectable/mirrors.dart' as m;
// ignore:unused_import
import 'package:reflectable/src/reflectable_builder_based.dart' as r;
// ignore:unused_import
import 'package:reflectable/reflectable.dart' as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{const prefix0.JsonSerializable(): r.ReflectorData(<m.TypeMirror>[r.NonGenericClassMirrorImpl(r'PaymentData', r'.PaymentData', 7, 0, const prefix0.JsonSerializable(), const <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 110], const <int>[111, 112, 113, 114, 115, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109], const <int>[], -1, {}, {}, {r'': (bool b) => ({pg, payMethod, escrow, merchantUid, name, amount, customData, taxFree, vat, currency, language, buyerName, buyerTel, buyerEmail, buyerAddr, buyerPostcode, noticeUrl, digital, vbankDue, mRedirectUrl = prefix3.UrlData.redirectUrl, appScheme, bizNum, customerUid, popup, naverUseCfm, naverPopupMode, naverProducts, naverCultureBenefit, naverProductCode, naverActionType, naverInterface, period, company, niceMobileV2}) => b ? prefix1.PaymentData(bizNum: bizNum, buyerAddr: buyerAddr, buyerEmail: buyerEmail, buyerName: buyerName, buyerPostcode: buyerPostcode, company: company, currency: currency, customData: customData, customerUid: customerUid, digital: digital, escrow: escrow, language: language, mRedirectUrl: mRedirectUrl, name: name, naverActionType: naverActionType, naverCultureBenefit: naverCultureBenefit, naverInterface: naverInterface, naverPopupMode: naverPopupMode, naverProductCode: naverProductCode, naverProducts: naverProducts, naverUseCfm: naverUseCfm, niceMobileV2: niceMobileV2, noticeUrl: noticeUrl, period: period, pg: pg, popup: popup, taxFree: taxFree, vat: vat, vbankDue: vbankDue, amount: amount, appScheme: appScheme, buyerTel: buyerTel, merchantUid: merchantUid, payMethod: payMethod) : null}, -1, 0, const <int>[], const [prefix0.jsonSerializable, const prefix0.Json(ignoreNullMembers: true)], null), r.NonGenericClassMirrorImpl(r'NaverInterface', r'.NaverInterface', 7, 1, const prefix0.JsonSerializable(), const <int>[35, 36, 37, 38, 39, 126], const <int>[111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125], const <int>[], -1, {}, {}, {r'': (bool b) => ({cpaInflowCode, naverInflowCode, saClickId, merchantCustomCode1, merchantCustomCode2}) => b ? prefix2.NaverInterface(cpaInflowCode: cpaInflowCode, merchantCustomCode1: merchantCustomCode1, merchantCustomCode2: merchantCustomCode2, naverInflowCode: naverInflowCode, saClickId: saClickId) : null}, -1, 1, const <int>[], const [prefix0.jsonSerializable, const prefix0.Json(ignoreNullMembers: true)], null)], <m.DeclarationMirror>[r.VariableMirrorImpl(r'pg', 32773, 0, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const []), r.VariableMirrorImpl(r'payMethod', 32773, 0, const prefix0.JsonSerializable(), -1, 3, 3, const <int>[], const [const prefix0.JsonProperty(name: 'pay_method')]), r.VariableMirrorImpl(r'escrow', 32773, 0, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const []), r.VariableMirrorImpl(r'merchantUid', 32773, 0, const prefix0.JsonSerializable(), -1, 3, 3, const <int>[], const [const prefix0.JsonProperty(name: 'merchant_uid')]), r.VariableMirrorImpl(r'name', 32773, 0, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const []), r.VariableMirrorImpl(r'amount', 32773, 0, const prefix0.JsonSerializable(), -1, 5, 5, const <int>[], const []), r.VariableMirrorImpl(r'customData', 2129925, 0, const prefix0.JsonSerializable(), -1, 6, 7, const <int>[3, 3], const [const prefix0.JsonProperty(name: 'custom_data')]), r.VariableMirrorImpl(r'taxFree', 32773, 0, const prefix0.JsonSerializable(), -1, 8, 8, const <int>[], const [const prefix0.JsonProperty(name: 'tax_free')]), r.VariableMirrorImpl(r'vat', 32773, 0, const prefix0.JsonSerializable(), -1, 8, 8, const <int>[], const []), r.VariableMirrorImpl(r'currency', 32773, 0, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const []), r.VariableMirrorImpl(r'language', 32773, 0, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const []), r.VariableMirrorImpl(r'buyerName', 32773, 0, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [const prefix0.JsonProperty(name: 'buyer_name')]), r.VariableMirrorImpl(r'buyerTel', 32773, 0, const prefix0.JsonSerializable(), -1, 3, 3, const <int>[], const [const prefix0.JsonProperty(name: 'buyer_tel')]), r.VariableMirrorImpl(r'buyerEmail', 32773, 0, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [const prefix0.JsonProperty(name: 'buyer_email')]), r.VariableMirrorImpl(r'buyerAddr', 32773, 0, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [const prefix0.JsonProperty(name: 'buyer_addr')]), r.VariableMirrorImpl(r'buyerPostcode', 32773, 0, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [const prefix0.JsonProperty(name: 'buyer_postcode')]), r.VariableMirrorImpl(r'noticeUrl', 32773, 0, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [const prefix0.JsonProperty(name: 'notice_url')]), r.VariableMirrorImpl(r'displayCardQuota', 2129925, 0, const prefix0.JsonSerializable(), -1, 9, 10, const <int>[5], const [const prefix0.JsonProperty(name: 'display/card_quota')]), r.VariableMirrorImpl(r'digital', 32773, 0, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const []), r.VariableMirrorImpl(r'vbankDue', 32773, 0, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [const prefix0.JsonProperty(name: 'vbank_due')]), r.VariableMirrorImpl(r'mRedirectUrl', 32773, 0, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [const prefix0.JsonProperty(name: 'm_redirect_url')]), r.VariableMirrorImpl(r'appScheme', 32773, 0, const prefix0.JsonSerializable(), -1, 3, 3, const <int>[], const [const prefix0.JsonProperty(name: 'app_scheme')]), r.VariableMirrorImpl(r'bizNum', 32773, 0, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [const prefix0.JsonProperty(name: 'biz_num')]), r.VariableMirrorImpl(r'customerUid', 32773, 0, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [const prefix0.JsonProperty(name: 'customer_uid')]), r.VariableMirrorImpl(r'popup', 32773, 0, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const []), r.VariableMirrorImpl(r'naverUseCfm', 32773, 0, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const []), r.VariableMirrorImpl(r'naverPopupMode', 32773, 0, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const []), r.VariableMirrorImpl(r'naverProducts', 2129925, 0, const prefix0.JsonSerializable(), -1, 11, 12, const <int>[13], const []), r.VariableMirrorImpl(r'naverCultureBenefit', 32773, 0, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const []), r.VariableMirrorImpl(r'naverProductCode', 32773, 0, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const []), r.VariableMirrorImpl(r'naverActionType', 32773, 0, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const []), r.VariableMirrorImpl(r'naverInterface', 32773, 0, const prefix0.JsonSerializable(), 1, 1, 1, const <int>[], const []), r.VariableMirrorImpl(r'period', 2129925, 0, const prefix0.JsonSerializable(), -1, 6, 7, const <int>[3, 3], const []), r.VariableMirrorImpl(r'company', 32773, 0, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const []), r.VariableMirrorImpl(r'niceMobileV2', 32773, 0, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const []), r.VariableMirrorImpl(r'cpaInflowCode', 32773, 1, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const []), r.VariableMirrorImpl(r'naverInflowCode', 32773, 1, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const []), r.VariableMirrorImpl(r'saClickId', 32773, 1, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const []), r.VariableMirrorImpl(r'merchantCustomCode1', 32773, 1, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const []), r.VariableMirrorImpl(r'merchantCustomCode2', 32773, 1, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const []), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 0, 40), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 0, 41), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 1, 42), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 1, 43), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 2, 44), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 2, 45), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 3, 46), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 3, 47), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 4, 48), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 4, 49), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 5, 50), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 5, 51), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 6, 52), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 6, 53), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 7, 54), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 7, 55), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 8, 56), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 8, 57), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 9, 58), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 9, 59), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 10, 60), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 10, 61), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 11, 62), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 11, 63), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 12, 64), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 12, 65), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 13, 66), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 13, 67), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 14, 68), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 14, 69), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 15, 70), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 15, 71), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 16, 72), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 16, 73), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 17, 74), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 17, 75), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 18, 76), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 18, 77), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 19, 78), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 19, 79), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 20, 80), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 20, 81), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 21, 82), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 21, 83), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 22, 84), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 22, 85), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 23, 86), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 23, 87), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 24, 88), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 24, 89), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 25, 90), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 25, 91), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 26, 92), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 26, 93), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 27, 94), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 27, 95), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 28, 96), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 28, 97), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 29, 98), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 29, 99), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 30, 100), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 30, 101), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 31, 102), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 31, 103), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 32, 104), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 32, 105), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 33, 106), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 33, 107), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 34, 108), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 34, 109), r.MethodMirrorImpl(r'', 0, 0, -1, 0, 0, const <int>[], const <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33], const prefix0.JsonSerializable(), const []), r.MethodMirrorImpl(r'==', 131074, -1, -1, 14, 14, const <int>[], const <int>[69], const prefix0.JsonSerializable(), const []), r.MethodMirrorImpl(r'toString', 131074, -1, -1, 3, 3, const <int>[], const <int>[], const prefix0.JsonSerializable(), const []), r.MethodMirrorImpl(r'noSuchMethod', 65538, -1, -1, -1, -1, const <int>[], const <int>[70], const prefix0.JsonSerializable(), const []), r.MethodMirrorImpl(r'hashCode', 131075, -1, -1, 5, 5, const <int>[], const <int>[], const prefix0.JsonSerializable(), const []), r.MethodMirrorImpl(r'runtimeType', 131075, -1, -1, 15, 15, const <int>[], const <int>[], const prefix0.JsonSerializable(), const []), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 35, 116), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 35, 117), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 36, 118), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 36, 119), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 37, 120), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 37, 121), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 38, 122), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 38, 123), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 39, 124), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 39, 125), r.MethodMirrorImpl(r'', 0, 1, -1, 1, 1, const <int>[], const <int>[71, 72, 73, 74, 75], const prefix0.JsonSerializable(), const [])], <m.ParameterMirror>[r.ParameterMirrorImpl(r'pg', 46086, 110, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #pg), r.ParameterMirrorImpl(r'payMethod', 41990, 110, const prefix0.JsonSerializable(), -1, 3, 3, const <int>[], const [], null, #payMethod), r.ParameterMirrorImpl(r'escrow', 46086, 110, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [], null, #escrow), r.ParameterMirrorImpl(r'merchantUid', 41990, 110, const prefix0.JsonSerializable(), -1, 3, 3, const <int>[], const [], null, #merchantUid), r.ParameterMirrorImpl(r'name', 46086, 110, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #name), r.ParameterMirrorImpl(r'amount', 41990, 110, const prefix0.JsonSerializable(), -1, 5, 5, const <int>[], const [], null, #amount), r.ParameterMirrorImpl(r'customData', 2143238, 110, const prefix0.JsonSerializable(), -1, 6, 7, const <int>[3, 3], const [], null, #customData), r.ParameterMirrorImpl(r'taxFree', 46086, 110, const prefix0.JsonSerializable(), -1, 8, 8, const <int>[], const [], null, #taxFree), r.ParameterMirrorImpl(r'vat', 46086, 110, const prefix0.JsonSerializable(), -1, 8, 8, const <int>[], const [], null, #vat), r.ParameterMirrorImpl(r'currency', 46086, 110, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #currency), r.ParameterMirrorImpl(r'language', 46086, 110, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #language), r.ParameterMirrorImpl(r'buyerName', 46086, 110, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #buyerName), r.ParameterMirrorImpl(r'buyerTel', 41990, 110, const prefix0.JsonSerializable(), -1, 3, 3, const <int>[], const [], null, #buyerTel), r.ParameterMirrorImpl(r'buyerEmail', 46086, 110, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #buyerEmail), r.ParameterMirrorImpl(r'buyerAddr', 46086, 110, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #buyerAddr), r.ParameterMirrorImpl(r'buyerPostcode', 46086, 110, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #buyerPostcode), r.ParameterMirrorImpl(r'noticeUrl', 46086, 110, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #noticeUrl), r.ParameterMirrorImpl(r'digital', 46086, 110, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [], null, #digital), r.ParameterMirrorImpl(r'vbankDue', 46086, 110, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #vbankDue), r.ParameterMirrorImpl(r'mRedirectUrl', 46086, 110, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], prefix3.UrlData.redirectUrl, #mRedirectUrl), r.ParameterMirrorImpl(r'appScheme', 41990, 110, const prefix0.JsonSerializable(), -1, 3, 3, const <int>[], const [], null, #appScheme), r.ParameterMirrorImpl(r'bizNum', 46086, 110, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #bizNum), r.ParameterMirrorImpl(r'customerUid', 46086, 110, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #customerUid), r.ParameterMirrorImpl(r'popup', 46086, 110, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [], null, #popup), r.ParameterMirrorImpl(r'naverUseCfm', 46086, 110, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #naverUseCfm), r.ParameterMirrorImpl(r'naverPopupMode', 46086, 110, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [], null, #naverPopupMode), r.ParameterMirrorImpl(r'naverProducts', 2143238, 110, const prefix0.JsonSerializable(), -1, 11, 12, const <int>[13], const [], null, #naverProducts), r.ParameterMirrorImpl(r'naverCultureBenefit', 46086, 110, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [], null, #naverCultureBenefit), r.ParameterMirrorImpl(r'naverProductCode', 46086, 110, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #naverProductCode), r.ParameterMirrorImpl(r'naverActionType', 46086, 110, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #naverActionType), r.ParameterMirrorImpl(r'naverInterface', 46086, 110, const prefix0.JsonSerializable(), 1, 1, 1, const <int>[], const [], null, #naverInterface), r.ParameterMirrorImpl(r'period', 2143238, 110, const prefix0.JsonSerializable(), -1, 6, 7, const <int>[3, 3], const [], null, #period), r.ParameterMirrorImpl(r'company', 46086, 110, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #company), r.ParameterMirrorImpl(r'niceMobileV2', 46086, 110, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [], null, #niceMobileV2), r.ParameterMirrorImpl(r'_pg', 32870, 41, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_payMethod', 32870, 43, const prefix0.JsonSerializable(), -1, 3, 3, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_escrow', 32870, 45, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_merchantUid', 32870, 47, const prefix0.JsonSerializable(), -1, 3, 3, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_name', 32870, 49, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_amount', 32870, 51, const prefix0.JsonSerializable(), -1, 5, 5, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_customData', 2130022, 53, const prefix0.JsonSerializable(), -1, 6, 7, const <int>[3, 3], const [], null, null), r.ParameterMirrorImpl(r'_taxFree', 32870, 55, const prefix0.JsonSerializable(), -1, 8, 8, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_vat', 32870, 57, const prefix0.JsonSerializable(), -1, 8, 8, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_currency', 32870, 59, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_language', 32870, 61, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_buyerName', 32870, 63, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_buyerTel', 32870, 65, const prefix0.JsonSerializable(), -1, 3, 3, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_buyerEmail', 32870, 67, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_buyerAddr', 32870, 69, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_buyerPostcode', 32870, 71, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_noticeUrl', 32870, 73, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_displayCardQuota', 2130022, 75, const prefix0.JsonSerializable(), -1, 9, 10, const <int>[5], const [], null, null), r.ParameterMirrorImpl(r'_digital', 32870, 77, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_vbankDue', 32870, 79, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_mRedirectUrl', 32870, 81, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_appScheme', 32870, 83, const prefix0.JsonSerializable(), -1, 3, 3, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_bizNum', 32870, 85, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_customerUid', 32870, 87, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_popup', 32870, 89, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_naverUseCfm', 32870, 91, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_naverPopupMode', 32870, 93, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_naverProducts', 2130022, 95, const prefix0.JsonSerializable(), -1, 11, 12, const <int>[13], const [], null, null), r.ParameterMirrorImpl(r'_naverCultureBenefit', 32870, 97, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_naverProductCode', 32870, 99, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_naverActionType', 32870, 101, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_naverInterface', 32870, 103, const prefix0.JsonSerializable(), 1, 1, 1, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_period', 2130022, 105, const prefix0.JsonSerializable(), -1, 6, 7, const <int>[3, 3], const [], null, null), r.ParameterMirrorImpl(r'_company', 32870, 107, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_niceMobileV2', 32870, 109, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'other', 32774, 111, const prefix0.JsonSerializable(), -1, 16, 16, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'invocation', 32774, 113, const prefix0.JsonSerializable(), -1, 17, 17, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'cpaInflowCode', 46086, 126, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #cpaInflowCode), r.ParameterMirrorImpl(r'naverInflowCode', 46086, 126, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #naverInflowCode), r.ParameterMirrorImpl(r'saClickId', 46086, 126, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #saClickId), r.ParameterMirrorImpl(r'merchantCustomCode1', 46086, 126, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #merchantCustomCode1), r.ParameterMirrorImpl(r'merchantCustomCode2', 46086, 126, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, #merchantCustomCode2), r.ParameterMirrorImpl(r'_cpaInflowCode', 32870, 117, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_naverInflowCode', 32870, 119, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_saClickId', 32870, 121, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_merchantCustomCode1', 32870, 123, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_merchantCustomCode2', 32870, 125, const prefix0.JsonSerializable(), -1, 2, 2, const <int>[], const [], null, null)], <Type>[prefix1.PaymentData, prefix2.NaverInterface, String, String, bool, int, const m.TypeValue<Map<String, String>>().type, Map, int, const m.TypeValue<List<int>>().type, List, const m.TypeValue<List<prefix4.NaverProducts>>().type, List, prefix4.NaverProducts, bool, Type, Object, Invocation], 2, {r'==': (dynamic instance) => (x) => instance == x, r'toString': (dynamic instance) => instance.toString, r'noSuchMethod': (dynamic instance) => instance.noSuchMethod, r'hashCode': (dynamic instance) => instance.hashCode, r'runtimeType': (dynamic instance) => instance.runtimeType, r'pg': (dynamic instance) => instance.pg, r'payMethod': (dynamic instance) => instance.payMethod, r'escrow': (dynamic instance) => instance.escrow, r'merchantUid': (dynamic instance) => instance.merchantUid, r'name': (dynamic instance) => instance.name, r'amount': (dynamic instance) => instance.amount, r'customData': (dynamic instance) => instance.customData, r'taxFree': (dynamic instance) => instance.taxFree, r'vat': (dynamic instance) => instance.vat, r'currency': (dynamic instance) => instance.currency, r'language': (dynamic instance) => instance.language, r'buyerName': (dynamic instance) => instance.buyerName, r'buyerTel': (dynamic instance) => instance.buyerTel, r'buyerEmail': (dynamic instance) => instance.buyerEmail, r'buyerAddr': (dynamic instance) => instance.buyerAddr, r'buyerPostcode': (dynamic instance) => instance.buyerPostcode, r'noticeUrl': (dynamic instance) => instance.noticeUrl, r'displayCardQuota': (dynamic instance) => instance.displayCardQuota, r'digital': (dynamic instance) => instance.digital, r'vbankDue': (dynamic instance) => instance.vbankDue, r'mRedirectUrl': (dynamic instance) => instance.mRedirectUrl, r'appScheme': (dynamic instance) => instance.appScheme, r'bizNum': (dynamic instance) => instance.bizNum, r'customerUid': (dynamic instance) => instance.customerUid, r'popup': (dynamic instance) => instance.popup, r'naverUseCfm': (dynamic instance) => instance.naverUseCfm, r'naverPopupMode': (dynamic instance) => instance.naverPopupMode, r'naverProducts': (dynamic instance) => instance.naverProducts, r'naverCultureBenefit': (dynamic instance) => instance.naverCultureBenefit, r'naverProductCode': (dynamic instance) => instance.naverProductCode, r'naverActionType': (dynamic instance) => instance.naverActionType, r'naverInterface': (dynamic instance) => instance.naverInterface, r'period': (dynamic instance) => instance.period, r'company': (dynamic instance) => instance.company, r'niceMobileV2': (dynamic instance) => instance.niceMobileV2, r'cpaInflowCode': (dynamic instance) => instance.cpaInflowCode, r'naverInflowCode': (dynamic instance) => instance.naverInflowCode, r'saClickId': (dynamic instance) => instance.saClickId, r'merchantCustomCode1': (dynamic instance) => instance.merchantCustomCode1, r'merchantCustomCode2': (dynamic instance) => instance.merchantCustomCode2}, {r'pg=': (dynamic instance, value) => instance.pg = value, r'payMethod=': (dynamic instance, value) => instance.payMethod = value, r'escrow=': (dynamic instance, value) => instance.escrow = value, r'merchantUid=': (dynamic instance, value) => instance.merchantUid = value, r'name=': (dynamic instance, value) => instance.name = value, r'amount=': (dynamic instance, value) => instance.amount = value, r'customData=': (dynamic instance, value) => instance.customData = value, r'taxFree=': (dynamic instance, value) => instance.taxFree = value, r'vat=': (dynamic instance, value) => instance.vat = value, r'currency=': (dynamic instance, value) => instance.currency = value, r'language=': (dynamic instance, value) => instance.language = value, r'buyerName=': (dynamic instance, value) => instance.buyerName = value, r'buyerTel=': (dynamic instance, value) => instance.buyerTel = value, r'buyerEmail=': (dynamic instance, value) => instance.buyerEmail = value, r'buyerAddr=': (dynamic instance, value) => instance.buyerAddr = value, r'buyerPostcode=': (dynamic instance, value) => instance.buyerPostcode = value, r'noticeUrl=': (dynamic instance, value) => instance.noticeUrl = value, r'displayCardQuota=': (dynamic instance, value) => instance.displayCardQuota = value, r'digital=': (dynamic instance, value) => instance.digital = value, r'vbankDue=': (dynamic instance, value) => instance.vbankDue = value, r'mRedirectUrl=': (dynamic instance, value) => instance.mRedirectUrl = value, r'appScheme=': (dynamic instance, value) => instance.appScheme = value, r'bizNum=': (dynamic instance, value) => instance.bizNum = value, r'customerUid=': (dynamic instance, value) => instance.customerUid = value, r'popup=': (dynamic instance, value) => instance.popup = value, r'naverUseCfm=': (dynamic instance, value) => instance.naverUseCfm = value, r'naverPopupMode=': (dynamic instance, value) => instance.naverPopupMode = value, r'naverProducts=': (dynamic instance, value) => instance.naverProducts = value, r'naverCultureBenefit=': (dynamic instance, value) => instance.naverCultureBenefit = value, r'naverProductCode=': (dynamic instance, value) => instance.naverProductCode = value, r'naverActionType=': (dynamic instance, value) => instance.naverActionType = value, r'naverInterface=': (dynamic instance, value) => instance.naverInterface = value, r'period=': (dynamic instance, value) => instance.period = value, r'company=': (dynamic instance, value) => instance.company = value, r'niceMobileV2=': (dynamic instance, value) => instance.niceMobileV2 = value, r'cpaInflowCode=': (dynamic instance, value) => instance.cpaInflowCode = value, r'naverInflowCode=': (dynamic instance, value) => instance.naverInflowCode = value, r'saClickId=': (dynamic instance, value) => instance.saClickId = value, r'merchantCustomCode1=': (dynamic instance, value) => instance.merchantCustomCode1 = value, r'merchantCustomCode2=': (dynamic instance, value) => instance.merchantCustomCode2 = value}, null, [])};


final _memberSymbolMap = null;

void _initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}

final mainAdapter = JsonMapperAdapter(
  title: 'mainAdapter',
  url: 'package:aroundus_app/main.dart',
  valueDecorators: {
    typeOf<List<x0.Menu>>(): (value) => value.cast<x0.Menu>(),
    typeOf<Set<x0.Menu>>(): (value) => value.cast<x0.Menu>(),
    typeOf<List<x1.Collection>>(): (value) => value.cast<x1.Collection>(),
    typeOf<Set<x1.Collection>>(): (value) => value.cast<x1.Collection>(),
    typeOf<List<x2.Magazine>>(): (value) => value.cast<x2.Magazine>(),
    typeOf<Set<x2.Magazine>>(): (value) => value.cast<x2.Magazine>(),
    typeOf<List<x3.MagazineCategory>>(): (value) => value.cast<x3.MagazineCategory>(),
    typeOf<Set<x3.MagazineCategory>>(): (value) => value.cast<x3.MagazineCategory>(),
    typeOf<List<x4.MagazineDetail>>(): (value) => value.cast<x4.MagazineDetail>(),
    typeOf<Set<x4.MagazineDetail>>(): (value) => value.cast<x4.MagazineDetail>(),
    typeOf<List<x5.Product>>(): (value) => value.cast<x5.Product>(),
    typeOf<Set<x5.Product>>(): (value) => value.cast<x5.Product>(),
    typeOf<List<x6.Brand>>(): (value) => value.cast<x6.Brand>(),
    typeOf<Set<x6.Brand>>(): (value) => value.cast<x6.Brand>(),
    typeOf<List<x7.Option>>(): (value) => value.cast<x7.Option>(),
    typeOf<Set<x7.Option>>(): (value) => value.cast<x7.Option>(),
    typeOf<List<x8.Variation>>(): (value) => value.cast<x8.Variation>(),
    typeOf<Set<x8.Variation>>(): (value) => value.cast<x8.Variation>(),
    typeOf<List<x9.TypeGroup>>(): (value) => value.cast<x9.TypeGroup>(),
    typeOf<Set<x9.TypeGroup>>(): (value) => value.cast<x9.TypeGroup>(),
    typeOf<List<x10.Variants>>(): (value) => value.cast<x10.Variants>(),
    typeOf<Set<x10.Variants>>(): (value) => value.cast<x10.Variants>(),
    typeOf<List<x11.MagazineComment>>(): (value) => value.cast<x11.MagazineComment>(),
    typeOf<Set<x11.MagazineComment>>(): (value) => value.cast<x11.MagazineComment>(),
    typeOf<List<x12.Catalog>>(): (value) => value.cast<x12.Catalog>(),
    typeOf<Set<x12.Catalog>>(): (value) => value.cast<x12.Catalog>(),
    typeOf<List<x13.PageResponse>>(): (value) => value.cast<x13.PageResponse>(),
    typeOf<Set<x13.PageResponse>>(): (value) => value.cast<x13.PageResponse>(),
    typeOf<List<x14.CartTemp>>(): (value) => value.cast<x14.CartTemp>(),
    typeOf<Set<x14.CartTemp>>(): (value) => value.cast<x14.CartTemp>(),
    typeOf<List<x15.Coupon>>(): (value) => value.cast<x15.Coupon>(),
    typeOf<Set<x15.Coupon>>(): (value) => value.cast<x15.Coupon>(),
    typeOf<List<x16.CustomerRequests>>(): (value) => value.cast<x16.CustomerRequests>(),
    typeOf<Set<x16.CustomerRequests>>(): (value) => value.cast<x16.CustomerRequests>(),
    typeOf<List<x17.ShippingRequest>>(): (value) => value.cast<x17.ShippingRequest>(),
    typeOf<Set<x17.ShippingRequest>>(): (value) => value.cast<x17.ShippingRequest>(),
    typeOf<List<x18.Order>>(): (value) => value.cast<x18.Order>(),
    typeOf<Set<x18.Order>>(): (value) => value.cast<x18.Order>(),
    typeOf<List<x19.Address>>(): (value) => value.cast<x19.Address>(),
    typeOf<Set<x19.Address>>(): (value) => value.cast<x19.Address>(),
    typeOf<List<x20.OrderTemp>>(): (value) => value.cast<x20.OrderTemp>(),
    typeOf<Set<x20.OrderTemp>>(): (value) => value.cast<x20.OrderTemp>(),
    typeOf<List<x21.OrderItem>>(): (value) => value.cast<x21.OrderItem>(),
    typeOf<Set<x21.OrderItem>>(): (value) => value.cast<x21.OrderItem>(),
    typeOf<List<x22.OrderForm>>(): (value) => value.cast<x22.OrderForm>(),
    typeOf<Set<x22.OrderForm>>(): (value) => value.cast<x22.OrderForm>(),
    typeOf<List<x23.Cart>>(): (value) => value.cast<x23.Cart>(),
    typeOf<Set<x23.Cart>>(): (value) => value.cast<x23.Cart>()
},
  enumValues: {

});

Future<JsonMapper> initializeJsonMapperAsync({Iterable<JsonMapperAdapter> adapters = const []}) => Future(() => initializeJsonMapper(adapters: adapters));

JsonMapper initializeJsonMapper({Iterable<JsonMapperAdapter> adapters = const []}) {
  _initializeReflectable();
  final allAdapters = [...adapters, mainAdapter];
  for (var adapter in allAdapters) {
    JsonMapper().useAdapter(adapter);
  }
  return JsonMapper();
}