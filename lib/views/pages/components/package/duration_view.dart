import 'package:doctor_booking/constants/colors.dart';
import 'package:doctor_booking/controllers/package_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DurationView extends StatelessWidget {
  DurationView({Key? key}) : super(key: key);

  PackageController controller = Get.find<PackageController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PackageController>(builder: (logic) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: AppThemeColors.grey.withOpacity(0.5))
        ),
        width: Get.width,
        child: Row(
          children: [
            const SizedBox(width: 8.0,),
            Icon(Icons.access_time_filled_sharp,color: AppThemeColors.purple,),
            Expanded(
              child: DropdownButton2(
                isExpanded: true,
                value: controller.selectedDuration,
                items: controller.packageDuration.duration?.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  controller.updateDuration(newValue!);
                },
                iconStyleData:const IconStyleData(
                    icon: Icon(Icons.arrow_drop_down_sharp)
                ),
                dropdownStyleData: DropdownStyleData(
                    offset: const Offset(0.0,-4.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0)
                    ),
                    maxHeight: 400,
                    padding: EdgeInsets.zero
                ),
                menuItemStyleData: const MenuItemStyleData(
                    height: 40.0,
                    padding: EdgeInsets.symmetric(horizontal: 12.0)
                ),
                buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 4.0)
                ),
                underline:Container()
              ),
            ),
          ],
        ),
      );
    });
  }
}
