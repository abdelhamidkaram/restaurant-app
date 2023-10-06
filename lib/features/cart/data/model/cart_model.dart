import 'package:equatable/equatable.dart';
import 'package:food/core/models/product.dart';

class CartItemModel extends Equatable{

  int _quantity = 1 ;
  final String note ;
  final Product product ;
    CartItemModel( { this.note ='',required this.product}) ;

    int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
  }

  @override
  List<Object?> get props => [product];

}