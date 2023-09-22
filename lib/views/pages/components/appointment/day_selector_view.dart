import 'package:doctor_booking/controllers/appointment_controller.dart';
import 'package:doctor_booking/views/widgets/day_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DaySelectorView extends StatelessWidget {
  DaySelectorView({Key? key}) : super(key: key);

  final controller = Get.find<AppointmentController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: GetBuilder<AppointmentController>(
          assignId: true,
          builder: (logic) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: controller.dateList.length,
              itemBuilder: (BuildContext context, int index) {
                return DayCard(
                  controller.dateList[index],
                  changeDateSlot: () =>
                      controller.changeDateSlot(controller.dateList[index]),
                );
              },
            );
          },
        )
    );
  }
}
