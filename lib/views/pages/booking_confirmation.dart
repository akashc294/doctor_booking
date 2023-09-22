import 'package:doctor_booking/constants/colors.dart';
import 'package:doctor_booking/constants/strings.dart';
import 'package:doctor_booking/controllers/booking_confirmation_controller.dart';
import 'package:doctor_booking/utils/custom_button.dart';
import 'package:doctor_booking/views/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingConfirmation extends StatelessWidget {
  BookingConfirmation({Key? key}) : super(key: key);
  final BookingConfirmationController controller = Get.find<BookingConfirmationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText.text(
          Strings.confirmation,
          color: AppThemeColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        centerTitle: true,
        backgroundColor: AppThemeColors.white,
      ),
      body: _buildBody(context),
      backgroundColor: AppThemeColors.white,
      persistentFooterButtons: [
        Column(
          children: [
            CustomButton.btn(
                Strings.viewAppointments,
                    () => controller.navigateToViewAllBookingsScreen()
            ),
            GestureDetector(
              onTap: ()=>controller.goToHomeScreen(),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: CustomText.text(
                      Strings.bookAnother,
                      color: AppThemeColors.purple,
                      textAlign: TextAlign.center,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  _buildBody(BuildContext context) {
    return GetBuilder<BookingConfirmationController>(builder: (logic) {
      return controller.getLoading() ? const Center(
        child: CupertinoActivityIndicator(),
      ) : SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 90.0,),
            Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppThemeColors.purple
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 60.0,
                )
            ),
            const SizedBox(height: 24.0,),
            CustomText.text(
                Strings.appointmentConfirmed,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
            const SizedBox(height: 16.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  CustomText.text(
                      Strings.confirmSuccessMsg,
                      fontSize: 14.0,
                      color: AppThemeColors.grey.withOpacity(0.6),
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center
                  ),
                  CustomText.text(
                      controller.bookingConfirmation.doctorName ?? "",
                      fontSize: 14.0,
                      color: AppThemeColors.black,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center
                  ),
                  const SizedBox(height: 36.0,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.person, color: AppThemeColors.purple,size: 24.0),
                      const SizedBox(width: 6.0,),
                      CustomText.text(
                          controller.bookingConfirmation.appointmentPackage??"",
                        fontWeight: FontWeight.bold,
                        color: AppThemeColors.black.withOpacity(0.8)
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0,),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month, color: AppThemeColors.purple,size: 24.0),
                              const SizedBox(width: 6.0,),
                              CustomText.text(
                                  controller.getFormattedDate(),
                                  fontWeight: FontWeight.bold,
                                  color: AppThemeColors.black.withOpacity(0.8)
                              )
                            ],
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Icon(Icons.timer, color: AppThemeColors.purple,size: 24.0),
                              const SizedBox(width: 6.0,),
                              CustomText.text(
                                  controller.getFormattedTime(),
                                  fontWeight: FontWeight.bold,
                                  color: AppThemeColors.black.withOpacity(0.8)
                              )
                            ],
                          )
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

}
