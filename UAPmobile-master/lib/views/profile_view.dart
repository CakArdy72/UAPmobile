import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Profile'),
            automaticallyImplyLeading: false, // Menghilangkan panah kiri atas (back button)
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Bagian untuk foto profil
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: controller.profileImage.value != null
                            ? FileImage(controller.profileImage.value!)
                            : null, // Jika tidak ada gambar, biarkan null
                      ),
                      GestureDetector(
                        onTap: () {
                          // Menggunakan pickImage untuk memilih gambar dari galeri
                          controller.pickImage(ImageSource.gallery);
                        },
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.blueAccent,
                          child: Icon(Icons.camera_alt, color: Colors.white, size: 20),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Input untuk data profil
                  _buildTextField(
                    label: 'Full Name',
                    controller: controller.nameController,
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    label: 'Email',
                    controller: controller.emailController,
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    label: 'Phone Number',
                    controller: controller.phoneController,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => controller.saveProfileData(context), // Panggil fungsi untuk menyimpan data
                    child: Text('Simpan Data'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget untuk TextField
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
