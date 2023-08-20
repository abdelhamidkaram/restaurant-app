
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_string.dart';

ThemeData appTheme() => ThemeData(
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,

  popupMenuTheme: const  PopupMenuThemeData(
    shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(22.0),
          ),
        )
  ),
      primarySwatch: Colors.deepOrange,
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.secondaryFontColor,
      brightness: Brightness.light,
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.primaryColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0.0,
      ),
      fontFamily: AppStrings.fontFamily,
      scaffoldBackgroundColor: Colors.white,
      cardTheme: CardTheme(
        elevation: 10,
        color: AppColors.secondaryFontColor,
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
      ),
      textTheme: TextTheme(

        bodyMedium: TextStyle(
              fontFamily: AppStrings.fontFamily,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryFontColor,
              overflow: TextOverflow.ellipsis
          ),
        displayLarge: TextStyle(
            fontFamily: AppStrings.fontFamily,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDark,
            overflow: TextOverflow.ellipsis),
        displayMedium: TextStyle(
            fontFamily: AppStrings.fontFamily,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDark,
            overflow: TextOverflow.ellipsis),
        displaySmall: TextStyle(
            fontFamily: AppStrings.fontFamily,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDark,

            overflow: TextOverflow.ellipsis),
        headlineSmall: TextStyle(
            fontFamily: AppStrings.fontFamily,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            overflow: TextOverflow.ellipsis),
        titleLarge: TextStyle(
            fontFamily: AppStrings.fontFamily,
            fontSize: 34.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
            overflow: TextOverflow.ellipsis),

      ),
      bottomAppBarTheme: BottomAppBarTheme(color: AppColors.primaryColor),

    );
