import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/models/product.dart';
import 'package:food/core/models/product_category.dart';
import 'package:food/core/utils/app_colors.dart';

class HomeTabs extends StatefulWidget {
  final List<Product> products;

  final List<ProductCategory> cats;

  const HomeTabs({super.key, required this.products, required this.cats});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  @override
  Widget build(BuildContext context) {
    List<ProductCategory> cats = widget.cats;
    var keys = List.generate(cats.length, (index) => GlobalKey());
    List<Widget> products = List.generate(
      cats.length,
      (index) {
        List<Product> prodcts =
            widget.products.where((e) => e.cat == cats[index].id).toList();
        return SizedBox(
          width: double.infinity,
          key: keys[index],
          child: Column(
            children: List.generate(
                prodcts.length,
                (index) => Container(
                      padding: EdgeInsetsDirectional.only(bottom: 10.h),
                      margin: EdgeInsetsDirectional.only(bottom: 10.h),
                      height: 93.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 2, color: AppColors.greyLight))),
                      child: Row(
                        children: [
                          Container(
                            width: 75.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.network(
                                      prodcts[index].img ??
                                          'https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141353.jpg?w=1060&t=st=1694275307~exp=1694275907~hmac=8197f248353888881fa130f396d0305f5301e880d935cae33ef6e04ead7c349a',
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  prodcts[index].title ?? 'Mulberry Pizza',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                Text(
                                  '${prodcts[index].price ?? 20} L.E',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
          ),
        );
      },
    );
    return Column(
      children: [
        SizedBox(
          height: 50.h,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  cats.length,
                  (index) => TextButton(
                      onPressed: () => scrollTo(keys[index]),
                      child: Text(
                        cats[index].name,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: index == 0 ?AppColors.primaryColor :Colors.grey
                            ),
                      )))),
        ),
        SizedBox(height: 15.h,),
        ...products
      ],
    );
  }

  scrollTo(GlobalKey itemKey) async {
    Scrollable.ensureVisible(
      itemKey.currentContext!,
      alignment: 0,
      duration: const Duration(seconds: 1),
    );
  }
}
