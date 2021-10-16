import 'package:flutter/material.dart';
import 'package:park_mobil/UI/ApplicationBar/application_bar_view.dart';
import 'package:park_mobil/UI/ParkAlani/editleme_painter.dart';
import 'package:park_mobil/UI/StaticWidgets/renkler.dart';
import 'package:stacked/stacked.dart';

import 'editleme_view_model.dart';

class ParkAlaniView extends StatelessWidget {
  const ParkAlaniView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController olcuController = TextEditingController();
    return ViewModelBuilder<EditlemeViewModel>.reactive(
        builder: (context, viewBuilder, child) => Scaffold(
              appBar: const AppliactionBarView(),
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    EditlemeWidgets.bottomBarButton('color', 0, context,
                        viewBuilder, "Renk Seç", Renkler.normalMesajContainer),
                    EditlemeWidgets.bottomBarButton('delete', 1, context,
                        viewBuilder, "Sil", Renkler.acilMesajContainer),
                    EditlemeWidgets.bottomBarButton('back', 2, context,
                        viewBuilder, "Geri", Renkler.gelmeyenMusteri),
                    EditlemeWidgets.bottomBarButton('save', 3, context,
                        viewBuilder, "Kaydet", Renkler.textPasif),
                    EditlemeWidgets.bottomBarButton('question', 4, context,
                        viewBuilder, "Nasıl Yapılır", Renkler.ikonAktif),
                  ],
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: GestureDetector(
                    onPanStart: viewBuilder.onPanStart,
                    onPanUpdate: viewBuilder.onPanUpdate,
                    onPanEnd: (details) {
                      if (!viewBuilder.olcuAlindi) {
                        EditlemeWidgets.showOlcuDialog(
                            context, viewBuilder, olcuController);
                      } else {
                        viewBuilder.onPanEnd(details);
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/arac.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: CustomPaint(
                        size: (MediaQuery.of(context).size),
                        painter:
                            EditlemePainter(viewBuilder.offsets, viewBuilder),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => EditlemeViewModel());
  }
}
