import 'package:doctor_booking/constants/colors.dart';
import 'package:doctor_booking/controllers/package_controller.dart';
import 'package:doctor_booking/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/strings.dart';

class PackageCard extends StatelessWidget {
  String name;
  Function (String)onSelect;
  PackageCard(this.name,{required this.onSelect,Key? key}) : super(key: key);

  final controller = Get.find<PackageController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title:  CustomText.text(
            name,
          fontWeight: FontWeight.bold
        ),
        subtitle: CustomText.text(
            "$name ${Strings.withDoctor}",
          fontSize: 12
        ),
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: AppThemeColors.grey.withOpacity(0.4)
          ),
        ),
        leading: Radio<String>(
          value: name,
          groupValue: controller.selectedPackage,
          activeColor: AppThemeColors.purple,
          fillColor: MaterialStateProperty.all(AppThemeColors.purple),
          splashRadius: 20,
          onChanged: (String? value) {
              onSelect(value!);
          },
        ),
      ),
    );
  }
}
