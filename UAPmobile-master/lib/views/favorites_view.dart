import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorit_controller.dart';
import 'package:apkmasak/pages/resep_list_page.dart';  // Import halaman baru

class FavoritView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritController>(
      init: FavoritController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Resep Favorit'),
            automaticallyImplyLeading: false, // Menghilangkan panah back
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_favorit.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Deskripsi di bagian atas
                    Text(
                      'Sekarang kamu tidak perlu bingung lagi untuk cari-cari resep untuk masak makanan favoritmu setiap hari!',
                      style: TextStyle(fontSize: 16, color: Colors.orange),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Kategori Waktu Masakan',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    // Menampilkan kategori makanan secara vertikal
                    Column(
                      children: [
                        // Box Sarapan Besar
                        _buildCategoryTile(
                          title: 'Sarapan',
                          imagePath: 'assets/sarapan.png',
                          onTap: () {
                            Get.to(ResepListPage(category: 'Sarapan', ingredient: 'egg')); // Pindah ke halaman resep sarapan
                          },
                          boxHeight: 180, // Membuat box Sarapan lebih besar
                        ),
                        SizedBox(height: 20),  // Jarak antar kategori

                        // Box Makan Siang
                        _buildCategoryTile(
                          title: 'Makan Siang',
                          imagePath: 'assets/makan_siang.png',
                          onTap: () {
                            Get.to(ResepListPage(category: 'Makan Siang', ingredient: 'lunch')); // Pindah ke halaman resep makan siang
                          },
                          boxHeight: 150, // Menyesuaikan ukuran box Makan Siang
                        ),
                        SizedBox(height: 20),  // Jarak antar kategori

                        // Box Makan Malam
                        _buildCategoryTile(
                          title: 'Makan Malam',
                          imagePath: 'assets/makan_malam.png',
                          onTap: () {
                            Get.to(ResepListPage(category: 'Makan Malam', ingredient: 'dinner')); // Pindah ke halaman resep makan malam
                          },
                          boxHeight: 150, // Menyesuaikan ukuran box Makan Malam
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget untuk menampilkan kategori masakan dengan ukuran box yang lebih besar
  Widget _buildCategoryTile({
    required String title,
    required String imagePath,
    required VoidCallback onTap,
    required double boxHeight, // Menambahkan parameter boxHeight untuk mengatur tinggi box
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: double.infinity, // Lebar gambar menyesuaikan ukuran box
              height: boxHeight, // Menentukan tinggi box
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
