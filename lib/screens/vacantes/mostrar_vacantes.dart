import 'package:flutter/material.dart';
class MostrarVacantes extends StatefulWidget {
  const MostrarVacantes({super.key});

  @override
  State<MostrarVacantes> createState() => _MostrarVacantesState();
}

class _MostrarVacantesState extends State<MostrarVacantes> {
  bool isExpanded = false; // controla expandir descripción, requisitos, etc
  bool showActions = true; // controla mostrar u ocultar los botoncitos
  bool isFavorite = false; // controla el corazon

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vacantes"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagen con botones flotantes
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.network(
                  "https://picsum.photos/400/200", // cambia por tu imagen
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
                if (showActions)
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Column(
                      children: [
                        FloatingActionButton.small(
                          heroTag: "expand",
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: const Icon(Icons.expand_more),
                        ),
                        const SizedBox(height: 10),
                        FloatingActionButton.small(
                          heroTag: "fav",
                          backgroundColor:
                              isFavorite ? Colors.red : Colors.grey[300],
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: const Icon(Icons.favorite,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        FloatingActionButton.small(
                          heroTag: "share",
                          onPressed: () {},
                          child: const Icon(Icons.share),
                        ),
                      ],
                    ),
                  ),
                // Botón para mostrar/ocultar los otros
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: FloatingActionButton.small(
                    heroTag: "toggle",
                    onPressed: () {
                      setState(() {
                        showActions = !showActions;
                      });
                    },
                    child: const Icon(Icons.keyboard_arrow_up),
                  ),
                ),
              ],
            ),

            // Info principal
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Diseñador UX/UI",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text("CreativeStudio"),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Chip(label: Text("Medio Tiempo")),
                      SizedBox(width: 8),
                      Chip(label: Text("Medellín")),
                      SizedBox(width: 8),
                      Chip(label: Text("Híbrido")),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text("32 postulaciones",
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            // Contenido expandible
            if (isExpanded) ...[
              ExpansionTile(
                title: const Text("Descripción del trabajo"),
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Estamos buscando un diseñador UX/UI creativo y analítico "
                      "para crear experiencias de usuario excepcionales en nuestros proyectos.",
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text("Requisitos"),
                children: const [
                  ListTile(title: Text("2+ años de experiencia en diseño UX/UI")),
                  ListTile(title: Text("Dominio de Figma y Adobe Creative Suite")),
                  ListTile(title: Text("Conocimiento en Design Systems")),
                  ListTile(title: Text("Portfolio sólido con casos de estudio")),
                ],
              ),
              ExpansionTile(
                title: const Text("Detalles del trabajo"),
                children: const [
                  ListTile(title: Text("Jornada: Lunes a Viernes")),
                  ListTile(title: Text("Contrato: Término Fijo")),
                  ListTile(title: Text("Salario: Mensual")),
                  ListTile(title: Text("Publicado: Hace 1 semana")),
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
}