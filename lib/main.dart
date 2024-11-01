import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/profile_controller.dart';
import 'views/edit_profile_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();// Initialize Firebase here if not initialized already
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Profile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EditProfileView(),
    );
  }
}
