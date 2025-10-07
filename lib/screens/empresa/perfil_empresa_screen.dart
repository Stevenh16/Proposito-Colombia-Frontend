import 'package:flutter/material.dart';
class PerfilEmpresaScreen extends StatelessWidget {
  const PerfilEmpresaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Empresa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Logo empresa
            CircleAvatar(
              radius: 50,
              backgroundColor: theme.colorScheme.primary,
              child: const Icon(Icons.business, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              'Mi Empresa SAS',
              style: theme.textTheme.titleLarge,
            ),
            Text(
              'Tecnología y Software',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),

            // Opciones
            _ProfileOption(
              icon: Icons.work,
              title: 'Mis Vacantes',
              subtitle: '5 activas',
              onTap: () {},
            ),
            _ProfileOption(
              icon: Icons.people,
              title: 'Candidatos',
              subtitle: '23 en proceso',
              onTap: () {},
            ),
            _ProfileOption(
              icon: Icons.star,
              title: 'Plan Actual',
              subtitle: 'Premium',
              onTap: () {},
            ),
            _ProfileOption(
              icon: Icons.help,
              title: 'Ayuda y Soporte',
              subtitle: 'Contáctanos',
              onTap: () {},
            ),
            _ProfileOption(
              icon: Icons.logout,
              title: 'Cerrar Sesión',
              subtitle: '',
              onTap: () {},
              isDestructive: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isDestructive;

  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isDestructive ? Colors.red : theme.colorScheme.primary,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isDestructive ? Colors.red : theme.textTheme.bodyLarge?.color,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
        trailing: Icon(
          Icons.chevron_right,
          color: theme.textTheme.bodyMedium?.color,
        ),
        onTap: onTap,
      ),
    );
  }
}