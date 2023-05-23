import 'package:get_it/get_it.dart';
import 'package:gumtree_hr_management/services/navigation/navigation_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  //Services
  locator.registerLazySingleton<NavigationService>(() => NavigationService());

  //View Models
}
