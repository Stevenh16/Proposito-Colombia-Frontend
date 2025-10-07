import 'package:flutter/material.dart';
import '../../widgets/headers/app_header.dart';
import '../../config/theme.dart';

class MatchesEmpresaScreen extends StatelessWidget {
  const MatchesEmpresaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: 'Matches',
        hasNotifications: true,
        hasMessages: false,
        backgroundColor: AppTheme.accentYellow,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return _MatchCardEmpresa(
            candidateName: 'Adriana Herrera',
            candidateTitle: 'Desarrollador Full Stack',
            candidateImage: 'https://randomuser.me/api/portraits/women/${index + 1}.jpg',
            matchPercentage: 95 - (index * 5),
            onViewProfile: () {},
            onChat: () {},
          );
        },
      ),
    );
  }
}

class _MatchCardEmpresa extends StatelessWidget {
  final String candidateName;
  final String candidateTitle;
  final String candidateImage;
  final int matchPercentage;
  final VoidCallback onViewProfile;
  final VoidCallback onChat;

  const _MatchCardEmpresa({
    required this.candidateName,
    required this.candidateTitle,
    required this.candidateImage,
    required this.matchPercentage,
    required this.onViewProfile,
    required this.onChat,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        candidateImage,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        candidateName,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        candidateTitle,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.green),
                  ),
                  child: Text(
                    '$matchPercentage% Match',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onViewProfile,
                    icon: const Icon(Icons.visibility, size: 18),
                    label: const Text('Ver Perfil'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.accentYellow,
                      side: BorderSide(color: AppTheme.accentYellow),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onChat,
                    icon: const Icon(Icons.message, size: 18),
                    label: const Text('Chatear'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.accentYellow,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
