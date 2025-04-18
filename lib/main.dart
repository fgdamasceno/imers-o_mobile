import 'package:flutter/material.dart';
// Gerenciador de estado Provider, para fornecer dados para os widgets filhos
import 'package:provider/provider.dart';
// Classe que lida com a busca e armazenamento de dados de restaurantes
import 'package:techtaste/data/restaurant_data.dart';
// Define o tema visual padrão do aplicativo
import 'package:techtaste/ui/_core/app_theme.dart';
// Gerenciador de estado Provider específico para a lógica do carrinho de compras
import 'package:techtaste/ui/_core/bag_provider.dart';
// Tela inicial do aplicativo, exibida durante o carregamento ou apresentação
import 'package:techtaste/ui/splash/splash_screen.dart';

void main() async {
  // Garante que os bindings do Flutter estejam inicializados, necessário antes de usar funcionalidades nativas
  WidgetsFlutterBinding.ensureInitialized();
  // Instancia a classe que busca os dados dos restaurantes
  RestaurantData restaurantData = RestaurantData();
  // Aguarda a conclusão da busca dos dados dos restaurantes
  await restaurantData.getRestaurants();
  // Widget que torna múltiplos Providers disponíveis para seus filhos
  runApp(
    MultiProvider(
      // Lista de Providers que serão disponibilizados
      providers: [
        // Provider que notifica seus listeners quando RestaurantData muda
        ChangeNotifierProvider(
          // Função que cria uma instância de RestaurantData para o Provider
          create: (context) {
            // Retorna a instância já carregada de RestaurantData
            return restaurantData;
          },
        ),
        // Provider que notifica seus listeners quando BagProvider muda
        ChangeNotifierProvider(create: (context) => BagProvider()),
      ],
      // Widget filho que terá acesso aos Providers definidos acima
      child: MyApp(),
    ),
  ); // Inicializa o aplicativo Flutter com o widget MyApp
}

// Widget principal do aplicativo, do tipo StatelessWidget pois sua aparência não depende de estado interno
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // Método que constrói a interface do widget
  Widget build(BuildContext context) {
    // Widget base para aplicativos que seguem as diretrizes visuais do Material Design
    return MaterialApp(
      // Desabilita a exibição da faixa de "DEBUG" no canto superior direito
      debugShowCheckedModeBanner: false,
      // Define o tema visual do aplicativo usando as configurações em AppTheme
      theme: AppTheme.appTheme,
      // Define a tela inicial que será exibida quando o aplicativo for iniciado
      home: SplashScreen(),
    );
  }
}
