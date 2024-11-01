// lib/models/user_model.dart
class UserModel {
  String? id;
  String email;
  String name;
  String phone;
  String address;
  String? photoUrl;

  UserModel({
    this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.address,
    this.photoUrl,
  });

  // Konversi data dari/ke Map untuk Firebase
  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      email: map['email'],
      name: map['name'],
      phone: map['phone'],
      address: map['address'],
      photoUrl: map['photoUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'address': address,
      'photoUrl': photoUrl,
    };
  }
}
