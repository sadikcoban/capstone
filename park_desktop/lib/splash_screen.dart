import 'package:flutter/material.dart';
import 'package:park_desktop/StaticWidgets/renkler.dart';
import 'package:park_desktop/StaticWidgets/static_widget_class.dart';
import 'package:park_desktop/app/app.locator.dart';
import 'package:park_desktop/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      onModelReady: (model) => model.onModalReady(),
      builder: (context, model, child) => Container(
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * (0.8),
          decoration: BoxDecoration(
              color: Renkler.morKapali,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.zero, bottom: Radius.circular(50))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  StaticWidgetClass.itemYazi(
                      context: context,
                      baslik: "GELGEL",
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                  const SizedBox(
                    height: 20,
                  ),
                  StaticWidgetClass.itemYazi(
                      context: context,
                      baslik: "Bilgisayar Görüşlü\n Park Otomasyonu",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ],
              ),
              Image.asset("images/wolkswagen.png")
            ],
          ),
        ),
      ),
    );
  }
}

class SplashScreenViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  onModalReady() {
    runBusyFuture(navigateTo(), throwException: true);
  }

  navigateTo() async {
    await Future.delayed(const Duration(seconds: 2), () {
      navigationService.pushNamedAndRemoveUntil(Routes.bottomNavigatonView);
    });
  }
}
