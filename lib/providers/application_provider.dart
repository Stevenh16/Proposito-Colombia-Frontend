import 'package:flutter/material.dart';

class ApplicationProvider extends ChangeNotifier {
  List<dynamic> _applications = [];
  bool _isLoading = false;

  List<dynamic> get applications => _applications;
  bool get isLoading => _isLoading;

  Future<void> loadApplications() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Aquí llamarías a tu API
      await Future.delayed(const Duration(seconds: 1));

      // Datos de ejemplo
      _applications = [
        // Agregar datos de ejemplo o desde API
      ];
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
