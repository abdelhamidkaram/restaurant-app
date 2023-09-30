import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_string.dart';

ThemeData appTheme() => ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      popupMenuTheme: const PopupMenuThemeData(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(22.0),
        ),
      )),
      primarySwatch: Colors.deepOrange,
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.secondaryFontColor,
      brightness: Brightness.light,
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith((states) => TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold)),
              foregroundColor: MaterialStateColor.resolveWith(
                  (states) => AppColors.primaryColor))),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.transparent),
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
        elevation: 0,
        color: AppColors.greyLight,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(28.0),
          ),
        ),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
            fontFamily: AppStrings.fontFamily,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.secondaryFontColor,
            overflow: TextOverflow.ellipsis),
        titleLarge: TextStyle(
            fontFamily: AppStrings.fontFamily,
            fontSize: 34.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
            overflow: TextOverflow.ellipsis),
        titleMedium: TextStyle(
            fontFamily: AppStrings.fontFamily,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis),
        headlineLarge:
            TextStyle(color: AppColors.primaryFontColor, fontSize: 30.sp),
        headlineMedium: TextStyle(
            color: AppColors.primaryFontColor, fontSize: 18.sp , fontWeight: FontWeight.bold
        )
      ),
      bottomAppBarTheme: BottomAppBarTheme(color: AppColors.primaryColor),
      focusColor: AppColors.primaryColor,

    );
