import 'package:flutter/material.dart';

import '../../config/route/app_route.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    super.key,
    required this.context,
     this.color,
  });

  final BuildContext context;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AppRouteStrings.cart);
      },
      child:  Icon(
        Icons.shopping_cart,
        color: color ?? Colors.black,
      ),
    );
  }
}
