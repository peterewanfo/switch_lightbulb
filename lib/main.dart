import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import 'utils/__export__.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (val) {
      runApp(
        const ProviderScope(
          child: App(),
        ),
      );
    },
  );
}
