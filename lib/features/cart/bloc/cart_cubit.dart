import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/models/product.dart';
import 'package:food/features/cart/data/model/cart_model.dart';

import '../../../core/shared_widgets/toasts.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);
  List<CartItemModel> cartItems = [];
  double subTotalPrice = 0;
  double deliveryPrice = 5;
  double totalPrice = 0;

  addToCart({required Product product, int? quantity, String? note}) {
    emit(LoadingCart());
    var cartModel = CartItemModel(product: product, note: note ?? '')
      ..quantity = quantity ?? 1;
    var isQuantityChanged = false ;
    var isNoteChanged = false ;
    if (cartItems.any((element) {
      isQuantityChanged = element.quantity != cartModel.quantity;
      isNoteChanged = element.note != cartModel.note;
      return  element == cartModel ;
    })) {
      if(isQuantityChanged || isNoteChanged ){
        cartItems.removeWhere((element) => element == cartModel);
        cartItems.add(cartModel);
        AppToasts.toastSuccess(msg: 'Added to cart successfully');
      }else{
        AppToasts.toastSuccess(msg: 'Already added to cart');
      }

    } else {
      cartItems.add(cartModel);
      AppToasts.toastSuccess(msg: 'Added to cart successfully');
    }
    emit(AddToCart());
  }

  removeFromCart({required Product product}) {
    emit(LoadingCart());
    CartItemModel cartItem =
        cartItems.where((cartItem) => cartItem.product.id == product.id).first;
    cartItems.remove(cartItem);
    emit(AddToCart());
  }

  double getSubTotalPrice() {
    emit(LoadingCart());
    for (var cartItem in cartItems) {
      subTotalPrice += cartItem.product.price!;
    }
    emit(GetSubTotalPrice());
    return subTotalPrice;
  }

  double getTotalPrice() {
    emit(LoadingCart());
    totalPrice += deliveryPrice;
    emit(GetSubTotalPrice());
    return totalPrice;
  }

  changeQuantity({ required int index , required int newQuantity}) {
    emit(LoadingCart());
    cartItems[index].quantity = newQuantity;
    emit(ChangeQuantity());

  }

  increaseQuantity() {}
}
