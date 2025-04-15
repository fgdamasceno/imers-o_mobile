import 'package:flutter/material.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Image.asset('assets/banners/banner_splash.png'),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 32,
                children: [
                  Image.asset('assets/logo.png', width: 192),
                  Column(
                    children: [
                      Text(
                        "Um parceiro inovador para sua",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Text(
                        "melhor experiência culinária!",
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator - faz a transicao entre telas
                        // pushReplacement - coloca uma nova tela substituindo a antiga
                        Navigator.pushReplacement(
                          context,
                          // faz o roteamento utilizando o Material app
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      },
                      child: Text('Bora!'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
