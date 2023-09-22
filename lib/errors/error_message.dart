import 'package:dio/dio.dart';
import 'package:doctor_booking/constants/colors.dart';
import 'package:get/get.dart';

void errorMessage(DioException e) {
  String? error = "";
  if(e.type == DioExceptionType.badResponse){
    final response = e.response;
    if(response!=null) {
      //error =  response.data['message'];
      error =  response.statusMessage;
    }
  }else if(e.type == DioExceptionType.unknown){
    error = "Please check your internet connection.";
  }else{
    error = "Something went wrong. Please try again later";
  }
  //print("Akash $e");
  //error = e.response?.statusMessage;
  Get.snackbar("Error",error!,
      snackPosition: SnackPosition.BOTTOM,
      colorText: AppThemeColors.error);
}
