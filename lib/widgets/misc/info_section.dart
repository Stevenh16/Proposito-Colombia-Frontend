import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  Future<void> _launchURL(BuildContext context) async {
    final url = Uri.parse('https://www.jcdnconsulting.com/propositos-colombia');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No se pudo abrir el enlace")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(top: 40),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Haz clic ',
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),
              ),
              InkWell(
                onTap: () => _launchURL(context),
                child: const Text(
                  'aquí',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Text(
                ' para saber más de',
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),
              ),
            ],
          ),
          Text(
            'Propósitos Colombia',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold, // 👉 más destacado
            ),
          ),
        ],
      ),
    );
  }
}
