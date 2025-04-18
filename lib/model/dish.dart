// Classe que representa um prato do restaurante
class Dish {
  // Identificador único do prato
  final String id;
  // Nome do prato
  final String name;
  // Descrição detalhada do prato
  final String description;
  // Preço do prato (em centavos ou outra unidade monetária)
  final int price;
  // Caminho para a imagem do prato
  final String imagePath;

  // Construtor da classe Dish que exige que todos os campos sejam fornecidos
  Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  // Método que converte o objeto Dish em um mapa (chave-valor)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imagePath': imagePath,
    };
  }

  // Factory constructor que cria uma instância de Dish a partir de um mapa
  factory Dish.fromMap(Map<String, dynamic> map) {
    return Dish(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      imagePath: map['imagePath'],
    );
  }

  // Sobrescrita do método toString para fornecer uma representação em string do objeto Dish
  @override
  String toString() {
    return 'Dish(id: $id, name: $name, description: $description, price: $price, imagePath: $imagePath)';
  }
}
