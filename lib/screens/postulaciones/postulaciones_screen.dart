import 'package:flutter/material.dart';

class PostulacionesScreen extends StatelessWidget {
  const PostulacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Postulaciones'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Pantalla de Postulaciones'),
      ),
    );
  }
}