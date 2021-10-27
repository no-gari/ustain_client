import 'package:aroundus_app/repositories/address_repository/models/address.dart';
import 'package:aroundus_app/repositories/coupon_repository/models/coupon.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'order.g.dart';

@JsonSerializable()
class Order extends Equatable {
  const Order({
    this.products,
    this.address,
    this.request,
    this.coupon,
  });

  final List<OrderItem>? products;
  final Address? address;
  final CustomerRequests? request;
  final Coupon? coupon;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  Order copyWith({
    List<OrderItem>? products,
    Address? address,
    CustomerRequests? request,
    Coupon? coupon,
  }) {
    return Order(
      products: products ?? this.products,
      address: address ?? this.address,
      request: request ?? this.request,
      coupon: coupon ?? this.coupon,
    );
  }

  @override
  List<Object?> get props => [
        products,
        address,
        request,
        coupon,
      ];
}