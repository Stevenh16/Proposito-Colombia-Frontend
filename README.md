# swallow_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
// ============================================
// ESTRUCTURA DE CARPETAS
// ============================================
/*
swallow_app/
├── lib/
│   ├── main.dart
│   ├── config/
│   │   └── theme.dart
│   ├── providers/
│   │   └── theme_provider.dart
│   ├── routes/
│   │   ├── app_router.dart
│   │   └── route_names.dart
│   ├── models/
│   │   ├── vacancy.dart
│   │   ├── application.dart
│   │   └── user.dart
│   ├── widgets/
│   │   ├── buttons/
│   │   │   ├── add_button.dart
│   │   │   └── button_custom.dart
│   │   ├── cards/
│   │   │   ├── item_card.dart
│   │   │   └── vacancy_card.dart
│   │   ├── containers/
│   │   │   └── form_container.dart
│   │   ├── dropdowns/
│   │   │   ├── custom_dropdown.dart
│   │   │   └── modal_selector.dart
│   │   ├── headers/
│   │   │   ├── progress_header.dart
│   │   │   └── propositos_header.dart
│   │   ├── inputs/
│   │   │   └── form_field_widget.dart
│   │   ├── lists/
│   │   │   └── tags_list.dart
│   │   ├── misc/
│   │   │   ├── golondrina.dart
│   │   │   ├── footer.dart
│   │   │   ├── info_section.dart
│   │   │   ├── progress_bar.dart
│   │   │   └── text_link.dart
│   │   └── navigation/
│   │       ├── bottom_tab_navigator.dart
│   │       └── floating_action_menu.dart
│   └── screens/
│       ├── loading/
│       │   └── loading_screen.dart
│       ├── vacantes/
│       │   └── vacantes_screen.dart
│       ├── postulaciones/
│       │   └── postulaciones_screen.dart
│       ├── matches/
│       │   └── matches_screen.dart
│       └── explorar/
│           └── explorar_screen.dart
├── assets/
│   ├── images/
│   └── fonts/
└── pubspec.yaml