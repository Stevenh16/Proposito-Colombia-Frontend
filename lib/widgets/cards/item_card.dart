import 'package:flutter/material.dart';
import '../../config/theme.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? description;
  final VoidCallback onRemove;

  const ItemCard({
    super.key,
    required this.title,
    this.subtitle,
    this.description,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.dividerColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12),
                  ),
                ],
                if (description != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    description!,
                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12),
                  ),
                ],
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: AppTheme.accentCoral,
              size: 20,
            ),
            onPressed: onRemove,
            padding: const EdgeInsets.all(4),
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}