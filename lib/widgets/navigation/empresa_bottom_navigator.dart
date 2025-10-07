import 'package:flutter/material.dart';
import '../../screens/empresa/inicio_empresa_screen.dart';
import '../../screens/empresa/matches_empresa_screen.dart';
import '../../screens/empresa/explorar_empresa_screen.dart';
import '../../screens/empresa/perfil_empresa_screen.dart';
import '../../config/theme.dart';

class EmpresaBottomNavigator extends StatefulWidget {
  const EmpresaBottomNavigator({super.key});

  @override
  State<EmpresaBottomNavigator> createState() => _EmpresaBottomNavigatorState();
}

class _EmpresaBottomNavigatorState extends State<EmpresaBottomNavigator> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    InicioEmpresaScreen(),
    MatchesEmpresaScreen(),
    ExplorarEmpresaScreen(),
    PerfilEmpresaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavBarItemEmpresa(
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home,
                  label: 'Inicio',
                  isActive: _currentIndex == 0,
                  onTap: () => setState(() => _currentIndex = 0),
                ),
                _NavBarItemEmpresa(
                  icon: Icons.favorite_outline,
                  activeIcon: Icons.favorite,
                  label: 'Matches',
                  isActive: _currentIndex == 1,
                  onTap: () => setState(() => _currentIndex = 1),
                ),
                _NavBarItemEmpresa(
                  icon: Icons.search,
                  activeIcon: Icons.search,
                  label: 'Explorar',
                  isActive: _currentIndex == 2,
                  onTap: () => setState(() => _currentIndex = 2),
                ),
                _NavBarItemEmpresa(
                  icon: Icons.person_outline,
                  activeIcon: Icons.person,
                  label: 'Perfil',
                  isActive: _currentIndex == 3,
                  onTap: () => setState(() => _currentIndex = 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavBarItemEmpresa extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItemEmpresa({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppTheme.accentYellow : Colors.grey;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: color,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}