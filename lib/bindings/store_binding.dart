import 'package:doctor_booking/controllers/appointment_controller.dart';
import 'package:doctor_booking/controllers/booking_confirmation_controller.dart';
import 'package:doctor_booking/controllers/home_controller.dart';
import 'package:doctor_booking/controllers/package_controller.dart';
import 'package:doctor_booking/controllers/review_controller.dart';
import 'package:doctor_booking/controllers/view_all_bookings_controller.dart';
import 'package:get/get.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(),fenix: true);
    Get.lazyPut(() => AppointmentController(),fenix: true);
    Get.lazyPut(() => PackageController(),fenix: true);
    Get.lazyPut(() => ReviewController(),fenix: true);
    Get.lazyPut(() => BookingConfirmationController(),fenix: true);
    Get.lazyPut(() => ViewAllBookingsController(),fenix: true);
    }
}