import 'dart:convert';
import 'package:flutter/material.dart';
// Permite o acesso a recursos do pacote, como arquivos de assets
import 'package:flutter/services.dart';
// Modelo de dados para representar um restaurante
import 'package:techtaste/model/restaurant.dart';

// Classe que gerencia os dados dos restaurantes e notifica seus listeners sobre mudanças
class RestaurantData extends ChangeNotifier {
  // Lista mutável que armazena objetos do tipo Restaurant
  List<Restaurant> listRestaurant = [];

  // Função assíncrona para buscar os dados dos restaurantes
  Future<void> getRestaurants() async {
    // Carrega o conteúdo do arquivo JSON localizado em 'assets/data.json' como uma string
    String jsonString = await rootBundle.loadString('assets/data.json');
    // Decodifica a string JSON em um mapa dinâmico
    Map<String, dynamic> data = json.decode(jsonString);
    // Extrai a lista de restaurantes do mapa decodificado
    List<dynamic> restaurantsData = data['restaurants'];

    // Itera sobre cada item na lista de dados de restaurantes
    for (var restaurantData in restaurantsData) {
      // Cria uma instância de Restaurant a partir do mapa de dados do restaurante atual
      Restaurant restaurant = Restaurant.fromMap(restaurantData);
      // Adiciona a instância de Restaurant à lista de restaurantes
      listRestaurant.add(restaurant);
    }
  }
}
