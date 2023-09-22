import 'package:doctor_booking/controllers/home_controller.dart';
import 'package:doctor_booking/views/widgets/doctor_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorListView extends StatelessWidget {
  DoctorListView({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GetBuilder<HomeController>(builder: (logic) {
          return ListView.builder(
            controller: controller.scrollController,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: controller.doctors.length,
            itemBuilder: (BuildContext context, int index) {
              return Visibility(
                visible: controller.showDoctorOrNot(controller.doctors[index]),
                child: DoctorCard(
                  controller.doctors[index],
                  navigateToDetails: () => controller.navigateToAppointmentScreen(controller.doctors[index]),
                ),
              );
            },
          );
        })
    );
  }
}
