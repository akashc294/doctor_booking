import 'package:doctor_booking/constants/colors.dart';
import 'package:doctor_booking/constants/strings.dart';
import 'package:doctor_booking/controllers/view_all_bookings_controller.dart';
import 'package:doctor_booking/views/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/all_bookings/all_bookings_listview.dart';

class ViewAllBookings extends StatelessWidget {
  ViewAllBookings({Key? key}) : super(key: key);
  final ViewAllBookingsController controller = Get.find<ViewAllBookingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText.text(
          Strings.myBookings,
          color: AppThemeColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        leading: IconButton(
          onPressed: (){
            controller.goToHomeScreen();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: AppThemeColors.lightGrey.withOpacity(0.6),
            height: 1.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppThemeColors.white,
      ),
      body: _buildBody(context),
      backgroundColor: AppThemeColors.white,
    );
  }

  _buildBody(BuildContext context) {
    return GetBuilder<ViewAllBookingsController>(
      assignId: true,
      builder: (logic) {
        return controller.getLoading?
        const Center(
            child: CupertinoActivityIndicator()
        ):
        AllBookingsListView();
      },
    );
  }
}
