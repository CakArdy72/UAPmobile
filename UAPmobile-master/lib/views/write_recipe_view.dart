import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/write_resep_controller.dart';

class WriteRecipeView extends StatelessWidget {
  final WriteResepController controller = Get.put(WriteResepController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tulis Resep'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: controller.titleController,
                decoration: InputDecoration(labelText: 'Judul Resep'),
              ),
              TextField(
                controller: controller.portionController,
                decoration: InputDecoration(labelText: 'Porsi'),
              ),
              TextField(
                controller: controller.durationController,
                decoration: InputDecoration(labelText: 'Durasi'),
              ),
              TextField(
                controller: controller.storyController,
                decoration: InputDecoration(labelText: 'Cerita Asal Resep'),
                maxLines: 3,
              ),
              SizedBox(height: 16),
              Obx(() {
                return controller.imagePath.value.isEmpty
                    ? Text('Belum ada gambar yang dipilih')
                    : Image.file(File(controller.imagePath.value));
              }),
              ElevatedButton(
                onPressed: () async {
                  await controller.uploadImage();
                },
                child: Text('Unggah Gambar'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await controller.uploadRecipe();
                },
                child: Text('Unggah Resep'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
