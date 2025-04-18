import 'package:flutter/material.dart';
// Define as cores personalizadas usadas no aplicativo
import 'package:techtaste/ui/_core/app_colors.dart';

// Classe abstrata que define o tema visual do aplicativo
abstract class AppTheme {
  // Define um tema ThemeData estático para o aplicativo
  static ThemeData appTheme = ThemeData.dark().copyWith(
    // Define o tema para os botões elevados (ElevatedButton)
    elevatedButtonTheme: ElevatedButtonThemeData(
      // Define o estilo padrão para os botões elevados
      style: ButtonStyle(
        // Define a cor do texto do botão para todos os estados como preto
        foregroundColor: WidgetStatePropertyAll(Colors.black),
        // Define a cor de fundo do botão com base em seu estado
        backgroundColor: WidgetStateColor.resolveWith((states) {
          // Se o botão estiver desabilitado, retorna a cor cinza
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey;
          }
          // Se o botão estiver pressionado, retorna uma cor laranja semi-transparente
          else if (states.contains(WidgetState.pressed)) {
            return const Color.fromARGB(171, 255, 164, 89);
          }
          // Para outros estados (habilitado, etc.), retorna a cor principal definida em AppColors
          return AppColors.mainColor;
        }),
      ),
    ),
  );
}
