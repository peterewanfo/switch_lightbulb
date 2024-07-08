import 'package:flutter/material.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension> {
  final Color textPrimary;
  final Color sharedTextPrimary2;
  final Color sharedTextPrimary3;
  final Color sharedBackgroundPrimary;
  final Color shadowDrop;
  final Color background;
  const AppColorExtension({
    required this.textPrimary,
    required this.sharedTextPrimary2,
    required this.sharedTextPrimary3,
    required this.sharedBackgroundPrimary,
    required this.shadowDrop,
    required this.background,
  });

  @override
  ThemeExtension<AppColorExtension> copyWith({
    Color? textPrimary,
    Color? sharedTextPrimary2,
    Color? sharedTextPrimary3,
    Color? sharedBackgroundPrimary,
    Color? shadowDrop,
    Color? background,
  }) {
    return AppColorExtension(
      textPrimary: textPrimary ?? this.textPrimary,
      sharedTextPrimary2: sharedTextPrimary2 ?? this.sharedTextPrimary2,
      sharedTextPrimary3: sharedTextPrimary3 ?? this.sharedTextPrimary3,
      sharedBackgroundPrimary:
          sharedBackgroundPrimary ?? this.sharedBackgroundPrimary,
      shadowDrop: shadowDrop ?? this.shadowDrop,
      background: background ?? this.background,
    );
  }

  @override
  ThemeExtension<AppColorExtension> lerp(
      covariant ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) {
      return this;
    }

    return AppColorExtension(
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      sharedTextPrimary2:
          Color.lerp(sharedTextPrimary2, other.sharedTextPrimary2, t)!,
      sharedTextPrimary3:
          Color.lerp(sharedTextPrimary3, other.sharedTextPrimary3, t)!,
      sharedBackgroundPrimary: Color.lerp(
          sharedBackgroundPrimary, other.sharedBackgroundPrimary, t)!,
      shadowDrop: Color.lerp(shadowDrop, other.shadowDrop, t)!,
      background: Color.lerp(background, other.background, t)!,
    );
  }
}
