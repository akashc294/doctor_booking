import 'package:doctor_booking/constants/colors.dart';
import 'package:doctor_booking/controllers/review_controller.dart';
import 'package:doctor_booking/utils/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../constants/assets.dart';
import '../../constants/strings.dart';
import '../widgets/custom_text.dart';

class ReviewAppointment extends StatelessWidget {
  ReviewAppointment({Key? key}) : super(key: key);
  final ReviewController controller = Get.find<ReviewController>();

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
      persistentFooterButtons: [CustomButton.btn(Strings.confirm, () => controller.goToNextScreen())],
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
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.text(
                Strings.dateAndHour,
              fontWeight: FontWeight.bold,
              color: AppThemeColors.grey
            ),
            CustomText.text(
                "${DateFormat("MMMM dd, yyyy").format(controller.date)} | ${controller.time}",
                fontWeight: FontWeight.bold,
                color: AppThemeColors.black
            )
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.text(
                Strings.package,
                fontWeight: FontWeight.bold,
                color: AppThemeColors.grey
            ),
            CustomText.text(
                controller.package,
                fontWeight: FontWeight.bold,
                color: AppThemeColors.black
            )
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.text(
                Strings.duration,
                fontWeight: FontWeight.bold,
                color: AppThemeColors.grey
            ),
            CustomText.text(
                controller.duration,
                fontWeight: FontWeight.bold,
                color: AppThemeColors.black
            )
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.text(
                Strings.bookingFor,
                fontWeight: FontWeight.bold,
                color: AppThemeColors.grey
            ),
            CustomText.text(
                Strings.self,
                fontWeight: FontWeight.bold,
                color: AppThemeColors.black
            )
          ],
        ),
      ],
    );
  }

}
