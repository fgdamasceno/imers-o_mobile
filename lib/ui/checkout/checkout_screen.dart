import 'package:flutter/material.dart';
// Gerenciador de estado Provider, para acessar os dados do carrinho
import 'package:provider/provider.dart';
// Modelo de dados para representar um prato
import 'package:techtaste/model/dish.dart';
// Provider específico para a lógica do carrinho de compras
import 'package:techtaste/ui/_core/bag_provider.dart';

// Tela que exibe os itens no carrinho de compras
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  // Método que constrói a interface do widget
  Widget build(BuildContext context) {
    // Obtém uma instância do BagProvider para acessar os dados do carrinho
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    // Widget base para a estrutura da tela, com AppBar e corpo
    return Scaffold(
      // Barra superior da tela
      appBar: AppBar(
        // Título da AppBar
        title: Text("Sacola"),
        // Lista de widgets exibidos na parte direita da AppBar
        actions: [
          // Botão de texto
          TextButton(
            // Função chamada quando o botão é pressionado
            onPressed: () {
              // Limpa todos os itens do carrinho chamando o método clearBag do BagProvider
              bagProvider.clearBag();
            },
            // Texto exibido no botão
            child: Text("Limpar"),
          ),
        ],
      ),
      // Corpo principal da tela
      body: Padding(
        // Adiciona preenchimento horizontal ao conteúdo do corpo
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        // Widget que permite a rolagem vertical de seu conteúdo
        child: SingleChildScrollView(
          // Organiza seus filhos em uma coluna vertical
          child: Column(
            // Alinha os filhos horizontalmente ao início (esquerda)
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // Lista de widgets filhos da coluna
            children: [
              // Texto exibindo o título da seção de pedidos
              Text("Pedidos", textAlign: TextAlign.center),
              // Coluna para exibir a lista de itens no carrinho
              Column(
                // Gera uma lista de widgets filhos com base nos itens únicos no carrinho
                children: List.generate(
                  // Obtém o número de pratos únicos no carrinho através do mapa de quantidade
                  bagProvider.getMapByAmount().keys.length,
                  // Builder que constrói cada item da lista
                  (index) {
                    // Obtém o prato atual da lista de chaves do mapa de quantidade
                    Dish dish =
                        bagProvider.getMapByAmount().keys.toList()[index];
                    // Widget de lista padrão com uma linha de altura fixa
                    return ListTile(
                      // Função chamada quando o item da lista é tocado
                      onTap: () {},
                      // Widget exibido no início da linha
                      leading: Image.asset(
                        'assets/dishes/default.png',
                        width: 48,
                      ),
                      // Widget principal exibido na linha
                      title: Text(dish.name),
                      // Widget secundário exibido abaixo do título
                      subtitle: Text("R\$ ${dish.price.toStringAsFixed(2)}"),
                      // Widget exibido no final da linha
                      trailing: Row(
                        // Alinha os filhos horizontalmente com o mínimo de espaço necessário
                        mainAxisSize: MainAxisSize.min,
                        // Lista de widgets filhos da linha trailing
                        children: [
                          // Botão de ícone para remover um item do carrinho
                          IconButton(
                            // Função chamada quando o botão é pressionado
                            onPressed: () {
                              // Remove um prato do carrinho chamando o método removeDish do BagProvider
                              bagProvider.removeDish(dish);
                            },
                            // Ícone exibido no botão
                            icon: Icon(Icons.remove),
                          ),
                          // Texto exibindo a quantidade do prato no carrinho
                          Text(
                            bagProvider.getMapByAmount()[dish].toString(),
                            style: TextStyle(fontSize: 18.0),
                          ),
                          // Botão de ícone para adicionar um item ao carrinho
                          IconButton(
                            // Função chamada quando o botão é pressionado
                            onPressed: () {
                              // Adiciona um prato ao carrinho chamando o método addAllDishes do BagProvider
                              bagProvider.addAllDishes([dish]);
                            },
                            // Ícone exibido no botão
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
