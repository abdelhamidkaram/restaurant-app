import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/models/product.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/features/home/peresintation/bloc/home_cubit.dart';
import 'package:food/features/home/peresintation/widgets/slider_widget.dart';

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
        ..getPopularProducts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) => HomeCubit(),
        builder: (context, state) {
          List<Product> popularProducts =
              HomeCubit.get(context).popularProducts;
          return Scaffold(
            appBar: AppBar(
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
            ),
            body: Column(
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
                              child: Text(
                                'View all',
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 100.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            popularProducts.length,
                            (index) => Card(
                              elevation: 1.0,
                              shadowColor: AppColors.greyLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                              color: AppColors.white,
                              child: SizedBox(
                                height: 93.h,
                                width: 233.w,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 75.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                popularProducts[index].img ??'https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141353.jpg?w=1060&t=st=1694275307~exp=1694275907~hmac=8197f248353888881fa130f396d0305f5301e880d935cae33ef6e04ead7c349a',
                                                height: double.infinity,
                                                loadingBuilder: (context, child,
                                                        loadingProgress) =>
                                                    loadingProgress == null
                                                        ? child
                                                        : const CircularProgressIndicator
                                                            .adaptive(),
                                              ).image)),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    SizedBox(
                                      width: 150.w,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            popularProducts[index].title ?? 'Mulberry Pizza',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                          ),
                                          Text(
                                            '${   popularProducts[index].price ?? 20} L.E',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
