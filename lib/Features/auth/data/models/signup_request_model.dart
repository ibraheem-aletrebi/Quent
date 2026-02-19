class SignupRequestModel {
  final String fullName;
  final String email;
  final String phone;
  final String locationId;
  final String countryId;
  final String password;
  final String availableToAddCar;
  final String? nationalId;
  final String? birthDate;
  SignupRequestModel({
    required this.fullName,
    required this.email,
    required this.password,
    required this.phone,
    required this.locationId,
    required this.countryId,
    required this.availableToAddCar,
    this.nationalId,
    this.birthDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email': email,
      'password': password,
      'phone': phone,
      'location_id': locationId,
      'country_id': countryId,
      'available_to_add_car': availableToAddCar,
      'national_id': nationalId,
      'birth_date': birthDate,
    };
  }
}
