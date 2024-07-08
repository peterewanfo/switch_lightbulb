import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:switch_lightbulb/utils/app_constants.dart';

import '../presentation/styles/__export__.dart';
import 'enums.dart';

class Helper {
  static ThemeData generateThemeData({
    required ProjectTheme applicationTheme,
  }) {
    ThemeData defaultLightTheme = ThemeData(
      scaffoldBackgroundColor: CustomColors.lightBackground,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.grey,
      ),
      extensions: <ThemeExtension<dynamic>>{
        AppColorExtension(
          textPrimary: CustomColors.lightTextPrimary,
          sharedTextPrimary2: CustomColors.sharedTextPrimary2,
          sharedTextPrimary3: CustomColors.sharedTextPrimary3,
          sharedBackgroundPrimary: CustomColors.sharedBackgroundPrimary,
          shadowDrop: CustomColors.lightShadowdrop,
          background: CustomColors.lightBackground,
        ),
      },
    );

    ThemeData defaultDarkTheme = ThemeData(
      scaffoldBackgroundColor: CustomColors.darkBackground,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.grey,
      ),
      useMaterial3: true,
      extensions: <ThemeExtension<dynamic>>{
        AppColorExtension(
          textPrimary: CustomColors.darkTextPrimary,
          sharedTextPrimary2: CustomColors.sharedTextPrimary2,
          sharedTextPrimary3: CustomColors.sharedTextPrimary3,
          sharedBackgroundPrimary: CustomColors.sharedBackgroundPrimary,
          shadowDrop: CustomColors.darkShadowdrop,
          background: CustomColors.darkBackground,
        ),
      },
      dividerTheme: DividerThemeData(
        color: Colors.grey[300],
        thickness: 0.5,
        space: 0.5,
        indent: 10,
        endIndent: 10,
      ),
    );

    switch (applicationTheme) {
      case ProjectTheme.darkTheme:
        return defaultDarkTheme;
      case ProjectTheme.lightTheme:
        return defaultLightTheme;
      case ProjectTheme.systemDefaultTheme:
        var brightness =
            SchedulerBinding.instance.platformDispatcher.platformBrightness;
        bool isDarkMode = brightness == Brightness.dark;
        if (isDarkMode) {
          return defaultDarkTheme;
        } else {
          return defaultLightTheme;
        }
      default:
        return defaultLightTheme;
    }
  }

  static ProjectTheme convertThemeNameToEnum(String applicationTheme) {
    switch (applicationTheme) {
      case AppConstants.lightThemeKey:
        return ProjectTheme.lightTheme;
      case AppConstants.darkThemeKey:
        return ProjectTheme.darkTheme;
      case AppConstants.systemDefaultThemeKey:
        return ProjectTheme.systemDefaultTheme;
      default:
        return ProjectTheme.systemDefaultTheme;
    }
  }

  static ThemeMode getThemeModeFromThemeName(String applicationTheme) {
    switch (applicationTheme) {
      case AppConstants.lightThemeKey:
        return ThemeMode.light;
      case AppConstants.darkThemeKey:
        return ThemeMode.dark;
      default:
        var brightness =
            SchedulerBinding.instance.platformDispatcher.platformBrightness;
        bool isDarkMode = brightness == Brightness.dark;
        if (isDarkMode) {
          return ThemeMode.dark;
        } else {
          return ThemeMode.light;
        }
    }
  }

  static ProjectTheme getDestinationTheme({
    required String currentTheme,
    bool activateSystemDefault = false,
  }) {
    switch (currentTheme) {
      case AppConstants.lightThemeKey:
        return ProjectTheme.darkTheme;
      case AppConstants.darkThemeKey:
        return ProjectTheme.lightTheme;
      default:
        if (activateSystemDefault) {
          return ProjectTheme.systemDefaultTheme;
        } else {
          var brightness =
              SchedulerBinding.instance.platformDispatcher.platformBrightness;
          bool isDarkMode = brightness == Brightness.dark;
          if (isDarkMode) {
            return ProjectTheme.lightTheme;
          } else {
            return ProjectTheme.darkTheme;
          }
        }
    }
  }
}
