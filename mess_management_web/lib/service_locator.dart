import 'package:get_it/get_it.dart';
import 'package:mess_management_web/core/services/auth_service.dart';
import 'package:mess_management_web/core/services/data_service.dart';
import 'package:mess_management_web/core/services/feedback_service.dart';
import 'package:mess_management_web/core/services/menu_service.dart';

import 'core/services/api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => MenuService());
  locator.registerLazySingleton(() => FeedbackService());
  locator.registerLazySingleton(() => DataService());
}
