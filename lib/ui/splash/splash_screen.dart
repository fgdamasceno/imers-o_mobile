import 'package:flutter/material.dart';
// Define as cores personalizadas usadas no aplicativo
import 'package:techtaste/ui/_core/app_colors.dart';
// Tela principal do aplicativo
import 'package:techtaste/ui/home/home_screen.dart';

// Tela inicial do aplicativo, exibida brevemente durante o carregamento
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  // Método que constrói a interface do widget
  Widget build(BuildContext context) {
    // Widget base para a estrutura da tela, com cor de fundo
    return Scaffold(
      // Define a cor de fundo da tela usando uma cor personalizada
      backgroundColor: AppColors.backgroundColor,
      // Widget que posiciona seus filhos uns sobre os outros
      body: Stack(
        // Lista de widgets filhos da Stack
        children: [
          // Widget para exibir uma imagem de um asset, servindo como fundo
          Image.asset('assets/banners/banner_splash.png'),
          // Widget que centraliza seu filho na tela
          Center(
            // Adiciona preenchimento simétrico horizontal ao seu filho
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              // Widget que organiza seus filhos em uma coluna vertical
              child: Column(
                // Alinha os filhos verticalmente ao centro
                mainAxisAlignment: MainAxisAlignment.center,
                // Define o espaçamento vertical entre os filhos da coluna
                spacing: 32,
                // Lista de widgets filhos da coluna
                children: [
                  // Widget para exibir uma imagem do logo do aplicativo
                  Image.asset('assets/logo.png', width: 192),
                  // Coluna para agrupar os dois Text widgets
                  Column(
                    // Lista de widgets filhos da coluna
                    children: [
                      // Widget para exibir um texto com a primeira parte da mensagem de boas-vindas
                      Text(
                        "Um parceiro inovador para sua",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      // Widget para exibir um texto com a segunda parte da mensagem de boas-vindas, com uma cor diferente
                      Text(
                        "melhor experiência culinária!",
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  // Widget que cria um espaço com largura infinita e contém um botão elevado
                  SizedBox(
                    width: double.infinity,
                    // Botão com estilo elevado
                    child: ElevatedButton(
                      // Função chamada quando o botão é pressionado
                      onPressed: () {
                        // Navigator - responsável por gerenciar a pilha de rotas do aplicativo e permitir a navegação entre telas.
                        // pushReplacement - remove a tela atual da pilha e adiciona uma nova tela em seu lugar. Isso impede que o usuário volte para a tela anterior usando o botão "voltar".
                        Navigator.pushReplacement(
                          context,
                          // MaterialPageRoute - uma rota que transiciona para a próxima tela usando uma animação específica da plataforma (Android/iOS).
                          MaterialPageRoute(
                            // builder - função que retorna o widget da tela para a qual se está navegando. O 'context' aqui é o contexto da nova rota.
                            builder: (context) {
                              // Retorna a tela principal do aplicativo
                              return HomeScreen();
                            },
                          ),
                        );
                      },
                      // Widget exibido dentro do botão
                      child: Text('Bora!'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
