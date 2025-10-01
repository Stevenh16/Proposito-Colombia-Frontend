import 'package:flutter/material.dart';

class ProgressHeader extends StatelessWidget {
  final VoidCallback onGoBack;
  final int progress;
  final String progressText;

  const ProgressHeader({
    super.key,
    required this.onGoBack,
    required this.progress,
    this.progressText = 'Progreso del perfil',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onGoBack,
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
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LinearProgressIndicator(
            value: progress / 100,
            backgroundColor: theme.dividerColor,
            valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
            minHeight: 4,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}