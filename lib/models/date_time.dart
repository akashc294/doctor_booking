class DateTimeModel{
  DateTime? date;
  List<TimeModel>? timeSlots;
  bool? isSelected;

  DateTimeModel({this.date,this.timeSlots,this.isSelected});
}

class TimeModel{
  String? time;
  bool? isSelected;

  TimeModel({this.time,this.isSelected});
}