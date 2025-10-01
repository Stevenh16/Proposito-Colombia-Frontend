import 'package:flutter/material.dart';

import '../../config/theme.dart';

class FloatingActionMenu extends StatelessWidget {
  final bool isLiked;
  final bool showInfo;
  final VoidCallback onEyePress;
  final VoidCallback onLikePress;
  final VoidCallback onToggleInfo;
  final VoidCallback onSharePress;

  const FloatingActionMenu({
    super.key,
    required this.isLiked,
    required this.showInfo,
    required this.onEyePress,
    required this.onLikePress,
    required this.onToggleInfo,
    required this.onSharePress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Positioned(
      right: 20,
      top: 20,
      child: Column(
        children: [
          _buildButton(
            icon: Icons.remove_red_eye,
            backgroundColor: Colors.white,
            iconColor: theme.colorScheme.primary,
            onPressed: onEyePress,
            size: 56,
          ),
          const SizedBox(height: 16),
          _buildButton(
            icon: Icons.favorite,
            backgroundColor: AppTheme.accentCoral,
            iconColor: Colors.white,
            onPressed: onLikePress,
            size: 64,
          ),
          const SizedBox(height: 16),
          _buildButton(
            icon: showInfo ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            backgroundColor: Colors.white,
            iconColor: theme.colorScheme.primary,
            onPressed: onToggleInfo,
            size: 56,
          ),
          const SizedBox(height: 16),
          _buildButton(
            icon: Icons.share,
            backgroundColor: Colors.white,
            iconColor: theme.colorScheme.primary,
            onPressed: onSharePress,
            size: 56,
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
    required VoidCallback onPressed,
    required double size,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor),
        iconSize: size == 64 ? 28 : 22,
        onPressed: onPressed,
      ),
    );
  }
}