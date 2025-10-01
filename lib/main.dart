import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swallow_app/routes/route_names.dart';
import 'providers/theme_provider.dart';
import 'routes/app_router.dart';

void main() {
  runApp(const SwallowApp());
}

class SwallowApp extends StatelessWidget {
  const SwallowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'Swallow App',
            theme: themeProvider.lightTheme,
            darkTheme: themeProvider.darkTheme,
            themeMode: themeProvider.themeMode,
            initialRoute: RouteNames.loading,
            onGenerateRoute: AppRouter.generateRoute,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}