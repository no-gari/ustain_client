// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) {
  return Cart(
    brand: json['brand'] as String?,
    productId: json['productId'] as String?,
    productName: json['productName'] as String?,
    productThumbnail: json['productThumbnail'] as String?,
    variantId: json['variantId'] as String?,
    variantOptions: json['variantOptions'] as String?,
    salePrice: json['salePrice'] as int?,
    quantity: json['quantity'] as int?,
    Id: json['Id'] as String?,
    isChecked: json['isChecked'] as bool?,
  );
}

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'brand': instance.brand,
      'productId': instance.productId,
      'productName': instance.productName,
      'productThumbnail': instance.productThumbnail,
      'variantId': instance.variantId,
      'variantOptions': instance.variantOptions,
      'salePrice': instance.salePrice,
      'quantity': instance.quantity,
      'Id': instance.Id,
      'isChecked': instance.isChecked,
    };
