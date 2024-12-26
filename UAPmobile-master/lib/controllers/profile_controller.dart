import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final ImagePicker _picker = ImagePicker(); // Objek image picker untuk memilih gambar
  final box = GetStorage(); // Instansi GetStorage untuk menyimpan data

  var profileImage = Rx<File?>(null); // Variabel untuk menyimpan gambar profil
  var selectedImagePath = ''.obs; // Variabel untuk menyimpan path gambar
  var isImageLoading = false.obs; // Variabel untuk status loading

  // Controllers untuk input data profil
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Anda bisa menambahkan logika untuk inisialisasi data di sini jika diperlukan
  }

  @override
  void onReady() {
    super.onReady();
    // Tambahkan logika setelah controller siap
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }

  // Fungsi untuk memilih gambar menggunakan kamera atau galeri
  Future<void> pickImage(ImageSource source) async {
    try {
      isImageLoading.value = true;
      final XFile? pickedFile = await _picker.pickImage(source: source);

      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);  // Memperbarui gambar profil
        selectedImagePath.value = pickedFile.path;  // Memperbarui path gambar
        box.write('imagePath', pickedFile.path); // Menyimpan path gambar ke GetStorage
      } else {
        print('Tidak ada gambar yang dipilih.');
      }
    } catch (e) {
      print('Error memilih gambar: $e');
    } finally {
      isImageLoading.value = false;
    }
  }

  // Fungsi untuk menyimpan data profil (nama, email, telepon, dan gambar)
  void saveProfileData(BuildContext context) {
    // Anda bisa menambahkan logika untuk menyimpan data profil di sini
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data profil berhasil disimpan.')),
    );
  }
}
