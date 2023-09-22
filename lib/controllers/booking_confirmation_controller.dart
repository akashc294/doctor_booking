import 'package:doctor_booking/models/confirmation.dart';
import 'package:doctor_booking/repositories/doctors_repo.dart';
import 'package:doctor_booking/routes/routes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingConfirmationController extends GetxController{
  late Confirmation bookingConfirmation;
  bool _isLoading = true;

  bool getLoading() => _isLoading;

  setLoading(bool status) {
    _isLoading = status;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (_isLoading) {
      getConfirmationData();
    }
    super.onInit();
  }

  getConfirmationData() async {
    var data = await DoctorsRepo().getConfirmation();
    bookingConfirmation = data;
    setLoading(false);
    update();
  }

  String getFormattedDate(){
    DateFormat dateFormatFrom = DateFormat("yyyy-MM-dd");
    DateFormat dateFormatTo = DateFormat("d MMM, yyyy");
    if(bookingConfirmation.appointmentDate != null){
      return dateFormatTo.format(dateFormatFrom.parse(bookingConfirmation.appointmentDate!));
    }else{
      return "";
    }
  }

  String getFormattedTime(){
    DateFormat timeFormatFrom = DateFormat("hh:mm a");
    DateFormat timeFormatTo = DateFormat("h:mm a");
    if(bookingConfirmation.appointmentTime != null){
      return timeFormatTo.format(timeFormatFrom.parse(bookingConfirmation.appointmentTime!.split("-")[0]));
    }else{
      return "";
    }
  }

  navigateToViewAllBookingsScreen() {
    Get.toNamed(AppRoutes.viewAllBookings);
  }

  goToHomeScreen(){
    Get.offAllNamed(AppRoutes.homeScreen);
  }

}