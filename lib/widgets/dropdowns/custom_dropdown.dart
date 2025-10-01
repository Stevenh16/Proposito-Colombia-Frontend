import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String placeholder;
  final String? value;
  final VoidCallback onPressed;

  const CustomDropdown({
    super.key,
    required this.placeholder,
    this.value,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: theme.colorScheme.primary,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                value ?? placeholder,
                style: TextStyle(
                  fontSize: 16,
                  color: value != null
                      ? theme.textTheme.bodyLarge?.color
                      : theme.textTheme.bodyMedium?.color,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: theme.colorScheme.primary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}