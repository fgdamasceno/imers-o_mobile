import 'package:flutter/material.dart';
// Gerenciador de estado Provider, para acessar dados compartilhados
import 'package:provider/provider.dart';
// Provider específico para a lógica do carrinho de compras
import 'package:techtaste/ui/_core/bag_provider.dart';
// Widget de badge para exibir notificações ou contadores
import 'package:badges/badges.dart' as badges;
// Tela de checkout para finalizar a compra
import 'package:techtaste/ui/checkout/checkout_screen.dart';

// Função que retorna um widget AppBar personalizado
AppBar getAppBar({required BuildContext context, String? title}) {
  // Obtém uma instância do BagProvider usando o Provider.of para acessar o estado do carrinho
  BagProvider bagProvider = Provider.of<BagProvider>(context);
  // Widget AppBar, barra superior comum em aplicativos Material Design
  return AppBar(
    // Widget que exibe o título da AppBar, se fornecido
    title: title != null ? Text(title) : null,
    // Centraliza o título na AppBar
    centerTitle: true,
    // Lista de widgets exibidos na parte direita da AppBar
    actions: [
      // Widget de badge para exibir um indicador visual
      badges.Badge(
        // Controla se o badge deve ser exibido com base no estado do carrinho
        showBadge: bagProvider.dishesOnBag.isNotEmpty,
        // Define a posição do badge em relação ao seu filho
        position: badges.BadgePosition.bottomStart(start: 0, bottom: 0),
        // Widget exibido dentro do badge, mostrando a quantidade de itens no carrinho
        badgeContent: Text(
          bagProvider.dishesOnBag.length.toString(),
          style: TextStyle(fontSize: 10),
        ),
        // Widget ao qual o badge está anexado, neste caso, um IconButton
        child: IconButton(
          // Função chamada quando o botão é pressionado
          onPressed: () {
            // Navega para outra tela
            Navigator.push(
              context,
              // Define a transição de tela usando a rota do Material Design
              MaterialPageRoute(
                // Builder que constrói a tela de checkout
                builder: (context) {
                  // Retorna a tela de Checkout
                  return CheckoutScreen();
                },
              ),
            );
          },
          // Ícone exibido no botão
          icon: Icon(Icons.shopping_basket),
        ),
      ),
    ],
  );
}
