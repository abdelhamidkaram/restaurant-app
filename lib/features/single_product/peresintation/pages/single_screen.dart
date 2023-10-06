import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/models/product.dart';
import 'package:food/core/shared_widgets/add_note.dart';
import 'package:food/core/shared_widgets/product_quantity.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/assets_manger.dart';
import 'package:food/core/shared_widgets/cart_icon.dart';
import 'package:food/features/cart/bloc/cart_cubit.dart';
import '../../../../core/shared_widgets/bottom_nav_bar.dart';

class SingleProduct extends StatefulWidget {
  final Product product;

  const SingleProduct({super.key, required this.product});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  var noteController = TextEditingController();
  int quantity = 1;
  @override
  void initState() {

    super.initState();
    CartCubit.get(context).cartItems.forEach((element) {
      if(element.product == widget.product){
        quantity = element.quantity ;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: buildFloatingActionButton(context: context),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.black.withOpacity(0.5),
        actions: [
          CartIcon(
            context: context,
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 459.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(widget.product.img!).image),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    //TODO: ADD Product TO FAVORITE LIST
                  },
                  child: Image.asset(
                    ImagesManger.favoriteIcon,
                    width: 55.w,
                    height: 55.w,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title!,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Divider(color: AppColors.greyLight),
                  Text(
                    'EGP ${widget.product.price}',
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.primaryFontColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.product.description.toString(),
                    overflow: TextOverflow.visible,
                  ),
                  ProductQuantity(
                    removeOnTap: () {
                      setState(() {
                        quantity > 1 ? quantity-- : null;
                      });
                    }, addOnTap: () {
                    setState(() {
                      quantity++;
                    });
                  }, quantity: quantity,
                  ),
                  Row(
                    children: [
                      Text(
                        'Any Special Requests',
                        style: TextStyle(
                            fontSize: 18.sp, color: AppColors.primaryFontColor),
                      ),
                      const Spacer(),
                      AddNote(noteController: noteController),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      CartCubit.get(context).addToCart(
                        product: widget.product,
                        quantity: quantity,
                        note: noteController.text,
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 65.h,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(28.r)),
                      child: Container(
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 16),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'ADD TO CART ',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: Colors.white),
                              ),
                              const Spacer(),
                              Text(
                                'EGP ${quantity * widget.product.price!}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 120.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

