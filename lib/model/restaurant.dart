// Importa a classe Dish, que representa um prato individual
import 'package:techtaste/model/dish.dart';

// Classe que representa um restaurante
class Restaurant {
  // Identificador único do restaurante
  String id;
  // Caminho para a imagem do restaurante
  String imagePath;
  // Nome do restaurante
  String name;
  // Descrição do restaurante
  String description;
  // Avaliação do restaurante em estrelas
  double stars;
  // Distância do usuário até o restaurante
  int distance;
  // Lista de categorias às quais o restaurante pertence
  List<String> categories;
  // Lista de pratos oferecidos pelo restaurante
  List<Dish> dishes;

  // Construtor da classe Restaurant que exige que todos os campos sejam fornecidos
  Restaurant({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.stars,
    required this.distance,
    required this.categories,
    required this.dishes,
  });

  // Método que converte o objeto Restaurant em um mapa (chave-valor)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagePath': imagePath,
      'name': name,
      'description': description,
      'stars': stars,
      'distance': distance,
      'categories': categories,
      // Mapeia cada objeto Dish na lista 'dishes' para um mapa usando o método toMap() de Dish e converte o resultado em uma lista
      'dishes': dishes.map((dish) => dish.toMap()).toList(),
    };
  }

  // Factory constructor que cria uma instância de Restaurant a partir de um mapa
  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'],
      imagePath: map['imagePath'],
      name: map['name'],
      description: map['description'],
      stars: map['stars']?.toDouble() ?? 0.0,
      distance: map['distance']?.toInt() ?? 0,
      // Converte a lista dinâmica de categorias em uma lista de Strings
      categories: List<String>.from(map['categories']),
      // Mapeia cada mapa na lista 'dishes' para um objeto Dish usando o método fromMap() de Dish e converte o resultado em uma lista de Dishes
      dishes: List<Dish>.from(map['dishes'].map((dish) => Dish.fromMap(dish))),
    );
  }

  // Sobrescrita do método toString para fornecer uma representação em string do objeto Restaurant
  @override
  String toString() {
    return 'Restaurant(id: $id, imagePath: $imagePath, name: $name, description: $description, stars: $stars, distance: $distance, categories: $categories)';
  }
}
