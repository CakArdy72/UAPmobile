import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/inspiration_controller.dart';
import 'pages/welcome_page.dart';
import 'views/login_view.dart';
import 'bindings/login_binding.dart';
import 'views/register_view.dart';
import 'bindings/register_binding.dart';
import 'views/dashboard_view.dart';
import 'views/profile_view.dart';
import 'views/write_recipe_view.dart';
import 'views/favorites_view.dart';
import 'views/inspiration_view.dart';
import 'bindings/dashboard_binding.dart';
import 'bindings/inspiration_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/welcome', // Set initial route
      getPages: [
        // Daftar routing
        GetPage(
          name: '/welcome',
          page: () => WelcomePage(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginView(),
          binding: LoginBinding(), // Binding untuk login
        ),
        GetPage(
          name: '/register',
          page: () => RegisterView(),
          binding: RegisterBinding(), // Binding untuk register
        ),
        GetPage(
          name: '/dashboard_view',
          page: () => DashboardView(),
          binding: DashboardBinding(), // Binding untuk dashboard
        ),
        GetPage(
          name: '/profile',
          page: () => ProfileView(),
        ),
        GetPage(
          name: '/write_recipe',
          page: () => WriteRecipeView(),
        ),
        GetPage(
          name: '/favorites',
          page: () => FavoritesView(),
        ),
        GetPage(
          name: '/inspiration',
          page: () => InspirationView(),
          binding: InspirationBinding(), // Gunakan binding untuk inspiration
        ),
      ],
    );
  }
}