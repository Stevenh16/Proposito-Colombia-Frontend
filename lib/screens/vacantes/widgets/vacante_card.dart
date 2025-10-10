import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VacanteCardView extends StatefulWidget {
  final String titulo;
  final String empresa;
  final String descripcion;
  final String imagenUrl;
  final String salarioMin;
  final String salarioMax;

  const VacanteCardView({
    super.key,
    required this.titulo,
    required this.empresa,
    required this.descripcion,
    required this.imagenUrl,
    required this.salarioMin,
    required this.salarioMax});
  @override
  State<VacanteCardView> createState() => _VacanteCardViewState();
}
class _VacanteCardViewState extends State<VacanteCardView> {
  final ScrollController _scrollController = ScrollController();
  bool _showButtons = true;
  bool _isFullscreen = false;
  void _toggleButtons() {
    setState(() {
      _showButtons = !_showButtons;
    });
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }
  void _toggleFullscreen() {
    setState(() {
      _isFullscreen = !_isFullscreen;
    });
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Imagen principal con íconos flotantes
                  Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 1080 / 1490,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          child: Image.asset(
                            widget.imagenUrl.isNotEmpty
                                ? widget.imagenUrl
                                : 'assets/images/default.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(Icons.broken_image, size: 48, color: Colors.grey),
                              );
                            },
                          ),
                        ),
                      ),
                      // Salario
                      Positioned(
                        left: 16,
                        bottom: 90,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _ChipSalario(widget.salarioMin),
                            SizedBox(width: 6),
                            _ChipSalario("-"),
                            SizedBox(width: 6),
                            _ChipSalario(widget.salarioMax),
                          ],
                        ),
                      ),
                      // Palabras clave
                      Positioned(
                        bottom: 16,
                        left: 8,
                        right: 8,
                        child: Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: const [
                            _ChipLabel("Figma"),
                            _ChipLabel("UX"),
                            _ChipLabel("UI"),
                            _ChipLabel("Diseño"),
                            _ChipLabel("Prototipado"),
                            _ChipLabel("Adobe XD"),
                            _ChipLabel("Sketch"),
                            _ChipLabel("Wireframes"),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Información general
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.titulo,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.empresa,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: const [
                            _Tag("Medio Tiempo"),
                            SizedBox(width: 6),
                            _Tag("Medellín", icon: Icons.location_on),
                            SizedBox(width: 6),
                            _Tag("Híbrido"),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "32 postulaciones",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Descripción del trabajo
                        _sectionCard(
                          title: "Descripción del trabajo",
                          content:
                          widget.descripcion,
                        ),
                        const SizedBox(height: 16),

                        // Requisitos
                        _sectionCard(
                          title: "Requisitos",
                          contentWidget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              _checkText("3+ años de experiencia en React y TypeScript"),
                              _checkText("Conocimiento en Tailwind CSS"),
                              _checkText("Experiencia con Git y metodologías ágiles"),
                              _checkText("Inglés intermedio-avanzado"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Detalles del trabajo
                        _sectionCard(
                          title: "Detalles del trabajo",
                          contentWidget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              _detailRow("Jornada:", "Lunes a Viernes"),
                              _detailRow("Contrato:", "Indefinido"),
                              _detailRow("Salario:", "Mensual"),
                              _detailRow("Publicado:", "Hace 2 días"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 16,
              top: 16,
              child: Column(
                children: [
                  _iconButtonSvgRounded(
                    assetName: _isFullscreen
                        ? 'assets/icons/jusscreen.svg'
                        : 'assets/icons/fullscreen.svg',
                    backgroundColor: Colors.white,
                    svgColor: Colors.blue,
                    onPressed: _toggleButtons,
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 25),
                    child: _showButtons
                        ? Column(
                      key: const ValueKey(true),
                      children: [
                        const SizedBox(height: 12),
                        _iconButtonSvgRounded(
                          assetName: 'assets/icons/heart.svg',
                          backgroundColor: Colors.red,
                          svgColor: Colors.white,
                        ),
                        const SizedBox(height: 12),
                        _iconButtonSvgRounded(
                          assetName: 'assets/icons/down.svg',
                          backgroundColor: Colors.white,
                          svgColor: Colors.blue,
                          onPressed: _scrollToBottom,
                        ),
                        const SizedBox(height: 12),
                        _iconButtonSvgRounded(
                          assetName: 'assets/icons/share.svg',
                          backgroundColor: Colors.white,
                          svgColor: Colors.blue,
                        ),
                      ],
                    )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ],
    );
  }
}

  Widget _iconButtonSvgRounded({
    required String assetName,
    double size = 24,
    Color? svgColor,        // color del ícono SVG
    Color? backgroundColor, // color del fondo
    VoidCallback? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed ?? () => print('Botón presionado, love! 😏'),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white, // usa blanco por defecto
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            assetName,
            width: size,
            height: size,
            color: svgColor ?? Colors.black, // negro por defecto
          ),
        ),
      ),
    );
  }
Widget _sectionCard({
  required String title,
  String? content,
  Widget? contentWidget,
  IconData? icon,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue.shade100),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            if (icon != null)
              Icon(
                icon,
                color: Colors.blue,
              ),
          ],
        ),
        const SizedBox(height: 8),
        if (content != null)
          Text(
            content,
            style: const TextStyle(fontSize: 14),
          ),
        if (contentWidget != null) contentWidget,
      ],
    ),
  );
}

class _checkText extends StatelessWidget {
  final String text;
  const _checkText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 18),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}

class _detailRow extends StatelessWidget {
  final String label;
  final String value;
  const _detailRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(label,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(flex: 2, child: Text(value)),
        ],
      ),
    );
  }
}

class _ChipLabel extends StatelessWidget {
  final String text;
  const _ChipLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.shade700,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w400),
      ),
    );
  }
}

class _ChipSalario extends StatelessWidget {
  final String text;
  const _ChipSalario(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.green, // fondo verde para salario
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white, // texto blanco
          fontFamily: 'Montserrat',
          fontSize: 19,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}


class _Tag extends StatelessWidget {
  final String text;
  final IconData? icon;
  const _Tag(this.text, {this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade200),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.blue, size: 14),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: const TextStyle(color: Colors.blue, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
