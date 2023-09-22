import 'package:doctor_booking/constants/assets.dart';
import 'package:doctor_booking/constants/colors.dart';
import 'package:doctor_booking/constants/strings.dart';
import 'package:doctor_booking/controllers/view_all_bookings_controller.dart';
import 'package:doctor_booking/models/all_bookings.dart';
import 'package:doctor_booking/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentCard extends StatelessWidget {
  AllBookings bookingsData;
  AppointmentCard({required this.bookingsData, Key? key}) : super(key: key);
  final controller = Get.find<ViewAllBookingsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(color: AppThemeColors.lightGrey.withOpacity(0.6))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.text(
            "${controller.getFormattedDate(bookingsData.appointmentDate??"")} - ${controller.getFormattedTime(bookingsData.appointmentTime??"")}",
            fontWeight: FontWeight.bold,
            fontSize: 16.0
          ),
          const SizedBox(height: 10.0,),
          Divider(
            height: 1.0,
            color: AppThemeColors.lightGrey.withOpacity(0.6),
          ),
          const SizedBox(height: 14.0,),
          Row(
            children: [
              Container(
                height: 90.0,
                width: 90.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                      image: AssetImage(Assets.splash),
                    fit: BoxFit.fill,
                  ),
                )
              ),
              const SizedBox(width: 14.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.56,
                    child: CustomText.text(
                      bookingsData.doctorName??"",
                      fontWeight: FontWeight.bold,
                      overFlow: TextOverflow.ellipsis,
                      maxLines: 2
                    ),
                  ),
                  const SizedBox(height: 4.0,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppThemeColors.grey.withOpacity(0.7),
                        size: 16.0,
                      ),
                      const SizedBox(width: 4.0,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: CustomText.text(
                          bookingsData.location??"",
                          color: AppThemeColors.grey.withOpacity(0.8),
                          fontWeight: FontWeight.w400,
                          fontSize: 13.0,
                          overFlow: TextOverflow.ellipsis,
                          maxLines: 2
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.bookmark_border_sharp,
                        color: AppThemeColors.grey.withOpacity(0.7),
                        size: 16.0,
                      ),
                      const SizedBox(width: 4.0,),
                      CustomText.text(
                          "${Strings.bookingId} : ",
                          color: AppThemeColors.grey.withOpacity(0.8),
                          fontWeight: FontWeight.w400,
                          fontSize: 13.0,
                          overFlow: TextOverflow.ellipsis,
                          maxLines: 2
                      ),
                      CustomText.text(
                          "#${bookingsData.bookingId}",
                          color: AppThemeColors.purple,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.0,
                          overFlow: TextOverflow.ellipsis,
                          maxLines: 2
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 14.0,),
          Divider(
            height: 1.0,
            color: AppThemeColors.lightGrey.withOpacity(0.6),
          ),
          const SizedBox(height: 14.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.38,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: AppThemeColors.purple.withOpacity(0.4)
                ),
                child: Center(
                  child: CustomText.text(
                      Strings.cancel,
                      color: AppThemeColors.purple,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.38,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    color: AppThemeColors.purple
                ),
                child: Center(
                  child: CustomText.text(
                    Strings.reschedule,
                    color: AppThemeColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
