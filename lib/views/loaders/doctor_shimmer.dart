import 'package:doctor_booking/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class DoctorShimmer extends StatelessWidget {
  const DoctorShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _dummyCard(),
        const SizedBox(height: 16,),
        _dummyCard(),

      ],
    );
  }

  _dummyCard(){
    return SizedBox(
      width: Get.width,
      child: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.white.withOpacity(0.5),
        child: Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
              color: AppThemeColors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 4),
                )
              ]
          ),
        ),
      ),
    );
  }
}
