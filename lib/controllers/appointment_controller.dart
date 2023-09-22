import 'package:doctor_booking/constants/colors.dart';
import 'package:doctor_booking/models/doctors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/date_time.dart';
import '../routes/routes.dart';

class AppointmentController extends GetxController{
  late Doctors doctor;
  List<DateTimeModel> dateList = [];
  List<TimeModel> selectedDateTimeSlots = [];
  late DateTime selectedDate;
  late String selectedTime;

  @override
  void onInit() {
    // TODO: implement onInit
    doctor = Get.arguments['doctor'];
    doctor.availability!.forEach((key, value) {
      List<dynamic> data = doctor.availability![key];
      List<TimeModel> timeSlot = [];
      for (String element in data) {
        timeSlot.add(
          TimeModel(
            time: element.split(" - ")[0],
            isSelected: false
          )
        );
        timeSlot.add(
            TimeModel(
                time: element.split(" - ")[1],
                isSelected: false
            )
        );
      }
      dateList.add(DateTimeModel(
        date: DateFormat("yyyy-MM-dd").parse(key),
        timeSlots: timeSlot,
        isSelected: false
      ));
    });

    if(dateList.isNotEmpty){
      changeDateSlot(dateList[0]);
    }

    super.onInit();
  }

  changeDateSlot(DateTimeModel dateTimeModel) {
    for (var element in dateList) {
      element.isSelected = false;
      if (dateTimeModel.date == element.date) {
        element.isSelected = true;
        for (var elementTime in element.timeSlots!) {
          elementTime.isSelected = false;
        }
        selectedDateTimeSlots = element.timeSlots!;
        selectedDate = dateTimeModel.date!;
        selectedTime = "";
      }
    }
    update();
  }

  changeTimeSlot(TimeModel timeModel) {
    for (var element in selectedDateTimeSlots) {
      element.isSelected = false;
      if (timeModel.time == element.time) {
        element.isSelected = true;
        selectedTime = element.time!;
      }
    }
    update();
  }

  makeAppointment(){
    if(selectedTime=="") {
      Get.snackbar(
          "Error",
          "Please select time slot",
          colorText:AppThemeColors.error);
      return;
    }
    if(selectedDate.toString()=="") {
      Get.snackbar(
          "Error",
          "Please select date slot",
          colorText:AppThemeColors.error);
      return;
    }

    var arguments = {
      "doctor": doctor,
      "time":selectedTime,
      "date":selectedDate
    };
    Get.toNamed(AppRoutes.package, arguments: arguments);
  }

}