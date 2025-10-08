import 'package:flutter/material.dart';
import '../screens/vacantes/widgets/vacante_card.dart';
import 'route_names.dart';
import '../screens/loading/loading_screen.dart';
import '../screens/postulaciones/postulaciones_screen.dart';
import '../screens/matches/matches_screen.dart';
import '../screens/explorar/explorar_screen.dart';
import '../widgets/navigation/bottom_tab_navigator.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.loading:
        return MaterialPageRoute(builder: (_) => const LoadingScreen());

      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const BottomTabNavigator());

      case RouteNames.vacantes:
        return MaterialPageRoute(builder: (_) => const VacanteCardView());

      case RouteNames.postulaciones:
        return MaterialPageRoute(builder: (_) => const PostulacionesScreen());

      case RouteNames.matches:
        return MaterialPageRoute(builder: (_) => const MatchesScreen());

      case RouteNames.explorar:
        return MaterialPageRoute(builder: (_) => const ExplorarScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No se encontró la ruta ${settings.name}'),
            ),
          ),
        );
    }
  }
}