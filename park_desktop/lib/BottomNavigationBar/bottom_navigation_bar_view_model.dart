import 'package:park_desktop/HomPage/home_page.dart';
import 'package:stacked/stacked.dart';

class BottomNavigationViewModel extends BaseViewModel {
  int currentIndex = 0;
  void handleIndexChanged(int i) {
    currentIndex = i;
    notifyListeners();
  }

  final tabs = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage()
  ];
}
