class Doctors {
  String? doctorName;
  String? image;
  String? speciality;
  String? location;
  int? patientsServed;
  int? yearsOfExperience;
  double? rating;
  int? numberOfReviews;
  Map<String, dynamic>? availability;

  Doctors(
      {this.doctorName,
        this.image,
        this.speciality,
        this.location,
        this.patientsServed,
        this.yearsOfExperience,
        this.rating,
        this.numberOfReviews,
        this.availability});

  Doctors.fromJson(Map<String, dynamic> json) {
    doctorName = json['doctor_name'];
    image = json['image'];
    speciality = json['speciality'];
    location = json['location'];
    patientsServed = json['patients_served'];
    yearsOfExperience = json['years_of_experience'];
    rating = json['rating'];
    numberOfReviews = json['number_of_reviews'];
    availability = json['availability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctor_name'] = doctorName;
    data['image'] = image;
    data['speciality'] = speciality;
    data['location'] = location;
    data['patients_served'] = patientsServed;
    data['years_of_experience'] = yearsOfExperience;
    data['rating'] = rating;
    data['number_of_reviews'] = numberOfReviews;
    data['availability'] = availability;
    return data;
  }
}

