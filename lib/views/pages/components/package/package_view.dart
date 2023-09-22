import 'package:doctor_booking/controllers/package_controller.dart';
import 'package:doctor_booking/views/widgets/package_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class PackageView extends StatelessWidget {
  const PackageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GetBuilder<PackageController>(builder: (logic) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: logic.packageDuration.package!.length,
            itemBuilder: (BuildContext context, int index) {
              return PackageCard(
                logic.packageDuration.package![index],
                onSelect: (value )=>logic.updatePackage(value),
              );
            },
          );
        })
    );
  }
}
