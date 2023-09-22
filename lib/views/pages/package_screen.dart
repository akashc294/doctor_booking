import 'package:doctor_booking/controllers/package_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../utils/custom_button.dart';
import '../widgets/custom_text.dart';
import 'components/package/duration_view.dart';
import 'components/package/package_view.dart';

class PackageScreen extends StatelessWidget {
  PackageScreen({Key? key}) : super(key: key);
  final PackageController controller = Get.find<PackageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText.text(
          Strings.selectPackage,
          color: AppThemeColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        centerTitle: true,
        backgroundColor: AppThemeColors.white,
      ),
      body: _buildBody(),
      backgroundColor: AppThemeColors.white,
      persistentFooterButtons: [CustomButton.btn(Strings.next, () => controller.goToNextScreen())],
    );
  }

  _buildBody() {
    return
      GetBuilder<PackageController>(builder: (logic) {
        return controller.loading?
        const Center(child:
        CircularProgressIndicator()
        ):Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(Strings.selectDuration),
              DurationView(),
              const SizedBox(height: 12,),
              header(Strings.selectPackage),
              const SizedBox(height: 12,),
              const PackageView(),
            ],
          ),
        );
      });
  }

  header(String title) {
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
