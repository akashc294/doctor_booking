import 'package:doctor_booking/models/all_bookings.dart';
import 'package:doctor_booking/repositories/doctors_repo.dart';
import 'package:doctor_booking/routes/routes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ViewAllBookingsController extends GetxController{
  bool _isLoading = true;
  List<AllBookings> allBookings = [];

  bool get getLoading => _isLoading;

  setLoading(bool status) {
    _isLoading = status;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (_isLoading) {
      getAllBookingsData();
    }
    super.onInit();
  }

  getAllBookingsData() async {
    var data = await DoctorsRepo().getAllBookings();
    allBookings = data;
    setLoading(false);
    update();
  }

  String getFormattedDate(String appointmentDate){
    DateFormat dateFormatFrom = DateFormat("yyyy-MM-dd");
    DateFormat dateFormatTo = DateFormat.yMMMd();
    if(appointmentDate != ""){
      return dateFormatTo.format(dateFormatFrom.parse(appointmentDate));
    }else{
      return appointmentDate;
    }
  }

  String getFormattedTime(String appointmentTime) {
    DateFormat timeFormatFrom = DateFormat("hh:mm a");
    DateFormat timeFormatTo = DateFormat("h:mm a");
    if(appointmentTime != ""){
      return timeFormatTo.format(timeFormatFrom.parse(appointmentTime.split("-")[0]));
    }else{
      return appointmentTime;
    }
  }

  goToHomeScreen(){
    Get.offAllNamed(AppRoutes.homeScreen);
  }
}