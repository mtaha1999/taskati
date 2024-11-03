import 'package:flutter/material.dart';
import 'package:taskati/core/uitls/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
     this.width=250,
     this.height=50,
     this.radius=10,
    required this.text,
     this.color=AppColors.colorPrimary,
    required this.ontap,
    this.textStyle, 
  });
  final double width;
  final double height;
  final double radius;
  final String text;
  final Color color;
  final Function() ontap;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            onPressed: ontap,
            child: Text(text,style: textStyle??const TextStyle(color: AppColors.whiteColor,))));
  }
}
