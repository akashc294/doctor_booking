import 'package:doctor_booking/models/doctors.dart';
import 'package:get/get.dart';
import '../routes/routes.dart';

class ReviewController extends GetxController{
  late Doctors doctor;
  late String package;
  late String duration;
  late DateTime date;
  late String time;
  bool _isLoading = true;

  bool get loading=>_isLoading;

  setLoading(bool status) {
    _isLoading = status;
  }

  @override
  void onInit() {
    if(_isLoading){
      getArgs();
    }


    super.onInit();
  }

  void getArgs(){
    doctor = Get.arguments['doctor'];
    package = Get.arguments['package'];
    duration = Get.arguments['duration'];
    date = Get.arguments['date'];
    time = Get.arguments['time'];
    setLoading(false);
    update();
  }

  void updateDuration(String duration ){
    //selectedDuration = duration;
    update();
  }

  void updatePackage(String package ){
    //selectedPackage = package;
    update();
  }


  goToNextScreen(){
    Get.toNamed(AppRoutes.bookingConfirmation);
  }
}