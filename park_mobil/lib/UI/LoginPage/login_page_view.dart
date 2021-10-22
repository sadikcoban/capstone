import 'package:flutter/material.dart';
import 'package:park_mobil/UI/LoginPage/login_parge_view_model.dart';
import 'package:park_mobil/UI/StaticWidgets/padding_static_class.dart';
import 'package:park_mobil/UI/StaticWidgets/renkler.dart';
import 'package:park_mobil/UI/StaticWidgets/static_widget_class.dart';
import 'package:park_mobil/UI/StaticWidgets/statik_texts.dart';
import 'package:stacked/stacked.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginPageViewModel>.reactive(
        viewModelBuilder: () => LoginPageViewModel(),
        builder: (context, model, child) => Scaffold(
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        "assets/backgroundImage.jpg",
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: PaddingStaticClass.paddingRate * 60,
                            vertical: PaddingStaticClass.paddingRate * 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            StatikTexts.yaziText(
                                text: "GELGEL'E HOŞGELDİN SİK KIRIĞI1",
                                size: 40,
                                weight: FontWeight.bold,
                                yaziRengi: Renkler.textAktif,
                                ),
                            const SizedBox(
                              height: 70,
                            ),
                            StatikTexts.yaziText(
                                text:
                                    "1000'den fazla Otopark ve 10 Milyondan fazla kullanıcıya sahip GelGel'de beraber büyüyeceğiz",
                                size: 20,
                                weight: FontWeight.w600,
                                yaziRengi: Renkler.textPasif),
                            const SizedBox(
                              height: 40,
                            ),
                            StaticWidgetClass.loginTextField(
                                context: context,
                                controller: model.emialController,
                                hint: "E-POSTA"),
                            StaticWidgetClass.loginTextField(
                                context: context,
                                controller: model.emialController,
                                hint: "ŞİFRE"),
                            const SizedBox(
                              height: 30,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            GestureDetector(
                              onTap: () => model.navigateTo(),
                              child: StaticWidgetClass.butonTasarimi(
                                  context: context,
                                  baslik: "Giriş Yap",
                                  color: Renkler.parkAlanibeklemedeDisRenk),
                            )
                          ],
                        ),
                      ),
                      flex: 3,
                    )
                  ],
                ),
              ),
            ));
  }
}
