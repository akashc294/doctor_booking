import 'package:flutter/material.dart';
import '../../constants/assets.dart';
import '../../constants/colors.dart';
import 'custom_text.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                color: AppThemeColors.purple
            ),
            child: CustomText.text(
                "",
                fontSize: 24
            ),
          ),
          ListTile(
            title: Image.asset(Assets.splash,fit: BoxFit.fill,),
          )
        ],
      ),
    );
  }
}
