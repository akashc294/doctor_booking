import 'package:doctor_booking/constants/colors.dart';
import 'package:doctor_booking/models/date_time.dart';
import 'package:flutter/cupertino.dart';
import 'custom_text.dart';

class TimeCard extends StatelessWidget {
  TimeModel time;
  Function()changeDateSlot;
  TimeCard(this.time,{Key? key,required this.changeDateSlot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        changeDateSlot();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        decoration: BoxDecoration(
            color: time.isSelected!?AppThemeColors.purple:AppThemeColors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(40.0),
            border: Border.all(
                color: AppThemeColors.grey.withOpacity(0.4)
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText.text(
                  time.time!,
                  color: time.isSelected!?AppThemeColors.white:AppThemeColors.black,
                  fontSize: 12
              ),
            ],
          ),
        ),
      ),
    );
  }
}
