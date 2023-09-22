import 'package:doctor_booking/constants/colors.dart';
import 'package:doctor_booking/controllers/home_controller.dart';
import 'package:doctor_booking/views/pages/components/home/category_view.dart';
import 'package:doctor_booking/views/pages/components/home/doctor_list_view.dart';
import 'package:doctor_booking/views/pages/components/home/search_view.dart';
import 'package:doctor_booking/views/widgets/custom_text.dart';
import 'package:doctor_booking/views/widgets/dashboard_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/assets.dart';
import '../../constants/strings.dart';
import '../loaders/category_shimmer.dart';
import '../loaders/doctor_shimmer.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  HomeController controller = Get.find<HomeController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      key: _drawerKey,
      drawer: const DashboardDrawer(),
    );
  }

  _buildBody() {
    return Stack(
      children: [
        Image.asset(
          Assets.abstract,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topView(),
            middleView(),
            SearchView((value) => controller.onSearch(value)),
            const SizedBox(height: 8,),
            GetBuilder<HomeController>(builder: (logic) {
              return Expanded(
                child: Column(
                  children: [
                    controller.getLoading()
                        ? const CategoryShimmer()
                        : CategoryView(),
                    controller.getLoading()
                        ? const DoctorShimmer()
                        : DoctorListView(),
                  ],
                ),
              );
            })
          ],
        ),
      ],
    );
  }

  topView() {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 8, right: 16),
      padding: const EdgeInsets.all(8.0),
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {
            _drawerKey.currentState?.openDrawer();
          }, icon: Icon(Icons.menu, color: AppThemeColors.white,)),
          GestureDetector(
            onTap: (){
              controller.navigateToConfirmationScreen();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: AppThemeColors.purple
              ),
              child: CustomText.text(
                  "My Bookings",
                fontWeight: FontWeight.bold,
                color: AppThemeColors.white
              ),
            )
          )

        ],
      ),
    );
  }

  middleView() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.text(Strings.hello,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppThemeColors.black,
              fontFamily: GoogleFonts
                  .aleo()
                  .fontFamily
          ),
          CustomText.text(
              Strings.dashboardGreet,
              fontSize: 18,
              color: AppThemeColors.black.withOpacity(0.7),
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts
                  .aleo()
                  .fontFamily
          ),
        ],
      ),
    );
  }

}
