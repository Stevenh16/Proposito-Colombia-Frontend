import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/vacancy_provider.dart';
import '../../../widgets/cards/vacancy_card.dart';
import '../../../widgets/headers/app_header.dart';


class ExplorarCandidatoScreen extends StatefulWidget {
  const ExplorarCandidatoScreen({super.key});

  @override
  State<ExplorarCandidatoScreen> createState() => _ExplorarCandidatoScreenState();
}

class _ExplorarCandidatoScreenState extends State<ExplorarCandidatoScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<VacancyProvider>(context, listen: false).loadVacancies()
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppHeader(
        title: 'Explorar',
        hasNotifications: false,
        hasMessages: true,
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Barra de búsqueda elegante
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  if (value.length > 2 || value.isEmpty) {
                    Provider.of<VacancyProvider>(context, listen: false)
                        .searchVacancies(value);
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Buscar empleos...',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: theme.colorScheme.primary,
                    size: 24,
                  ),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                    icon: Icon(Icons.clear, color: Colors.grey[400]),
                    onPressed: () {
                      _searchController.clear();
                      Provider.of<VacancyProvider>(context, listen: false)
                          .clearSearch();
                    },
                  )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ),

          // Lista de vacantes
          Expanded(
            child: Consumer<VacancyProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading && provider.vacancies.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.vacancies.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No se encontraron vacantes',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => provider.loadVacancies(refresh: true),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: provider.vacancies.length,
                    itemBuilder: (context, index) {
                      final vacancy = provider.vacancies[index];
                      return VacancyCard(
                        imagen: 'https://picsum.photos/200/300?random=$index',
                        titulo: vacancy.tituloVacante,
                        empresa: 'Empresa ${index + 1}',
                        ubicacion: 'Colombia',
                        skills: const ['Flutter', 'Dart'],
                        salario: '\$3.000.000 - \$5.000.000',
                        onPress: () {
                          // Navegar a detalle
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
