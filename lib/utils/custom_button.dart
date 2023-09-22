import 'package:doctor_booking/constants/colors.dart';
import 'package:doctor_booking/views/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomButton{
  static Widget btn(String title,Function ()onTap){
    return GestureDetector(
        onTap: ()=>onTap(),
        child: Center(
          child: Container(
            width: Get.width*0.7,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
            decoration: BoxDecoration(
                color: AppThemeColors.purple,
                borderRadius: BorderRadius.circular(24.0)
            ),
            child: CustomText.text(
                title,
                color: AppThemeColors.white,
                textAlign: TextAlign.center,
                fontSize: 16
            ),
          ),
        ),
      );
  }
}