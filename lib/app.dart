import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/viewModel/base_change_notifier.dart';
import 'utils/__export__.dart';
import 'presentation/views/switch_lightbulb_screen.dart';

class App extends StatefulHookConsumerWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (mounted) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ProviderScope.containerOf(context)
              .read(baseViewModelRef)
              .refreshActiveTheme();
        });
      }
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    final useBaseViewModelRef = ref.watch(baseViewModelRef);

    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Switch  LightBulb",
      theme: Helper.generateThemeData(
        applicationTheme: Helper.convertThemeNameToEnum(
          useBaseViewModelRef.activeTheme,
        ),
      ),
      darkTheme: Helper.generateThemeData(
        applicationTheme: Helper.convertThemeNameToEnum(
          useBaseViewModelRef.activeTheme,
        ),
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.dark,
      builder: (context, wg) {
        return const SwitchLightBulbScreen();
      },
    );
  }
}
