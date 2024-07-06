import 'package:flutter/material.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension> {
  final Color textPrimary;
  final Color sharedTextPrimary2;
  final Color sharedTextPrimary3;
  final Color sharedBackgroundPrimary;
  final Color shadowDrop;
  final Color background1;
  final Color background2;
  final Color imgBackground2;
  const AppColorExtension({
    required this.textPrimary,
    required this.sharedTextPrimary2,
    required this.sharedTextPrimary3,
    required this.sharedBackgroundPrimary,
    required this.shadowDrop,
    required this.background1,
    required this.background2,
    required this.imgBackground2,
  });

  @override
  ThemeExtension<AppColorExtension> copyWith({
    Color? textPrimary,
    Color? sharedTextPrimary2,
    Color? sharedTextPrimary3,
    Color? sharedBackgroundPrimary,
    Color? shadowDrop,
    Color? background1,
    Color? background2,
    Color? imgBackground2,
  }) {
    return AppColorExtension(
      textPrimary: textPrimary ?? this.textPrimary,
      sharedTextPrimary2: sharedTextPrimary2 ?? this.sharedTextPrimary2,
      sharedTextPrimary3: sharedTextPrimary3 ?? this.sharedTextPrimary3,
      sharedBackgroundPrimary:
          sharedBackgroundPrimary ?? this.sharedBackgroundPrimary,
      shadowDrop: shadowDrop ?? this.shadowDrop,
      background1: background1 ?? this.background1,
      background2: background2 ?? this.background2,
      imgBackground2: imgBackground2 ?? this.imgBackground2,
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
      background1: Color.lerp(background1, other.background1, t)!,
      background2: Color.lerp(background2, other.background2, t)!,
      imgBackground2: Color.lerp(imgBackground2, other.imgBackground2, t)!,
    );
  }
}
