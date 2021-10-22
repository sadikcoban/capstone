import 'package:park_mobil/app/app.locator.dart';
import 'package:park_mobil/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ApplicationBarViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  int currentIndex = 0;
  navigateTo(int code) {
    currentIndex = code;
    switch (code) {
      case 0:
        _navigationService.navigateTo(Routes.anasayfa);
        break;
      case 1:
        _navigationService.navigateTo(Routes.rezervasyon);
        break;
      case 2:
        _navigationService.navigateTo(Routes.istatistiklerView);
        break;
      case 3:
        _navigationService.navigateTo(Routes.parklarView);
        break;
      case 4:
        _navigationService.navigateTo(Routes.rezervasyon);
        break;
      default:
    }
    notifyListeners();
  }
}
