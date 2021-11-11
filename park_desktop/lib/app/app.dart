import 'package:park_desktop/BottomNavigationBar/botttom_navigation_view.dart';
import 'package:park_desktop/HomPage/AddNewCar/add_new_car.dart';
import 'package:park_desktop/Intro/intro_main_page.dart';
import 'package:park_desktop/Login/login_view.dart';
import 'package:park_desktop/ParkingAreas/parking_area_sliver_view.dart';
import 'package:park_desktop/splash_screen.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../main.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: MainClass, initial: true),
    MaterialRoute(page: BottomNavigatonView),
    MaterialRoute(page: IntroMainPage),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SplashScreen),
    MaterialRoute(page: AddNewCar),
    MaterialRoute(page: ParkingAreaSliverView),


  ],
  dependencies: [
    LazySingleton(
      classType: NavigationService,
    ),
    /*
    LazySingleton(classType: AuthService),
    LazySingleton(classType: AnaSayfaService),
    LazySingleton(classType: NotlarService),
    LazySingleton(classType: TalepDetayService),
    LazySingleton(classType: FotografService),
    LazySingleton(classType: DeviceLocationService),
    LazySingleton(classType: KonumService),
    Singleton(classType: NotlarViewModel),
    LazySingleton(classType: TapularService),
    LazySingleton(classType: YetkiYazilariService),
    LazySingleton(
      classType: TapuItemService,
    ), */
  ],
  logger: StackedLogger(),
)
class App {
  /* This class has no puporse besides housing the annotation that generates the required functionality */
}
