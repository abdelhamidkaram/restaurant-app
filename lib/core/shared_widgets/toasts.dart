import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppToasts {
  static toast({
    required String msg,
    Duration duration = const Duration(seconds: 2),
    toastPosition = EasyLoadingToastPosition.bottom,
  }) =>
      EasyLoading.showToast(
        msg,
        duration: duration,
        toastPosition: toastPosition,
      );

  static toastError({
    required String msg,
    Duration duration = const Duration(seconds: 2),
    toastPosition = EasyLoadingToastPosition.bottom,
  }) =>
      EasyLoading.showError(
        msg,
        duration: duration,
      );


  static toastLoading() =>
      EasyLoading.show(
        dismissOnTap: true,
        indicator:const CircularProgressIndicator.adaptive(),
      );

  static toastSuccess({required String msg}) =>
      EasyLoading.showToast(msg);
}
