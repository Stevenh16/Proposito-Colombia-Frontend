import 'package:flutter/material.dart';
import 'dart:async';
import '../../routes/route_names.dart';

class CustomProgressBar extends StatefulWidget {
  final double? value;

  const CustomProgressBar({
    super.key,
    this.value,
  });

  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasRedirected = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: widget.value ?? 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward().then((_) {
      if (!_hasRedirected && mounted) {
        _hasRedirected = true;
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            Navigator.of(context).pushReplacementNamed(RouteNames.home);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250,
          height: 12,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(6),
          ),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: _animation.value,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    theme.colorScheme.primary,
                  ),
                  minHeight: 12,
                ),
              );
            },
          ),
        ),
        if (widget.value != null) ...[
          const SizedBox(width: 10),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Text(
                '${(_animation.value * 100).round()}%',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ),
              );
            },
          ),
        ],
      ],
    );
  }
}