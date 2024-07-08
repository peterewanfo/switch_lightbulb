import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/local_cache.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {

  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton(sharedPreferences);

  //Register Custom Shared Preference
  locator.registerLazySingleton<LocalCache>(
    () => LocalCache(
      sharedPreferences: locator(),
    ),
  );

}
