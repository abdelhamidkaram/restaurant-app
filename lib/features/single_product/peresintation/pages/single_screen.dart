import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/models/product.dart';
import 'package:food/core/shared_widgets/buttons/main_button.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/assets_manger.dart';
import '../../../../core/shared_widgets/bottom_nav_bar.dart';

class SingleProduct extends StatefulWidget {
  final Product product;

  const SingleProduct({super.key, required this.product});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(-4, -4),
                                color: AppColors.greyLight.withOpacity(0.6),
                                blurRadius: 5),
                            BoxShadow(
                                offset: const Offset(4, 4),
                                color: AppColors.greyLight.withOpacity(0.6),
                                blurRadius: 5)
                          ],
                        ),
                        child: SizedBox(
                          width: 76.w,
                          height: 30.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.remove,
                                  color: AppColors.primaryColor,
                                  size: 15.sp,
                                ),
                              ),
                              //TODO: ADD QUANTITY FORM BLOC
                              Text(
                                2.toString(),
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),

                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.primaryColor,
                                  size: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Any Special Requests',
                        style: TextStyle(
                            fontSize: 18.sp, color: AppColors.primaryFontColor),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  child: Container(
                                        width: double.infinity,
                                        height: 270.h,
                                        decoration:  BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            maxLines: 3,
                                            decoration:  InputDecoration(
                                              hintText: 'ADD NOTE HERE',
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12)
                                              ),

                                            ),
                                          ),


                                          SizedBox(
                                            width: 120.w,
                                            child: MainButton(text: 'Save', onTap: (){
                                              //TODO : ADD NOTE FUNCTION
                                            }),
                                          )
                                        ],
                                      ),
                                    ),
                                      ),
                                ));
                          },
                          child: const Text(
                            'Add note',
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      //TODO: ADD TO CAR FUNCTION
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
                              const Text(
                                'EGP 720',
                                style: TextStyle(
                                    //TODO: ADD TOTAL PRICE FROM BLOC
                                    color: Colors.white),
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
