import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class ProductQuantity extends StatefulWidget {
  final VoidCallback removeOnTap;
  final VoidCallback addOnTap;
  final int quantity ;

  const ProductQuantity({required this.removeOnTap, super.key, required this.addOnTap, required this.quantity});

  @override
  State<ProductQuantity> createState() => _ProductQuantityState();
}

class _ProductQuantityState extends State<ProductQuantity> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
                  onTap: widget.removeOnTap,
                  child: Icon(
                    Icons.remove,
                    color: AppColors.primaryColor,
                    size: 15.sp,
                  ),
                ),
                Text(
                  widget.quantity.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                GestureDetector(
                  onTap: widget.addOnTap,
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
    );
  }
}
