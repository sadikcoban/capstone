import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:park_mobil/UI/ApplicationBar/application_bar_view_model.dart';
import 'package:park_mobil/UI/StaticWidgets/renkler.dart';
import 'package:park_mobil/UI/StaticWidgets/statik_texts.dart';
import 'package:stacked/stacked.dart';

class AppliactionBarView extends StatelessWidget with PreferredSizeWidget {
  const AppliactionBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ApplicationBarViewModel>.reactive(
      viewModelBuilder: () => ApplicationBarViewModel(),
      builder: (context, model, child) => AppBar(
        backgroundColor: Renkler.appBarRengi,
        elevation: 0.0,
        actions: [
          const SizedBox(
            width: 20,
          ),
          Center(
            child: Text(
              "SaMe&TA",
              style: GoogleFonts.pacifico(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange,
                  fontSize: 20),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          GestureDetector(
            onTap: () {
              model.navigateTo(0);
            },
            child: StatikTexts.ikonVeText(
                ikonColor: model.currentIndex == 0
                    ? Renkler.ikonAktif
                    : Renkler.ikonPasif,
                textColor: model.currentIndex == 0
                    ? Renkler.textAktif
                    : Renkler.textPasif,
                yazi: "Anasayfa",
                icon: Icons.home),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              model.navigateTo(1);
            },
            child: StatikTexts.ikonVeText(
                ikonColor: model.currentIndex == 1
                    ? Renkler.ikonAktif
                    : Renkler.ikonPasif,
                textColor: model.currentIndex == 1
                    ? Renkler.textAktif
                    : Renkler.textPasif,
                yazi: "Rezervasyon",
                icon: Icons.calendar_today),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              model.navigateTo(2);
            },
            child: StatikTexts.ikonVeText(
                ikonColor: model.currentIndex == 2
                    ? Renkler.ikonAktif
                    : Renkler.ikonPasif,
                textColor: model.currentIndex == 2
                    ? Renkler.textAktif
                    : Renkler.textPasif,
                yazi: "İstatistikler",
                icon: Icons.pie_chart),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              model.navigateTo(3);
            },
            child: StatikTexts.ikonVeText(
                ikonColor: model.currentIndex == 3
                    ? Renkler.ikonAktif
                    : Renkler.ikonPasif,
                textColor: model.currentIndex == 3
                    ? Renkler.textAktif
                    : Renkler.textPasif,
                yazi: "Park Alanı",
                icon: Icons.car_rental),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              model.navigateTo(4);
            },
            child: StatikTexts.ikonVeText(
                ikonColor: model.currentIndex == 4
                    ? Renkler.ikonAktif
                    : Renkler.ikonPasif,
                textColor: model.currentIndex == 4
                    ? Renkler.textAktif
                    : Renkler.textPasif,
                yazi: "Ayarlar",
                icon: Icons.settings),
          ),
          const Spacer(
            flex: 2,
          ),
          GestureDetector(
            onTap: () {
              model.navigateTo(5);
            },
            child: StatikTexts.ikonVeText(
              ikonColor: const Color(0xffF35162),
              textColor: const Color(0xffF35162),
              yazi: "Çıkış Yap",
              icon: Icons.logout,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarProvider with ChangeNotifier {
  int currentIndex = 0;

  setIndex({
    required int index,
  }) {
    currentIndex = index;
    notifyListeners();
  }
}
