import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.router.dart';

class ProfileViewModel extends BaseViewModel{
  final navService = locator<NavigationService>();

  navigateToSettings(){
    navService.navigateTo(Routes.settingsHome);
  }
}