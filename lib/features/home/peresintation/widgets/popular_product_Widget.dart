import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/models/product.dart';
import '../../../../core/utils/app_colors.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({
    super.key,
    required this.popularProducts,
  });

  final List<Product> popularProducts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          popularProducts.length,
              (index) =>
                  Card(
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
    );
  }
}
