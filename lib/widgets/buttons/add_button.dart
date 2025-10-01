import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double iconSize;

  const AddButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.iconSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add, size: iconSize, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),
    );
  }
}
