import 'package:flutter/material.dart';
import '../models/vacancy.dart';
import '../core/services/api_service.dart';

enum VacancyStatus { initial, loading, loaded, error }

class VacancyProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  VacancyStatus _status = VacancyStatus.initial;
  List<Vacancy> _vacancies = [];
  Vacancy? _selectedVacancy;
  String? _errorMessage;
  int _currentPage = 1;
  bool _hasMore = true;
  String? _searchQuery;

  VacancyStatus get status => _status;
  List<Vacancy> get vacancies => _vacancies;
  Vacancy? get selectedVacancy => _selectedVacancy;
  String? get errorMessage => _errorMessage;
  bool get hasMore => _hasMore;
  bool get isLoading => _status == VacancyStatus.loading;

  Future<void> loadVacancies({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _vacancies.clear();
      _hasMore = true;
    }

    if (!_hasMore || _status == VacancyStatus.loading) return;

    _status = VacancyStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final newVacancies = await _apiService.getVacancies(
        page: _currentPage,
        search: _searchQuery,
      );

      if (newVacancies.isEmpty) {
        _hasMore = false;
      } else {
        _vacancies.addAll(newVacancies);
        _currentPage++;
      }

      _status = VacancyStatus.loaded;
    } catch (e) {
      _status = VacancyStatus.error;
      _errorMessage = e.toString();
    }

    notifyListeners();
  }

  Future<void> searchVacancies(String query) async {
    _searchQuery = query;
    await loadVacancies(refresh: true);
  }

  Future<void> clearSearch() async {
    _searchQuery = null;
    await loadVacancies(refresh: true);
  }

  Future<void> selectVacancy(String vacancyId) async {
    _status = VacancyStatus.loading;
    notifyListeners();

    try {
      _selectedVacancy = await _apiService.getVacancyById(vacancyId);
      _status = VacancyStatus.loaded;
    } catch (e) {
      _status = VacancyStatus.error;
      _errorMessage = e.toString();
    }

    notifyListeners();
  }

  void clearSelectedVacancy() {
    _selectedVacancy = null;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}