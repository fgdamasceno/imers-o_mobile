import 'package:flutter/material.dart';
// Define as cores personalizadas usadas no aplicativo
import 'package:techtaste/ui/_core/app_colors.dart';

// Widget que exibe uma categoria individualmente
class CategoryWidget extends StatelessWidget {
  // String que representa o nome da categoria a ser exibida
  final String category;
  // Construtor do CategoryWidget que requer o nome da categoria
  const CategoryWidget({super.key, required this.category});

  @override
  // Método que constrói a interface do widget
  Widget build(BuildContext context) {
    // Um container com dimensões fixas e decoração
    return Container(
      width: 100,
      height: 100,
      // Define a aparência visual do container, como cor de fundo e borda arredondada
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      // Organiza seus filhos em uma coluna vertical
      child: Column(
        // Alinha os filhos verticalmente ao centro
        mainAxisAlignment: MainAxisAlignment.center,
        // Alinha os filhos horizontalmente ao centro
        crossAxisAlignment: CrossAxisAlignment.center,
        // Espaçamento entre os filhos da coluna
        spacing: 8.0,
        // Ocupa o mínimo de espaço vertical necessário
        mainAxisSize: MainAxisSize.min,
        // Lista de widgets filhos da coluna
        children: [
          // Widget para exibir uma imagem de um asset
          Image.asset(
            "assets/categories/${category.toLowerCase()}.png",
            height: 48,
          ),
          // Widget para exibir um texto
          Text(
            category,
            // Define o estilo do texto, como tamanho e peso da fonte
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
