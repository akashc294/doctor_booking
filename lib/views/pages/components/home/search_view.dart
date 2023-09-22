import 'package:doctor_booking/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  Function (String)onChanged;
  SearchView(this.onChanged,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: AppThemeColors.white,
          borderRadius: BorderRadius.circular(20.0)
        ),
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          decoration: const InputDecoration(
            hintText: 'Search Name...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius :  BorderRadius.all(Radius.circular(20.0))
            ),
          ),
          onChanged: (value) {
            onChanged(value.toString());
          },
        ),
      ),
    );
  }
}
