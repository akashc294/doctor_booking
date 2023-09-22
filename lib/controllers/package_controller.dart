import 'package:doctor_booking/models/doctors.dart';
import 'package:doctor_booking/repositories/doctors_repo.dart';
import 'package:get/get.dart';
import '../models/package_duration.dart';
import '../routes/routes.dart';

class PackageController extends GetxController{
  late PackageDuration packageDuration;
  bool _isLoading = true;
  late String selectedDuration;
  late String selectedPackage;

  bool get loading=>_isLoading;

  setLoading(bool status) {
    _isLoading = status;
  }

  @override
  void onInit() {

    if(loading){
      getPackageData();
    }

    super.onInit();
  }

  void updateDuration(String duration ){
    selectedDuration = duration;
    update();
  }

  void updatePackage(String package ){
    selectedPackage = package;
    update();
  }

  getPackageData() async {
    var data = await DoctorsRepo().getPackage();
    packageDuration = data!;
    if(packageDuration.duration!.isNotEmpty){
      selectedDuration = packageDuration.duration![0];
      selectedPackage = packageDuration.package![0];
    }
    setLoading(false);
    update();
  }

  goToNextScreen(){
    Doctors doctor = Get.arguments['doctor'];
    String time = Get.arguments['time'];
    DateTime date = Get.arguments['date'];

    var arguments = {
      "duration":selectedDuration,
      "package":selectedPackage,
      "doctor":doctor,
      "date":date,
      "time":time,
    };
    Get.toNamed(AppRoutes.review,arguments: arguments);
  }
}