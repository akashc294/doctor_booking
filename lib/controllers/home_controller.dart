import 'package:collection/collection.dart';
import 'package:doctor_booking/models/categories.dart';
import 'package:doctor_booking/repositories/doctors_repo.dart';
import 'package:doctor_booking/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../models/doctors.dart';

class HomeController extends GetxController {
  bool _isLoading = true;
  List<Doctors> doctors = [];
  List<Categories> categories = [];
  String selectedCategory = "All";
  String searchValue = "";
  ScrollController scrollController = ScrollController();
  int count = 0;

  bool getLoading() => _isLoading;

  setLoading(bool status) {
    _isLoading = status;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    categories.add(Categories(name: "All", isSelected: true));

    if (_isLoading) {
      getDoctorsData();
    }
    super.onInit();
  }

  getDoctorsData() async {
    var data = await DoctorsRepo().getDoctors();
    doctors = data;
    doctors.sort((a, b) => a.doctorName!.compareTo(b.doctorName!));

    Map groupedItems = groupItemsByCategory(doctors);
    groupedItems.forEach((key, value) {
      categories.add(Categories(name: key, isSelected: false));
    });
    categories.sort((a, b) => a.name!.compareTo(b.name!));
    setLoading(false);
    update();
  }

  Map groupItemsByCategory(List items) {
    return groupBy(items, (item) => item.speciality);
  }

  navigateToAppointmentScreen(Doctors doctors) {
    Get.toNamed(AppRoutes.appointment, arguments: {"doctor": doctors});
  }

  changeCategory(Categories category) {
    for (var element in categories) {
      element.isSelected = false;
      if (category.name == element.name) {
        element.isSelected = true;
        selectedCategory = category.name!;
      }
    }
    update();
  }

  onSearch(String value) {
    searchValue = value;
    update();
  }

  bool showDoctorOrNot(Doctors dr) {
    return ((dr.speciality!.toLowerCase() == selectedCategory.toLowerCase()) ||
            (selectedCategory.toLowerCase() == "all")) &&
        (dr.doctorName!.toLowerCase().contains(searchValue.toLowerCase()) ||
            searchValue == "");
  }

  navigateToConfirmationScreen() {
    Get.toNamed(AppRoutes.viewAllBookings);
  }
}
