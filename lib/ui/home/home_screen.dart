import 'package:flutter/material.dart';
// Gerenciador de estado Provider, para acessar dados compartilhados
import 'package:provider/provider.dart';
// Classe que contém a lista de categorias de pratos
import 'package:techtaste/data/categories_data.dart';
// Classe que gerencia os dados dos restaurantes
import 'package:techtaste/data/restaurant_data.dart';
// Modelo de dados para representar um restaurante
import 'package:techtaste/model/restaurant.dart';
// Widget AppBar personalizado
import 'package:techtaste/ui/_core/widgets/appbar.dart';
// Widget que exibe uma categoria individual
import 'package:techtaste/ui/home/widgets/category_widget.dart';
// Widget que exibe as informações resumidas de um restaurante
import 'package:techtaste/ui/home/widgets/restaurant_widget.dart';

// Tela principal do aplicativo, exibindo a lista de categorias e restaurantes
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  // Método que constrói a interface do widget
  Widget build(BuildContext context) {
    // Obtém uma instância do RestaurantData usando o Provider.of para acessar a lista de restaurantes
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);
    // Widget base para a estrutura da tela, com AppBar, corpo e drawer
    return Scaffold(
      // Menu lateral que pode ser deslizado para dentro da tela
      drawer: Drawer(),
      // Barra superior da tela
      appBar: getAppBar(context: context),
      // Corpo principal da tela
      body: Padding(
        // Adiciona preenchimento horizontal ao conteúdo do corpo
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        // Widget que permite a rolagem vertical de seu conteúdo
        child: SingleChildScrollView(
          // Organiza seus filhos em uma coluna vertical
          child: Column(
            // Define o espaçamento vertical entre os filhos da coluna
            spacing: 32.0,
            // Alinha os filhos horizontalmente ao início (esquerda)
            crossAxisAlignment: CrossAxisAlignment.start,
            // Lista de widgets filhos da coluna
            children: [
              // Centraliza horizontalmente seu filho, que é uma imagem do logo
              Center(child: Image.asset("assets/logo.png", width: 147)),
              // Widget para exibir um texto de boas-vindas
              Text("Boas-Vindas!"),
              // Campo de texto para permitir que o usuário digite algo
              TextFormField(initialValue: "O que você quer comer?"),
              // Widget para exibir um texto indicando a seção de categorias
              Text("Escolha por categoria"),
              // Widget que permite a rolagem horizontal de seu filho
              SingleChildScrollView(
                // Define a direção da rolagem como horizontal
                scrollDirection: Axis.horizontal,
                // Organiza seus filhos em uma linha horizontal
                child: Row(
                  // Define o espaçamento horizontal entre os filhos da linha
                  spacing: 8,
                  // Gera uma lista de widgets filhos com base na lista de categorias
                  children: List.generate(
                    // Obtém o número de categorias na lista
                    CategoriesData.listCategories.length,
                    // Builder que constrói cada widget de categoria
                    (index) {
                      // Retorna um widget CategoryWidget para cada categoria na lista
                      return CategoryWidget(
                        category: CategoriesData.listCategories[index],
                      );
                    },
                  ),
                ),
              ),
              // Widget para exibir uma imagem de um banner promocional
              Image.asset("assets/banners/banner_promo.png"),
              // Widget para exibir um texto indicando a seção de restaurantes bem avaliados
              Text("Bem avaliados"),
              // Coluna para exibir a lista de restaurantes bem avaliados
              Column(
                // Define o espaçamento vertical entre os filhos da coluna
                spacing: 16,
                // Gera uma lista de widgets filhos com base na lista de restaurantes carregada
                children: List.generate(
                  // Obtém o número de restaurantes na lista
                  restaurantData.listRestaurant.length,
                  // Builder que constrói cada widget de restaurante
                  (index) {
                    // Obtém o restaurante atual da lista
                    Restaurant restaurant =
                        restaurantData.listRestaurant[index];
                    // Retorna um widget RestaurantWidget para cada restaurante
                    return RestaurantWidget(restaurant: restaurant);
                  },
                ),
              ),
              // Widget que cria um espaço vertical vazio
              SizedBox(height: 64.0),
            ],
          ),
        ),
      ),
    );
  }
}
