import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/config/route/app_route.dart';
import 'package:food/core/shared_widgets/buttons/main_button.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/features/cart/bloc/cart_cubit.dart';
import 'package:food/features/cart/data/model/cart_model.dart';
import 'package:food/features/cart/peresintation/widgets/cart_item.dart';
import '../../../../core/shared_widgets/add_note.dart';
import '../../../../core/shared_widgets/custom_divider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<CartItemModel> cartItems = CartCubit.get(context).cartItems;
    double subTotal = 0;
    CartCubit.get(context).cartItems.forEach((element) {
      subTotal += (element.product.price! * element.quantity);
    });
    double total = subTotal + CartCubit.get(context).deliveryPrice;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text(
          'Cart',
          style: TextStyle(
              color: AppColors.primaryFontColor,
              fontWeight: FontWeight.w800,
              fontSize: 24.sp),
        ),
      ),
      
      body: cartItems.isEmpty ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.remove_shopping_cart , size: 180.sp, color: AppColors.primaryColor.withOpacity(0.4),),
            SizedBox(height: 30.h,),
            Text('السلة فارغة' , style: Theme.of(context).textTheme.headlineMedium,),
            SizedBox(height: 30.h,),
            MainButton(text: 'الذهاب إلى الرئيسية', onTap: (){
              Navigator.pushNamed(context, AppRouteStrings.home);
            })
          ],
        ),
      ) :cartBody(cartItems, context, subTotal, total),
    );
  }

  SingleChildScrollView cartBody(List<CartItemModel> cartItems, BuildContext context, double subTotal, double total) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: List.generate(cartItems.length, (index) {
              var item = cartItems[index];
              return CartItem(
                item: item,
                index: index,
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                specialRequest(context),
                const CustomDivider(),
                priceItem(
                    text: 'Sub Total', context: context, price: subTotal),
                SizedBox(
                  height: 16.h,
                ),
                priceItem(
                    text: 'Delivery Cost',
                    context: context,
                    price: CartCubit.get(context).deliveryPrice),
                SizedBox(
                  height: 16.h,
                ),
                const CustomDivider(),
                priceItem(text: 'Total', context: context, price: total ,  isTotal: true),
                SizedBox(
                  height: 20.h,
                ),
                MainButton(text: 'Checkout', onTap: (){}),
                SizedBox(
                  height: 120.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row priceItem(
      {required BuildContext context,
      required String text,
      required double price , isTotal=false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text, style: Theme.of(context).textTheme.titleMedium),
        Text(
          '\$ $price',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.primaryColor,  fontSize:isTotal ? 22.sp :14.sp),
        ),
      ],
    );
  }

  Row specialRequest(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 147.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Special request',
                  style: Theme.of(context).textTheme.titleMedium),
              Text(
                noteController.text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
        ),
        SizedBox(
          width: 110.w,
          child: AddNote(noteController: noteController, icon: Icons.add),
        ),
      ],
    );
  }
}

