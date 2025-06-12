import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildLabel('Email'),
            _buildTextField(controller.emailController, 'Enter your email'),
            const SizedBox(height: 16),
            _buildLabel('Username'),
            _buildTextField(controller.usernameController, 'Enter your username'),
            const SizedBox(height: 16),
            _buildLabel('Password'),
            _buildTextField(
              controller.passwordController,
              'Enter your password',
              obscureText: true,
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: controller.saveProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Save',
                style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ));
  }

  Widget _buildTextField(TextEditingController controller, String hintText,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
