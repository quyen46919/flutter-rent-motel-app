class User {
  String? email;
  String? password;
  String? fullName;
  String? phone;
  String? gender;
  String? dateOfBirth;
  String? address;
  String? city;
  String? country;

  User({
    this.email,
    this.password,
    this.fullName,
    this.phone,
    this.gender,
    this.dateOfBirth,
    this.address,
    this.city,
    this.country,
  });

  User.fromJson(Map<String,dynamic> json) {
    email = json['email'];
    password =json['password'];
    fullName = json['fullName'];
    gender = json['gender'];
    phone = json['phone'];
    dateOfBirth = json['dateOfBirth'];
    city = json['city'];
    address = json['address'];
    country = json['country'];
  }
}