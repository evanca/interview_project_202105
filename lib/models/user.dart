class User {
  String name;
  String email;
  String phone;
  String address;

  User({this.name, this.email, this.phone, this.address});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        address: "${json['address']['city']}, ${json['address']['street']}");
  }

  String getInitials(String name) =>
      name.trim().split(' ').map((l) => l[0]).take(2).join();

  Map<String, dynamic> get toMap => {
        "name": name,
        "initials": getInitials(name),
        "email": email,
        "phone": phone,
        "address": address,
      };
}
