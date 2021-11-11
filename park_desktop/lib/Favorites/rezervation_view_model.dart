import 'package:park_desktop/app/app.locator.dart';
import 'package:park_desktop/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RezervationViewModel extends BaseViewModel{
  navgateTo(){
    final navigationService = locator<NavigationService>();
    navigationService.navigateTo(Routes.parkingAreaSliverView);
  }
}