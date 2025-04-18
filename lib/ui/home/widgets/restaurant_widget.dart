import 'package:flutter/material.dart';
// Modelo de dados para representar um restaurante
import 'package:techtaste/model/restaurant.dart';
// Tela que exibe os detalhes de um restaurante específico
import 'package:techtaste/ui/restaurant/restaurant_screen.dart';

// Widget que exibe as informações resumidas de um restaurante
class RestaurantWidget extends StatelessWidget {
  // Objeto Restaurant que contém os dados a serem exibidos
  final Restaurant restaurant;
  // Construtor do RestaurantWidget que requer um objeto Restaurant
  const RestaurantWidget({super.key, required this.restaurant});

  @override
  // Método que constrói a interface do widget
  Widget build(BuildContext context) {
    // Widget que torna seu filho interativo a toques
    return InkWell(
      // Função chamada quando o widget é tocado
      onTap: () {
        // Navega para outra tela
        Navigator.push(
          context,
          // Define a transição de tela usando a rota do Material Design
          MaterialPageRoute(
            // Builder que constrói a tela de detalhes do restaurante
            builder: (context) {
              // Retorna a tela RestaurantScreen, passando o objeto restaurant atual
              return RestaurantScreen(restaurant: restaurant);
            },
          ),
        );
      },
      // Widget que organiza seus filhos em uma linha horizontal
      child: Row(
        // Espaçamento entre os filhos da linha
        spacing: 12.0,
        // Lista de widgets filhos da linha
        children: [
          // Widget para exibir uma imagem de um asset
          Image.asset('assets/${restaurant.imagePath}', width: 72.0),
          // Widget que organiza seus filhos em uma coluna vertical
          Column(
            // Alinha os filhos horizontalmente ao início (esquerda)
            crossAxisAlignment: CrossAxisAlignment.start,
            // Lista de widgets filhos da coluna
            children: [
              // Widget para exibir um texto
              Text(
                restaurant.name,
                // Define o estilo do texto, como peso e tamanho da fonte
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              // Widget que organiza seus filhos em uma linha horizontal
              Row(
                // Gera uma lista de widgets filhos com base no número de estrelas do restaurante
                children: List.generate(restaurant.stars.toInt(), (index) {
                  // Retorna um widget de imagem para cada estrela
                  return Image.asset('assets/others/star.png', width: 16);
                }),
              ),
              // Widget para exibir um texto com a distância do restaurante
              Text('${restaurant.distance}km'),
            ],
          ),
        ],
      ),
    );
  }
}
