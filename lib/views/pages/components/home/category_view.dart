import 'package:doctor_booking/controllers/home_controller.dart';
import 'package:doctor_booking/views/widgets/category_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
  CategoryView({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
        height: 35,
        child: GetBuilder<HomeController>(
          assignId: true,
          builder: (logic) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard(
                  controller.categories[index],
                  changeCategory: () =>
                      controller.changeCategory(controller.categories[index]),
                );
              },
            );
          },
        )
    );
  }
}
