import 'package:doctor_booking/constants/colors.dart';
import 'package:doctor_booking/models/categories.dart';
import 'package:doctor_booking/views/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  Categories category;
  Function()changeCategory;
  CategoryCard(this.category,{required this.changeCategory,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        changeCategory();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        constraints: const BoxConstraints(
          minWidth: 60,
        ),
        decoration: BoxDecoration(
          color: category.isSelected!?AppThemeColors.purple:AppThemeColors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: Center(
          child: CustomText.text(
              category.name!.capitalize!,
              color: category.isSelected!?AppThemeColors.white:AppThemeColors.black
          ),
        ),
      ),
    );
  }
}
