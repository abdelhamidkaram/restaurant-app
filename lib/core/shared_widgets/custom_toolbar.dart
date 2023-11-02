import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_string.dart';

class CustomToolbar extends StatelessWidget {
  final String title;
  final bool showBack;
  const CustomToolbar({
    super.key,
    required this.title,
    required this.showBack,
  });

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Expanded(flex: 10, child: Text(
          textAlign: TextAlign.center,
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),),
        if(showBack)
        Expanded(flex: 1,child: RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: Colors.white,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_right_rounded),
            iconSize: 20,
            color: AppColors.primaryColor,
          ),
          padding: EdgeInsets.all(0),
          shape: CircleBorder(),
        ),)
      ],
    );

  }

  // Icon(
  // Icons.keyboard_arrow_right_rounded,
  // size: 20.0,
  // color: AppColors.primaryColor,
  // )
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
