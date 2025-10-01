import 'package:flutter/material.dart';

class ExplorarScreen extends StatelessWidget {
  const ExplorarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Ejemplo de progreso
    final int progress = 70;
    final String progressText = "Progreso";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorar'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Botón atrás
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                children: [
                  Icon(Icons.arrow_back, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    'Atrás',
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.colorScheme.primary,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Barra de progreso
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  progressText,
                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12),
                ),
                Text(
                  '$progress%',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.primary,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress / 100,
              backgroundColor: theme.dividerColor,
              valueColor: AlwaysStoppedAnimation<Color>(
                theme.colorScheme.primary,
              ),
              minHeight: 4,
            ),
            const SizedBox(height: 20),

            // Contenido principal
            const Center(
              child: Text('Pantalla de Explorar'),
            ),
          ],
        ),
      ),
    );
  }
}
