import 'package:equatable/equatable.dart';

import 'cart_model.dart';

class OrderModel extends Equatable {

  final List<CartItemModel> items;

  final String note;

  final double subTotal;

  final double deliveryCost;

  final double total;

  const OrderModel({
    required this.items,
    required this.note,
    required this.subTotal,
    required this.deliveryCost,
    required this.total,
  });

  @override
  List<Object?> get props => [ total, subTotal, deliveryCost];
}
