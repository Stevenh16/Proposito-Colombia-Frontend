import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      'Powered by @CIEUniMagdalena2025',
      style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),
    );
  }
}