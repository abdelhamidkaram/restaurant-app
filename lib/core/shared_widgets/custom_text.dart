import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_string.dart';

class CustomText extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final int maxLines;
  final int fontSize;
  final TextAlign textAlign;
   const CustomText({
    super.key,
    required this.title,required this.style,this.textAlign = TextAlign.start,this.fontSize = 20,this.maxLines = 2
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      style: style,
    );
  }
}
