import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:park_desktop/Login/login_view_model.dart';
import 'package:park_desktop/StaticWidgets/renkler.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => FlutterLogin(
            title: 'GELGEL',
            logo: 'images/logo.png',
            onLogin: model.authUser,
            onSignup: model.authUser,
            onSubmitAnimationCompleted: () => model.navigateTo(),
            onRecoverPassword: model.recoverPassword,
            theme: LoginTheme(
              primaryColor: Renkler.morKapali,
              accentColor: Colors.white,
              errorColor: Colors.deepOrange,
              titleStyle: GoogleFonts.montserrat(),
              bodyStyle: GoogleFonts.montserrat(),
            )));
  }
}
