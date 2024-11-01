// lib/views/edit_profile_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../models/user_model.dart';

class EditProfileView extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Profile'),
        actions: [
          IconButton(
            onPressed: () {
              // Update data profil
              UserModel user = UserModel(
                id: "userId",  // Ganti dengan user ID yang valid
                email: emailController.text,
                name: nameController.text,
                phone: phoneController.text,
                address: addressController.text,
                photoUrl: controller.userProfile.value.photoUrl,
              );
              controller.updateProfile(user);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Tambahkan logika untuk mengubah foto
              },
              child: CircleAvatar(
                radius: 40,
                backgroundImage: controller.userProfile.value.photoUrl != null
                    ? NetworkImage(controller.userProfile.value.photoUrl!)
                    : AssetImage("assets/default_avatar.png") as ImageProvider,
              ),
            ),
            Text("Change Photo"),
            SizedBox(height: 20),
            TextField(
              controller: emailController..text = controller.userProfile.value.email,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: nameController..text = controller.userProfile.value.name,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneController..text = controller.userProfile.value.phone,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: addressController..text = controller.userProfile.value.address,
              decoration: InputDecoration(labelText: 'Address'),
            ),
          ],
        ),
      ),
    );
  }
}
