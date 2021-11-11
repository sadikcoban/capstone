import 'package:flutter_login/flutter_login.dart';
import 'package:park_desktop/app/app.locator.dart';
import 'package:park_desktop/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel{
    Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> authUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }
  final _navigationService = locator<NavigationService>();
  navigateTo() {
    _navigationService.navigateTo(Routes.bottomNavigatonView);
  }
}
const users =  {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};