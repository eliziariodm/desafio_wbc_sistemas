import 'dart:convert';

class UserModel {
  final String name;
  final String email;

  UserModel({
    required this.name,
    required this.email,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email)';
  }
}
