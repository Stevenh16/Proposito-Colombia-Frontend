import 'package:flutter/material.dart';

import '../../../widgets/cards/vacancy_card.dart';

class VacantesScreen extends StatelessWidget {
  const VacantesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vacantes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return VacancyCard(
            imagen: 'https://via.placeholder.com/100x120',
            titulo: 'Desarrollador Flutter Senior',
            empresa: 'Tech Company',
            ubicacion: 'Santa Marta, Colombia',
            skills: const ['Flutter', 'Dart', 'Firebase'],
            salario: '\$3.000.000 - \$5.000.000',
            onPress: () {
              // Navegar a detalle
            },
          );
        },
      ),
    );
  }
}