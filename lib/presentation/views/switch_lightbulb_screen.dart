import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../styles/__export__.dart';
import '../viewModel/base_change_notifier.dart';
import '../../utils/__export__.dart';
import 'component/button_switcher_widget.dart';

class Example extends HookConsumerWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final useBaseViewModelRef = ref.watch(baseViewModelRef);

    AppColorExtension appColorExtension =
        Theme.of(context).extension<AppColorExtension>()!;

    return Scaffold(
      backgroundColor: appColorExtension.background,
      body: Column(
        children: [
          const Text("Hello World"),
          if (Helper.getThemeModeFromThemeName(
                  useBaseViewModelRef.activeTheme) ==
              ThemeMode.light)
            const Text("Only On Light Mode"),
        ],
      ),
    );
  }
}

class SwitchLightBulbScreen extends StatefulHookConsumerWidget {
  const SwitchLightBulbScreen({super.key});

  @override
  ConsumerState<SwitchLightBulbScreen> createState() =>
      _SwitchLightBulbScreenState();
}

class _SwitchLightBulbScreenState extends ConsumerState<SwitchLightBulbScreen> {
  final pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppColorExtension appColorExtension =
        Theme.of(context).extension<AppColorExtension>()!;

    final useBaseViewModelRef = ref.watch(baseViewModelRef);

    return Scaffold(
      backgroundColor: appColorExtension.background,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: SizedBox(
                  height: 270,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      if (Helper.getThemeModeFromThemeName(
                              useBaseViewModelRef.activeTheme) ==
                          ThemeMode.light)
                        Image.asset(
                          "img_background1_shadow".png,
                        ),
                      if (Helper.getThemeModeFromThemeName(
                              useBaseViewModelRef.activeTheme) ==
                          ThemeMode.light)
                        Image.asset(
                          "img_light_on".png,
                          height: 180,
                          width: 103,
                        ),
                      if (Helper.getThemeModeFromThemeName(
                              useBaseViewModelRef.activeTheme) ==
                          ThemeMode.dark)
                        Image.asset(
                          "img_light_off".png,
                          height: 180,
                          width: 103,
                        ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Hello,",
                    style: TextStyle(
                      color: appColorExtension.textPrimary,
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    (Helper.getThemeModeFromThemeName(
                                useBaseViewModelRef.activeTheme) ==
                            ThemeMode.light)
                        ? "Light is the first of painters. There is no object so foul that intense light will not make beautiful"
                        : "The darkness that surrounds us cannot hurt us It is the darkness in your own heart you should fear.",
                    style: TextStyle(
                      fontSize: 20,
                      color: appColorExtension.sharedTextPrimary2,
                      height: 1.2,
                    ),
                  )
                ],
              ),
              const Spacer(),
              const Center(
                child: ButtonSwitcherWidget(),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    useBaseViewModelRef.switchTheme(
                      destinationTheme: Helper.getDestinationTheme(
                        currentTheme: ProjectTheme.systemDefaultTheme.name,
                        activateSystemDefault: true,
                      ),
                    );
                  },
                  child: Text(
                    useBaseViewModelRef.activeTheme ==
                            ProjectTheme.systemDefaultTheme.name
                        ? "System Default\nActive"
                        : "Switch To\nSystem Default",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: appColorExtension.sharedTextPrimary2,
                      height: 1.2,
                    ),
                  ),
                ).noShadow,
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
