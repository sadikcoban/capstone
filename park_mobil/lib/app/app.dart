import 'package:park_mobil/UI/Anasayfa/anasayfa_view.dart';
import 'package:park_mobil/UI/Istatistikler/istatistikler_view.dart';
import 'package:park_mobil/UI/LoginPage/login_page_view.dart';
import 'package:park_mobil/UI/ParkAlani/Parklar/parklar_view.dart';
import 'package:park_mobil/UI/ParkAlani/YeniOtopark/yeni_otopark.dart';
import 'package:park_mobil/UI/ParkAlani/park_alani_view.dart';
import 'package:park_mobil/UI/Rezervasyon/rezervasyon_view.dart';
import 'package:park_mobil/main.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: MainClass, initial: true),
    MaterialRoute(page: Anasayfa),
    MaterialRoute(page: Rezervasyon),
    MaterialRoute(page: ParkAlaniView),
    MaterialRoute(page: ParklarView),
    MaterialRoute(page: YeniOtopark),
    MaterialRoute(page: IstatistiklerView),
    MaterialRoute(page: LoginPageView),
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
