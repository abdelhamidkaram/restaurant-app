import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/features/cart/data/model/cart_model.dart';
import '../../../../config/route/app_route.dart';
import '../../../../core/shared_widgets/product_quantity.dart';
import '../../../../core/utils/app_colors.dart';
import '../../bloc/cart_cubit.dart';

class CartItem extends StatefulWidget {
  final CartItemModel item ;
  final int index ;
  const CartItem({super.key, required this.item, required this.index});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context ) {
    var item = widget.item ;
    var index = widget.index;
    
    return Dismissible(
      onDismissed: (direction) {
        CartCubit.get(context).removeFromCart(product: item.product);
      },
      key: GlobalKey(),
      background: Container(
        color: AppColors.primaryColor.withOpacity(0.4),
        child: const Icon(Icons.delete_forever , color: Colors.red),
      ),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(AppRouteStrings.singleProduct , arguments:item.product);
        },
        child: Container(
          padding: EdgeInsetsDirectional.only(bottom: 5.h),
          margin: EdgeInsetsDirectional.only(
              start: 16.w, end: 16.w, bottom: 16.w),
          decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.greyLight, width: 2),
              )),
          width: double.infinity,
          child: Row(
            children: [
              Container(
                width: 60.w,
                height: 76.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: Image.network(item.product.img!).image,
                      fit: BoxFit.cover),
                ),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 81,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.product.title.toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    item.note != ''? Text(
                      item.note.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ):const SizedBox(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 123.w,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text((item.product.price! * CartCubit.get(context)
                              .cartItems[index]
                              .quantity ).toString() ,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          ProductQuantity(
                              addOnTap: () {
                                CartCubit.get(context).changeQuantity(
                                    index: index,
                                    newQuantity: CartCubit.get(context)
                                        .cartItems[index]
                                        .quantity +
                                        1);
                              },
                              removeOnTap: () {
                                CartCubit.get(context)
                                    .cartItems[index]
                                    .quantity >
                                    1
                                    ?  CartCubit.get(context)
                                    .changeQuantity(
                                    index: index,
                                    newQuantity:
                                    CartCubit.get(context)
                                        .cartItems[index]
                                        .quantity -1 )
                                    : null;
                              },
                              quantity: item.quantity)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}
