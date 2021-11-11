import 'package:flutter/material.dart';
import 'package:park_desktop/ApplicationBar/application_bar_view_model.dart';
import 'package:park_desktop/StaticWidgets/renkler.dart';
import 'package:park_desktop/StaticWidgets/static_widget_class.dart';
import 'package:stacked/stacked.dart';

class ApplicationBarView extends StatelessWidget with PreferredSizeWidget {
  final String baslik;
  const ApplicationBarView({Key? key, required this.baslik}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ApplicationBarViewModel>.reactive(
      viewModelBuilder: () => ApplicationBarViewModel(),
      builder: (context, model, child) => AppBar(
        title: StaticWidgetClass.itemYazi(
            context: context,
            baslik: baslik,
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 22),
        backgroundColor: Renkler.backgroundColor,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.keyboard_arrow_left,
            color: Renkler.morKapali,
            size: 55,
          ),
        ),
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
