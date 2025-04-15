import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/data/restaurant_data.dart';
import 'package:techtaste/ui/_core/app_theme.dart';
import 'package:techtaste/ui/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantData restaurantData = RestaurantData();
  await restaurantData.getRestaurants();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return restaurantData;
          },
        ),
      ],
      child: MyApp(),
    ),
  ); // Instancia a classe MyApp
}

// Cria a classe MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Retorna o widget MaterialApp - estilização de app Google
    return MaterialApp(theme: AppTheme.appTheme, home: SplashScreen());
  }
}
