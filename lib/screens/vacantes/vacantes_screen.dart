import 'package:flutter/material.dart';
import 'package:swallow_app/screens/vacantes/widgets/vacante_card.dart';

class VacantesScreen extends StatefulWidget {
  const VacantesScreen({super.key});

  @override
  State<VacantesScreen> createState() => _VacantesScreenState();
}

class _VacantesScreenState extends State<VacantesScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _vacantes = [
    {"titulo": "Diseñador UI/UX",
      "empresa": "CreativeStudio",
      "descripcion": "Buscamos un desarrollador frontend con experiencia en React y TypeScript para unirse a nuestro equipo de desarrollo y construir productos innovadores.",
      "imagen": 'assets/images/oficina.jpg',
      "salarioMin": "\$3.500.000",
      "salarioMax": "\$4.500.000"},

    {"titulo": "Desarrollador Frontend",
      "empresa": "TechCorp Colombia",
      "descripcion": "Buscamos un desarrollador frontend con experiencia en React y TypeScript para unirse a nuestro equipo de desarrollo de productos innovadores.",
      "imagen": 'assets/images/desarrollador.jpg',
      "salarioMin": "\$4.500.000",
      "salarioMax": "\$6.000.000"},
    //{"titulo": "Analista de Datos", "empresa": "DataCorp"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vacantes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        itemCount: _vacantes.length,
        itemBuilder: (context, index) {
          return VacanteCardView(
            titulo: _vacantes[index]["titulo"]?.toString() ?? "Sin título",
            empresa: _vacantes[index]["empresa"]?.toString() ?? "Empresa desconocida",
            descripcion: _vacantes[index]["descripcion"]?.toString() ?? "Sin descripción",
            imagenUrl: _vacantes[index]["imagen"]?.toString() ?? "assets/images/default.jpg",
            salarioMin: _vacantes[index]["salarioMin"]?.toString() ?? "Indefinido",
            salarioMax: _vacantes[index]["salarioMax"]?.toString() ?? "Indefinido",
          );
        },
      ),
    );
  }
}