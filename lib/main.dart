import 'package:doctor_booking/bindings/store_binding.dart';
import 'package:doctor_booking/routes/routes.dart';
import 'package:doctor_booking/views/pages/appointment_screen.dart';
import 'package:doctor_booking/views/pages/booking_confirmation.dart';
import 'package:doctor_booking/views/pages/home_screen.dart';
import 'package:doctor_booking/views/pages/package_screen.dart';
import 'package:doctor_booking/views/pages/review_screen.dart';
import 'package:doctor_booking/views/pages/splash_screen.dart';
import 'package:doctor_booking/views/pages/view_all_bookings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Doctor G App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.root,
      initialBinding: StoreBinding(),
      getPages: [
        GetPage(name: AppRoutes.root, page: ()=>const SplashScreen()),
        GetPage(name: AppRoutes.homeScreen, page: ()=> HomeScreen()),
        GetPage(name: AppRoutes.appointment, page: ()=> AppointmentScreen()),
        GetPage(name: AppRoutes.package, page: ()=> PackageScreen()),
        GetPage(name: AppRoutes.review, page: ()=> ReviewAppointment()),
        GetPage(name: AppRoutes.bookingConfirmation, page: ()=> BookingConfirmation()),
        GetPage(name: AppRoutes.viewAllBookings, page: ()=> ViewAllBookings())
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
