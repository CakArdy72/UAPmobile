import 'package:apkmasak/views/meal_detail_view.dart';
import 'package:apkmasak/views/webview_screen.dart'; // Import WebViewScreen
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Menghapus title agar tidak ada teks 'Home'
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Menghilangkan panah kiri atas (back button)
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0), // Mengubah padding untuk search bar
            child: TextField(
              controller: searchController,
              onChanged: (query) {
                controller.searchMeals(query);
              },
              decoration: InputDecoration(
                hintText: 'Cari Makanan...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigasi ke halaman WebView
              Get.to(
                WebViewScreen(
                  url: 'https://www.masakapahariini.com/resep/',
                  title: 'Resep Masak Apa Hari Ini',
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              'Lihat Resep di Website',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return Expanded(
                child: PageView.builder(
                  itemCount: controller.filteredMeals.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final meal = controller.filteredMeals[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15)),
                              child: Image.network(
                                meal.strMealThumb,
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    meal.strMeal,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    meal.strArea ?? 'Unknown Area',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                Get.to(
                                  MealDetailView(meal: meal),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('Detail Resep'),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
