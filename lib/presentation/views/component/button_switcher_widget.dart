import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:switch_lightbulb/utils/__export__.dart';

import '../../styles/__export__.dart';
import '../../viewModel/base_change_notifier.dart';

class ButtonSwitcherWidget extends HookConsumerWidget {
  const ButtonSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    AppColorExtension appColorExtension =
        Theme.of(context).extension<AppColorExtension>()!;

    final useBaseViewModelRef = ref.watch(baseViewModelRef);

    return InkWell(
      onTap: () {
        useBaseViewModelRef.switchTheme(
          destinationTheme: Helper.getDestinationTheme(
            currentTheme: useBaseViewModelRef.activeTheme,
          ),
        );
      },
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
            color: appColorExtension.sharedTextPrimary2,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: appColorExtension.sharedTextPrimary3.withOpacity(0.7),
                offset: const Offset(
                  0,
                  0,
                ),
                blurRadius: 14,
                spreadRadius: 3,
              )
            ]),
        child: Column(
          children: [
            if (Helper.getThemeModeFromThemeName(
                    useBaseViewModelRef.activeTheme) ==
                ThemeMode.light)
              Text(
                "OFF",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: appColorExtension.sharedTextPrimary3,
                ),
              ),
            if (Helper.getThemeModeFromThemeName(
                    useBaseViewModelRef.activeTheme) ==
                ThemeMode.light)
              const Spacer(),
            Container(
              height: 42,
              width: 42,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFD9D9D9),
              ),
            ),
            if (Helper.getThemeModeFromThemeName(
                    useBaseViewModelRef.activeTheme) ==
                ThemeMode.dark)
              const Spacer(),
            if (Helper.getThemeModeFromThemeName(
                    useBaseViewModelRef.activeTheme) ==
                ThemeMode.dark)
              Text(
                "ON",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: appColorExtension.sharedTextPrimary3,
                ),
              ),
          ],
        ),
      ),
    ).noShadow;
  }
}
