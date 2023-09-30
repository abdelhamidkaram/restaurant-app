import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/config/route/app_route.dart';
import 'package:food/core/models/product.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/assets_manger.dart';
import 'package:food/features/home/peresintation/bloc/home_cubit.dart';
import 'package:food/features/home/peresintation/widgets/slider_widget.dart';
import 'package:food/features/home/peresintation/widgets/tabs_widget.dart';

import '../../../../core/shared_widgets/bottom_nav_bar.dart';
import '../widgets/popular_product_Widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getSliderImages()
        ..getPopularProducts()
        ..getAllCats()
        ..getAllProducts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) => HomeCubit(),
        builder: (context, state) {
          List<Product> popularProducts =
              HomeCubit.get(context).popularProducts;
          return Scaffold(
            appBar: buildAppBar(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: buildFloatingActionButton(context: context),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      child: SizedBox(
                        width: 333.w,
                        height: 54.h,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 14.sp),
                            prefixIcon: const Icon(Icons.search),
                            border: InputBorder.none,
                            hintText: 'Search Food ..',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SlideImage(),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Popular Product',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: AppColors.primaryFontColor),
                            ),
                            const Spacer(),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'View all',
                                )),
                          ],
                        ),
                        PopularProduct(popularProducts: popularProducts),
                        SizedBox(
                          height: 15.h,
                        ),
                        HomeTabs(
                          cats: HomeCubit.get(context).cats,
                          products: HomeCubit.get(context).allProducts,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: AppColors.white,
      actions: [
        const Icon(
          Icons.shopping_cart,
          color: Colors.black,
        ),
        SizedBox(
          width: 20.w,
        ),
      ],
      automaticallyImplyLeading: false,
      title: Text(
        'Good Morning Akila!',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20.sp,
        ),
      ),
    );
  }
}
