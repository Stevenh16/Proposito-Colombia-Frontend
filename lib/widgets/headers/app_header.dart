import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasNotifications;
  final bool hasMessages;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onMessageTap;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const AppHeader({
    super.key,
    required this.title,
    this.hasNotifications = false,
    this.hasMessages = false,
    this.onNotificationTap,
    this.onMessageTap,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = backgroundColor ?? theme.scaffoldBackgroundColor;
    final fgColor = foregroundColor ?? theme.textTheme.bodyLarge?.color ?? Colors.black;

    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: fgColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: 'Montserrat',
        ),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.notifications_outlined, color: fgColor),
              onPressed: onNotificationTap ?? () {},
            ),
            if (hasNotifications)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: bgColor, width: 2),
                  ),
                ),
              ),
          ],
        ),
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.message_outlined, color: fgColor),
              onPressed: onMessageTap ?? () {},
            ),
            if (hasMessages)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: bgColor, width: 2),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
