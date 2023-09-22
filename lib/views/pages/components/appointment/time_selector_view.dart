import 'package:doctor_booking/controllers/appointment_controller.dart';
import 'package:doctor_booking/views/widgets/time_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TimeSelectorView extends StatelessWidget {
  TimeSelectorView({Key? key}) : super(key: key);

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
              itemCount: controller.selectedDateTimeSlots.length,
              itemBuilder: (BuildContext context, int index) {
                return TimeCard(
                  controller.selectedDateTimeSlots[index],
                  changeDateSlot: () =>
                      controller.changeTimeSlot(controller.selectedDateTimeSlots[index]),
                );
              },
            );
          },
        )
    );
  }
}
