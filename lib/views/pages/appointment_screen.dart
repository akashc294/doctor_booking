import 'package:doctor_booking/constants/colors.dart';
import 'package:doctor_booking/controllers/appointment_controller.dart';
import 'package:doctor_booking/views/pages/components/appointment/day_selector_view.dart';
import 'package:doctor_booking/views/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../constants/strings.dart';
import '../../utils/custom_button.dart';
import '../widgets/info_card.dart';
import 'components/appointment/time_selector_view.dart';

class AppointmentScreen extends StatelessWidget {
   AppointmentScreen({Key? key}) : super(key: key);

   final AppointmentController controller = Get.find<AppointmentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText.text(
          Strings.bookAppointment,
          color: AppThemeColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        centerTitle: true,
        backgroundColor: AppThemeColors.white,
      ),
      body: _buildBody(),
      backgroundColor: AppThemeColors.white,

      persistentFooterButtons: [
        CustomButton.btn(Strings.makeAppointment, () => controller.makeAppointment())
      ],
    );
  }

  Widget _buildBody() {
    return Container(
      padding: const  EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topView(),
          const SizedBox(height: 12,),
          const Divider(),
          const SizedBox(height: 12,),
          middleView(),
          dayTimeHeader(Strings.day),
          DaySelectorView(),
          dayTimeHeader(Strings.time),
          TimeSelectorView(),
        ],
      ),
    );
  }

  topView() {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0)
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            child: Image.network(
              controller.doctor.image!,
              loadingBuilder:(context,child,loadingProgress){
                if (loadingProgress == null) return child;
                return  Center(child: CupertinoActivityIndicator(color: AppThemeColors.grey,));
              },
              errorBuilder:(context,object,_){
                return  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(Assets.splash)
                );
              },
              color: AppThemeColors.blueShade,
              colorBlendMode:BlendMode.softLight,
            ),
          ),
        ),
        const SizedBox(width: 16.0,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.text(
                controller.doctor.doctorName!,
              color: AppThemeColors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
            CustomText.text(
                controller.doctor.speciality!,
                color: AppThemeColors.black
            ),
            const SizedBox(height: 12,),
            CustomText.richText(
                controller.doctor.location!,
                Icon(Icons.location_pin,color: AppThemeColors.error,size: 16,),
                colors: AppThemeColors.grey
            ),
          ],
        ),
      ],
    );
  }

  middleView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InfoCard(Strings.patients,controller.doctor.patientsServed!,Icons.group),
            InfoCard(Strings.experience,controller.doctor.yearsOfExperience!,Icons.access_time_filled),
            InfoCard(Strings.rating,controller.doctor.rating!.toInt(),Icons.data_exploration_rounded),
            InfoCard(Strings.review,controller.doctor.numberOfReviews!,Icons.reviews),
          ],
        ),
        const SizedBox(height: 24),
        CustomText.text(
          Strings.bookAppointment.toUpperCase(),
          fontWeight: FontWeight.w600,
          color: AppThemeColors.grey.withOpacity(0.7)
        ),
      ],
    );
  }

  dayTimeHeader(String title){
    return Column(
      children: [
        const SizedBox(height: 16),
        CustomText.text(
            title,
            fontWeight: FontWeight.w600,
            fontSize: 18
        ),
        const SizedBox(height: 16),
      ],
    );
  }

}
