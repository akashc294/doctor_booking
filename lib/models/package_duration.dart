class PackageDuration {
  List<String>? duration;
  List<String>? package;

  PackageDuration({this.duration, this.package});

  PackageDuration.fromJson(Map<String, dynamic> json) {
    duration = json['duration'].cast<String>();
    package = json['package'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['duration'] = duration;
    data['package'] = package;
    return data;
  }
}