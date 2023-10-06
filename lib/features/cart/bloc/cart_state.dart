part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}


class LoadingCart extends CartState {
  @override
  List<Object?> get props => [];
}

class AddToCart extends CartState {
  @override
  List<Object?> get props => [];
}

class RemoveToCart extends CartState {
  @override
  List<Object?> get props => [];
}

class GetSubTotalPrice extends CartState {
  @override
  List<Object?> get props => [];
}

class GetTotalPrice extends CartState {
  @override
  List<Object?> get props => [];
}

class ChangeQuantity extends CartState {
  @override
  List<Object?> get props => [];
}
