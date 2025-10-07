import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/auth_service.dart';
import '../services/storage_service.dart';

enum AuthStatus { initial, authenticated, unauthenticated, loading }
enum UserType { candidate, company }

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final StorageService _storageService = StorageService();

  AuthStatus _status = AuthStatus.initial;
  User? _currentUser;
  UserType? _userType;
  String? _token;
  String? _errorMessage;

  AuthStatus get status => _status;
  User? get currentUser => _currentUser;
  UserType? get userType => _userType;
  String? get token => _token;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _status == AuthStatus.authenticated;
  bool get isCandidate => _userType == UserType.candidate;
  bool get isCompany => _userType == UserType.company;

  Future<void> initialize() async {
    _status = AuthStatus.loading;
    notifyListeners();

    try {
      _token = await _storageService.getToken();
      final userTypeStr = await _storageService.getUserType();

      if (_token != null && userTypeStr != null) {
        _userType = userTypeStr == 'candidate'
            ? UserType.candidate
            : UserType.company;
        // Aquí podrías cargar los datos del usuario desde la API
        _status = AuthStatus.authenticated;
      } else {
        _status = AuthStatus.unauthenticated;
      }
    } catch (e) {
      _status = AuthStatus.unauthenticated;
      _errorMessage = 'Error al inicializar sesión';
    }

    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    _status = AuthStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _authService.login(email, password);

      _token = response['token'] as String;
      _userType = response['userType'] == 'candidate'
          ? UserType.candidate
          : UserType.company;

      await _storageService.saveToken(_token!);
      await _storageService.saveUserType(
          _userType == UserType.candidate ? 'candidate' : 'company'
      );

      _status = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      _status = AuthStatus.unauthenticated;
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    _status = AuthStatus.loading;
    notifyListeners();

    await _storageService.clearAll();

    _currentUser = null;
    _token = null;
    _userType = null;
    _status = AuthStatus.unauthenticated;

    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}