import 'package:flutter/material.dart';
// Gerenciador de estado Provider, para acessar dados compartilhados
import 'package:provider/provider.dart';
// Modelo de dados para representar um prato
import 'package:techtaste/model/dish.dart';
// Modelo de dados para representar um restaurante
import 'package:techtaste/model/restaurant.dart';
// Provider específico para a lógica do carrinho de compras
import 'package:techtaste/ui/_core/bag_provider.dart';
// Widget AppBar personalizado
import 'package:techtaste/ui/_core/widgets/appbar.dart';

// Tela que exibe os detalhes de um restaurante específico, incluindo seus pratos
class RestaurantScreen extends StatelessWidget {
  // Objeto Restaurant que contém os dados do restaurante a ser exibido
  final Restaurant restaurant;
  // Construtor do RestaurantScreen que requer um objeto Restaurant
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  // Método que constrói a interface do widget
  Widget build(BuildContext context) {
    // Widget base para a estrutura da tela, com AppBar e corpo
    return Scaffold(
      // Barra superior da tela, utilizando o AppBar personalizado e exibindo o nome do restaurante como título
      appBar: getAppBar(context: context, title: restaurant.name),
      // Corpo principal da tela, centralizando seu conteúdo
      body: Center(
        // Organiza seus filhos em uma coluna vertical
        child: Column(
          // Define o espaçamento vertical entre os filhos da coluna
          spacing: 12.0,
          // Alinha os filhos horizontalmente ao centro
          crossAxisAlignment: CrossAxisAlignment.center,
          // Lista de widgets filhos da coluna
          children: [
            // Widget para exibir uma imagem do asset do restaurante
            Image.asset('assets/${restaurant.imagePath}', width: 128),
            // Widget para exibir um texto indicando a seção de pratos mais pedidos
            Text(
              "Mais pedidos",
              // Define o estilo do texto, como tamanho e peso da fonte
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            // Coluna para exibir a lista de pratos do restaurante
            Column(
              // Gera uma lista de widgets filhos com base na lista de pratos do restaurante
              children: List.generate(restaurant.dishes.length, (index) {
                // Obtém o prato atual da lista de pratos do restaurante
                Dish dish = restaurant.dishes[index];
                // Widget de lista padrão com uma linha de altura fixa
                return ListTile(
                  // Função chamada quando o item da lista é tocado
                  onTap: () {},
                  // Widget exibido no início da linha, mostrando uma imagem padrão para o prato
                  leading: Image.asset('assets/dishes/default.png', width: 48),
                  // Widget principal exibido na linha, mostrando o nome do prato
                  title: Text(dish.name),
                  // Widget secundário exibido abaixo do título, mostrando o preço do prato formatado
                  subtitle: Text("R\$ ${dish.price.toStringAsFixed(2)}"),
                  // Widget exibido no final da linha, um botão para adicionar o prato ao carrinho
                  trailing: IconButton(
                    // Função chamada quando o botão é pressionado
                    onPressed: () {
                      // Acessa o BagProvider usando o context.read e adiciona o prato ao carrinho
                      context.read<BagProvider>().addAllDishes([dish]);
                    },
                    // Ícone exibido no botão
                    icon: Icon(Icons.add),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
