import 'package:doctor_booking/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'custom_text.dart';

class InfoCard extends StatelessWidget {
  InfoCard(this.type,this.count,this.icon,{Key? key}) : super(key: key);
  String type;
  int count;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: AppThemeColors.purple.withOpacity(0.06),
                borderRadius: BorderRadius.circular(60)
            ),
            child:  Icon(icon,color: AppThemeColors.purple,)
        ),
        const SizedBox(height: 4,),
        CustomText.text(
            "$count+",
            color: AppThemeColors.purple,
            fontWeight: FontWeight.bold,
            fontSize: 18
        ),
        CustomText.text(
            type,
            fontSize: 12
        ),
      ],
    );
  }
}
