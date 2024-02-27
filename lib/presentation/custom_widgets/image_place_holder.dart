import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagePlaceHolder extends StatelessWidget {
  String? placehlder;
  double? width;
  BoxFit? fit;
  Color? color;
   ImagePlaceHolder({super.key,this.placehlder,this.fit,this.color,this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
           borderRadius: BorderRadiusDirectional.circular(12.w),),
      child: Image.asset(
        placehlder??'lib/assets/images/png/Placeholder.png',
        fit: fit??BoxFit.cover,
        color: color,
        width: width,
      ),
    );
  }
}
