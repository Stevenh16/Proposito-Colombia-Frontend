class AppConstants {
  // API
  static const String apiBaseUrl = 'https://api.swallow.com';
  static const int apiTimeout = 30000; // 30 segundos

  // Paginación
  static const int defaultPageSize = 10;
  static const int maxPageSize = 50;

  // Validaciones
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 50;
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 30;

  // Tiempos
  static const int splashDuration = 3000; // 3 segundos
  static const int debounceTime = 500; // 0.5 segundos

  // Límites
  static const int maxSkills = 10;
  static const int maxExperience = 10;
  static const int maxEducation = 5;
  static const int maxBioLength = 500;

  // Enlaces
  static const String propositosUrl = 'https://www.jcdnconsulting.com/propositos-colombia';
  static const String termsUrl = 'https://swallow.com/terms';
  static const String privacyUrl = 'https://swallow.com/privacy';

  // Redes sociales
  static const String twitterUrl = 'https://twitter.com/swallow';
  static const String facebookUrl = 'https://facebook.com/swallow';
  static const String linkedinUrl = 'https://linkedin.com/company/swallow';
}