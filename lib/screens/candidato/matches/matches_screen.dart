import 'package:flutter/material.dart';
import '../../../config/theme.dart';
import '../../../widgets/headers/app_header.dart';

class MatchesCandidatoScreen extends StatefulWidget {
  const MatchesCandidatoScreen({super.key});

  @override
  State<MatchesCandidatoScreen> createState() => _MatchesCandidatoScreenState();
}

class _MatchesCandidatoScreenState extends State<MatchesCandidatoScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppHeader(
        title: 'Matches',
        hasNotifications: true,
        hasMessages: true,
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3, // Ejemplo
        itemBuilder: (context, index) {
          return _MatchCard(
            companyName: 'InnovaCorp',
            position: 'Desarrollador Frontend',
            imageUrl: 'https://picsum.photos/400/200?random=$index',
            matchDate: DateTime.now().subtract(Duration(days: index)),
            onChatTap: () {
              // Ir al chat
            },
            onViewDetails: () {
              _showMatchDetails(context);
            },
          );
        },
      ),
    );
  }

  void _showMatchDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => _MatchDetailsModal(),
    );
  }
}

class _MatchCard extends StatelessWidget {
  final String companyName;
  final String position;
  final String imageUrl;
  final DateTime matchDate;
  final VoidCallback onChatTap;
  final VoidCallback onViewDetails;

  const _MatchCard({
    required this.companyName,
    required this.position,
    required this.imageUrl,
    required this.matchDate,
    required this.onChatTap,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),

          // Info
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  companyName,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  position,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 12),

                // Estado del match
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Match confirmado',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '¡Les gustó tu perfil!',
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: onChatTap,
                        icon: const Icon(Icons.message, size: 16),
                        label: const Text('Chatear'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.accentYellow,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Botón ver detalles
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: onViewDetails,
                    child: const Text('Ver detalles del proceso'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MatchDetailsModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),

          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Detalles del Proceso',
                style: theme.textTheme.titleLarge,
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const Divider(),

          // Contenido
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Empresa
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'InnovaCorp',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Desarrollador Frontend',
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Estado
                  Text(
                    'Estado del Proceso',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _ProcessStep(
                    icon: Icons.check_circle,
                    title: 'Perfil revisado',
                    date: '15 de Enero, 2024',
                    isCompleted: true,
                  ),
                  _ProcessStep(
                    icon: Icons.check_circle,
                    title: 'Match confirmado',
                    date: '15 de Enero, 2024',
                    isCompleted: true,
                  ),
                  _ProcessStep(
                    icon: Icons.pending,
                    title: 'Chat habilitado',
                    subtitle: 'Pendiente de contacto',
                    isCompleted: false,
                    isPending: true,
                  ),
                  _ProcessStep(
                    icon: Icons.schedule,
                    title: 'Entrevista inicial',
                    subtitle: 'Por programar',
                    isCompleted: false,
                  ),

                  const SizedBox(height: 20),

                  // Observaciones
                  Text(
                    'Observaciones',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: theme.dividerColor),
                    ),
                    child: Text(
                      'La empresa está esperando que inicies el chat para coordinar los siguientes pasos del proceso.',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Botón chat
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.message),
                      label: const Text('Ir al Chat'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProcessStep extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? date;
  final String? subtitle;
  final bool isCompleted;
  final bool isPending;

  const _ProcessStep({
    required this.icon,
    required this.title,
    this.date,
    this.subtitle,
    this.isCompleted = false,
    this.isPending = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color backgroundColor = Colors.grey.withOpacity(0.1);
    Color iconColor = Colors.grey;

    if (isCompleted) {
      backgroundColor = Colors.green.withOpacity(0.1);
      iconColor = Colors.green;
    } else if (isPending) {
      backgroundColor = Colors.blue.withOpacity(0.1);
      iconColor = Colors.blue;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (date != null)
                  Text(
                    date!,
                    style: theme.textTheme.bodySmall,
                  ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: TextStyle(
                      color: isPending ? Colors.blue : theme.textTheme.bodySmall?.color,
                      fontSize: 13,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
