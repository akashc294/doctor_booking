import 'package:doctor_booking/controllers/view_all_bookings_controller.dart';
import 'package:doctor_booking/views/widgets/appointment_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AllBookingsListView extends StatelessWidget {
  AllBookingsListView({Key? key}) : super(key: key);
  final controller = Get.find<ViewAllBookingsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewAllBookingsController>(builder: (logic) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: controller.allBookings.length,
        itemBuilder: (BuildContext context, int index) {
          return AppointmentCard(
            bookingsData: controller.allBookings[index],
          );
        },
      );
    });
  }
}
