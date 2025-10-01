import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Widget child;
  final bool required;

  const FormFieldWidget({
    super.key,
    required this.label,
    this.icon,
    required this.child,
    this.required = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 20,
                  color: theme.textTheme.bodyMedium?.color,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                required ? '$label *' : label,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}