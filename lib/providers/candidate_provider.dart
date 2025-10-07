import 'package:flutter/material.dart';
import '../models/candidate.dart';

enum CandidateStatus { initial, loading, loaded, error }

class CandidateProvider extends ChangeNotifier {
  CandidateStatus _status = CandidateStatus.initial;
  List<Candidate> _candidates = [];
  List<Candidate> _likedCandidates = [];
  Candidate? _selectedCandidate;
  String? _errorMessage;
  String? _searchQuery;

  CandidateStatus get status => _status;
  List<Candidate> get candidates => _candidates;
  List<Candidate> get likedCandidates => _likedCandidates;
  Candidate? get selectedCandidate => _selectedCandidate;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _status == CandidateStatus.loading;

  // Cargar candidatos
  Future<void> loadCandidates({bool refresh = false}) async {
    if (refresh) {
      _candidates.clear();
    }

    _status = CandidateStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simulación de carga - reemplazar con llamada a API
      await Future.delayed(const Duration(seconds: 1));

      // Datos de ejemplo
      _candidates = [
        Candidate(
          id: '1',
          nombre: 'Adriana Lucia',
          apellido: 'Herrera Bermudez',
          fotoPerfil: 'https://randomuser.me/api/portraits/women/1.jpg',
          titulo: 'Ingeniera de sistemas',
          habilidades: ['JavaScript', 'CSS', 'Python', 'HTML', 'C++'],
          experiencia: 'Desarrollo de software\nTrabajo en equipo',
          ubicacion: 'Bogotá, Colombia',
          matchPercentage: 85,
        ),
        Candidate(
          id: '2',
          nombre: 'Adriana Lucia',
          apellido: 'Marquez Ramo',
          fotoPerfil: 'https://randomuser.me/api/portraits/women/2.jpg',
          titulo: 'Data Scientist',
          habilidades: ['Liderazgo', 'Innovación', 'Contratista', 'Servicio'],
          experiencia: 'Investigación\nTrabajo en equipo',
          ubicacion: 'Medellín, Colombia',
          matchPercentage: 92,
        ),
      ];

      _status = CandidateStatus.loaded;
    } catch (e) {
      _status = CandidateStatus.error;
      _errorMessage = e.toString();
    }

    notifyListeners();
  }

  // Buscar candidatos
  Future<void> searchCandidates(String query) async {
    _searchQuery = query;
    await loadCandidates(refresh: true);
  }

  // Dar like a candidato
  void toggleLike(String candidateId) {
    final index = _candidates.indexWhere((c) => c.id == candidateId);
    if (index != -1) {
      final candidate = _candidates[index];
      final updatedCandidate = candidate.copyWith(isLiked: !candidate.isLiked);
      _candidates[index] = updatedCandidate;

      if (updatedCandidate.isLiked) {
        _likedCandidates.add(updatedCandidate);
      } else {
        _likedCandidates.removeWhere((c) => c.id == candidateId);
      }

      notifyListeners();
    }
  }

  // Seleccionar candidato
  void selectCandidate(String candidateId) {
    _selectedCandidate = _candidates.firstWhere((c) => c.id == candidateId);
    notifyListeners();
  }

  // Limpiar selección
  void clearSelectedCandidate() {
    _selectedCandidate = null;
    notifyListeners();
  }

  // Limpiar error
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}