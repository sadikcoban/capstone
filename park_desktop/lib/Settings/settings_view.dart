import 'package:flutter/material.dart';
import 'package:park_desktop/Settings/settings_view_model.dart';
import 'package:park_desktop/StaticWidgets/renkler.dart';
import 'package:park_desktop/StaticWidgets/static_widget_class.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
        viewModelBuilder: () => SettingsViewModel(),
        builder: (context, model, child) => Scaffold(
              body: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      StaticWidgetClass.itemYazi(
                          context: context,
                          baslik: "Ayarlar",
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          textAlign: TextAlign.left),
                      const SizedBox(
                        height: 20,
                      ),
                      const SettingsItem(
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        name: "Kişisel Bilgiler",
                      ),
                      const SettingsItem(
                          icon: Icon(
                            Icons.car_rental,
                            color: Colors.white,
                          ),
                          name: "Araç Bilgileri"),
                      const SettingsItem(
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          name: "Bildirimler"),
                      const SettingsItem(
                          icon: Icon(
                            Icons.payment,
                            color: Colors.white,
                          ),
                          name: "Ödeme Yöntemleri"),
                      const SettingsItem(
                          icon: Icon(
                            Icons.money,
                            color: Colors.white,
                          ),
                          name: "Geçmiş İşlemlerim"),
                      const SettingsItem(
                          icon: Icon(
                            Icons.language,
                            color: Colors.white,
                          ),
                          name: "Dil"),
                      const SettingsItem(
                          icon: Icon(
                            Icons.help,
                            color: Colors.white,
                          ),
                          name: "Yardım"),
                      const Spacer(),
                      const LogOut(),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class SettingsItem extends StatelessWidget {
  final Icon icon;
  final String name;
  const SettingsItem({Key? key, required this.icon, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          iconContainer(),
          const SizedBox(
            width: 25,
          ),
          StaticWidgetClass.itemYazi(
              context: context,
              baslik: name,
              color: Colors.black,
              fontSize: 19),
        ],
      ),
    );
  }

  iconContainer() {
    return // Group: button3
        Container(
      width: 45.0,
      height: 45.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Renkler.morRenk, Renkler.morKapali],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1466CC).withOpacity(0.16),
            offset: const Offset(0, 15.0),
            blurRadius: 30.0,
          ),
        ],
      ),
      child: icon,
    );
  }
}

class LogOut extends StatelessWidget {
  const LogOut({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          iconContainer(),
          const SizedBox(
            width: 25,
          ),
          StaticWidgetClass.itemYazi(
              context: context,
              baslik: "Çıkış Yap",
              color: Colors.black,
              fontSize: 19),
        ],
      ),
    );
  }

  iconContainer() {
    return // Group: button3
        Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.red, Colors.redAccent],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1466CC).withOpacity(0.16),
            offset: const Offset(0, 15.0),
            blurRadius: 30.0,
          ),
        ],
      ),
      child: const Icon(
        Icons.logout,
        color: Colors.white,
      ),
    );
  }
}
