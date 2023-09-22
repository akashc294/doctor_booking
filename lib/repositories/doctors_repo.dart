import 'package:dio/dio.dart';
import 'package:doctor_booking/constants/apis.dart';
import 'package:doctor_booking/errors/error_message.dart';
import 'package:doctor_booking/models/all_bookings.dart';
import 'package:doctor_booking/models/confirmation.dart';
import 'package:doctor_booking/models/doctors.dart';
import 'package:doctor_booking/models/package_duration.dart';
import 'package:doctor_booking/services/api_service.dart';

class DoctorsRepo{
  APIService apiService = APIService();

  //--------- Getting List of All Doctors  --------
  Future<List<Doctors>> getDoctors()async{
    List<Doctors> doctors = [];

    try{
      Response response = await apiService.dio.get(
          APIS.doctors,
      );
      List<dynamic> values = response.data;
      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            doctors.add( Doctors.fromJson(map));
          }
        }
      }
    }on DioException catch (exception){
      errorMessage(exception);
    }
    return doctors;
  }

  //--------- Getting List of All Packages  --------
  Future<PackageDuration?> getPackage()async{
    PackageDuration? packageDuration;

    try{
      Response response = await apiService.dio.get(
        APIS.appointmentOptions,
      );

      packageDuration = PackageDuration.fromJson(response.data);

    }on DioException catch (exception){
      errorMessage(exception);
    }
    return packageDuration;
  }

  //--------- Getting Booking Confirmation Details  --------
  Future<Confirmation> getConfirmation()async{
    late Confirmation bookingConfirmation;

    try{
      Response response = await apiService.dio.get(
        APIS.bookingConfirmation,
      );
      bookingConfirmation = Confirmation.fromJson(response.data);
    }on DioException catch (exception){
      errorMessage(exception);
    }
    return bookingConfirmation;
  }

  //--------- Getting List of All Bookings  --------
  Future<List<AllBookings>> getAllBookings()async{
    List<AllBookings> allBookings = [];

    try{
      Response response = await apiService.dio.get(
        APIS.appointments,
      );
      List<dynamic> values = response.data;
      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            allBookings.add( AllBookings.fromJson(map));
          }
        }
      }
    }on DioException catch (exception){
      errorMessage(exception);
    }
    return allBookings;
  }

}