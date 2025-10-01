import 'package:flutter/material.dart';

class Golondrina extends StatelessWidget {
  final String? title;

  const Golondrina({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF1E90FF), Color(0xFF4B0082)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Image.asset(
            'assets/images/logo_nombre.png',
            width: 220,
            height: 220,
            fit: BoxFit.contain,
            color: Colors.white,
          ),
        ),
        if (title != null) ...[
          const SizedBox(height: 10),
          Text(
            title!,
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontFamily: 'Montserrat',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
