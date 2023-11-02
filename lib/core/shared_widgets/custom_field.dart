import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_string.dart';

class CustomField extends StatefulWidget {
  final TextEditingController controller ;
  final bool isObscure;
  final String hit;
  final TextInputType type ;
  final String?Function(String?)?  validation ;
  final  Function(String?)? onChange ;
  const CustomField({
    super.key,
    required this.controller,
    required this.isObscure,
    required this.hit,
    required this.type,
    this.validation, this.onChange,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 64.sp,
        width: 307.w,
        child: Center(
          child: Padding(
            padding:  EdgeInsets.only(left: 34.0.w),
            child: TextFormField(
              controller: widget.controller,
              onChanged: widget.onChange,
              // validator:widget.validation ?? (String? value) {
              //
              //   if(value != null){
              //
              //     return _validation(value);
              //
              //   }
              //   return AppStrings.pleaseEnter + widget.hit ;
              // },
              keyboardType: widget.type,
              obscureText: widget.isObscure ? isShow : false,
              decoration:  InputDecoration(
                suffixIcon: widget.isObscure? IconButton( onPressed: () {
                  setState(() {
                    isShow =!isShow;
                  });
                }, icon: isShow?const Icon(Icons.visibility , color: Colors.grey,) : const Icon(Icons.visibility_off),) : null,
                hintText: widget.hit,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _validation(String value) {
    RegExp emailRegex = RegExp(r'^\S+@\S+$');
    RegExp phoneRegex = RegExp(r'^01[0125][0-9]{8}$');
    RegExp passwordRegex = RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z])$');
    if(widget.type == TextInputType.emailAddress){
      if(!emailRegex.hasMatch(value)){
        return AppStrings.pleaseEnter + widget.hit;
      }
    }
    if(widget.type == TextInputType.phone){
      if(!phoneRegex.hasMatch(value)){
        return AppStrings.pleaseEnter + AppStrings.validPhone;
      }
    }
    if(widget.type == TextInputType.visiblePassword){
      if(value.isEmpty){
        return AppStrings.pleaseEnter + AppStrings.password;
      }

    }
    return null ;
  }
}