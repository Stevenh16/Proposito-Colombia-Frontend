import 'package:flutter/material.dart';
import '../headers/progress_header.dart';
import '../misc/footer.dart';
import '../misc/golondrina.dart';


class FormContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback onGoBack;
  final int progress;
  final String title;
  final bool showLogo;
  final bool showFooter;

  const FormContainer({
    super.key,
    required this.child,
    required this.onGoBack,
    required this.progress,
    required this.title,
    this.showLogo = true,
    this.showFooter = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            ProgressHeader(
              onGoBack: onGoBack,
              progress: progress,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    if (showLogo)
                      Golondrina(title: title),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: child,
                      ),
                    ),
                    if (showFooter)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Footer(),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}