class User {
  String name;
  String email;
  String phone;
  String address;

  User(this.name, this.email, this.phone, this.address);

  String getInitials(String name) =>
      name.trim().split(' ').map((l) => l[0]).take(2).join();

  Map<String, String> get toMap => {
        "name": name,
        "initials": getInitials(name),
        "email": email,
        "phone": phone,
        "address": address,
      };
}
