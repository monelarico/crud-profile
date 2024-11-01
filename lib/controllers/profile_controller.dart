// lib/controllers/profile_controller.dart
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class ProfileController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Variabel Rx untuk profil pengguna
  var userProfile = UserModel(email: '', name: '', phone: '', address: '').obs;

  // Fungsi Create: membuat profil pengguna baru
  Future<void> createProfile(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).set(user.toMap());
    } catch (e) {
      print("Error creating profile: $e");
    }
  }

  // Fungsi Read: mengambil profil pengguna
  Future<void> fetchProfile(String userId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        userProfile.value = UserModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }
    } catch (e) {
      print("Error fetching profile: $e");
    }
  }

  // Fungsi Update: memperbarui profil pengguna
  Future<void> updateProfile(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).update(user.toMap());
    } catch (e) {
      print("Error updating profile: $e");
    }
  }

  // Fungsi Delete: menghapus profil pengguna
  Future<void> deleteProfile(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
    } catch (e) {
      print("Error deleting profile: $e");
    }
  }
}
