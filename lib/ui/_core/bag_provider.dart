import 'package:flutter/material.dart';
// Modelo de dados para representar um prato
import 'package:techtaste/model/dish.dart';

// Classe que atua como um gerenciador de estado para o carrinho de compras, notificando os listeners sobre mudanças
class BagProvider extends ChangeNotifier {
  // Lista mutável que armazena os pratos adicionados ao carrinho
  List<Dish> dishesOnBag = [];

  // Método para adicionar uma lista de pratos ao carrinho e notificar os listeners
  addAllDishes(List<Dish> dishes) {
    // Adiciona todos os pratos da lista fornecida à lista de pratos no carrinho
    dishesOnBag.addAll(dishes);
    // Notifica todos os widgets que estão "ouvindo" este Provider para que possam se reconstruir com o novo estado
    notifyListeners();
  }

  // Método para remover um prato específico do carrinho e notificar os listeners
  removeDish(Dish dish) {
    // Remove a primeira ocorrência do prato fornecido da lista de pratos no carrinho
    dishesOnBag.remove(dish);
    // Notifica todos os widgets que estão "ouvindo" este Provider
    notifyListeners();
  }

  // Método para limpar todos os pratos do carrinho e notificar os listeners
  clearBag() {
    // Remove todos os elementos da lista de pratos no carrinho
    dishesOnBag.clear();
    // Notifica todos os widgets que estão "ouvindo" este Provider
    notifyListeners();
  }

  // Método para obter um mapa onde as chaves são os pratos no carrinho e os valores são a quantidade de cada prato
  Map<Dish, int> getMapByAmount() {
    // Cria um mapa vazio para armazenar os pratos e suas respectivas quantidades
    Map<Dish, int> mapResult = {};

    // Itera sobre cada prato na lista de pratos no carrinho
    for (Dish dish in dishesOnBag) {
      // Verifica se o prato já existe como chave no mapa de resultados
      if (mapResult[dish] == null) {
        // Se o prato não existe, adiciona-o ao mapa com uma quantidade de 1
        mapResult[dish] = 1;
      } else {
        // Se o prato já existe, incrementa sua quantidade no mapa
        mapResult[dish] = mapResult[dish]! + 1;
      }
    }
    // Retorna o mapa contendo os pratos e suas quantidades
    return mapResult;
  }
}
