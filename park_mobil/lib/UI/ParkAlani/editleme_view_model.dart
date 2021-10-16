import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:park_mobil/UI/ParkAlani/line_item.dart';
import 'package:park_mobil/UI/StaticWidgets/static_widget_class.dart';
import 'package:park_mobil/UI/StaticWidgets/statik_texts.dart';

class EditlemeViewModel with ChangeNotifier {
  List<ShapeItems> shapes = [];
  List<LineItems> offsets = [];
  late String resimPath;
  int seciliIndex = 0;
  bool isNearPointStart = true;
  Color lineColor = Colors.green;
  bool olcuAlindi = false;
  late double sizePixelRatio;
  onPanStart(var details) {
    //uzunluk degistirme kısmı
    for (int i = 0; i < offsets.length; i++) {
      if ((offsets[i].start - details.localPosition).distanceSquared < 100) {
        isNearPointStart = true;
        seciliIndex = i;
        return;
      }

      if ((offsets[i].end - details.localPosition).distanceSquared < 100) {
        isNearPointStart = false;
        seciliIndex = i;
        return;
      }
    }
    seciliIndex = offsets.length;
    offsets.add(
      LineItems(
          start: details.localPosition,
          end: details.localPosition,
          color: lineColor),
    );
    notifyListeners();
  }

  onPanUpdate(var details) {
    if (isNearPointStart) {
      offsets[seciliIndex].start = details.localPosition;
    } else {
      offsets[seciliIndex].end = details.localPosition;
    }
    if (olcuAlindi) {
      offsets[seciliIndex].uzunluk =
          (offsets[seciliIndex].start - offsets[seciliIndex].end).distance *
              sizePixelRatio;
    } else {
      offsets[seciliIndex].uzunluk =
          (offsets[seciliIndex].start - offsets[seciliIndex].end).distance;
    }
    notifyListeners();
  }

  onPanEnd(DragEndDetails details) {
    if (offsets.length > 1) {
      var lastLine = offsets.last;
      var prevLine = offsets[offsets.length - 2];
      if ((prevLine.end - lastLine.start).distanceSquared < 300) {
        offsets[offsets.length - 2].connected = true;
        offsets.last.start = offsets[offsets.length - 2].end;
        notifyListeners();
      }
      if ((lastLine.end - offsets[0].start).distanceSquared < 100) {
        lastLine.connected = true;
      }
    }

    if (offsets.any((element) => element.connected == false)) {
    } else {
      double xCenter = 0.0;
      double yCenter = 0.0;
      for (var element in offsets) {
        xCenter += element.start.dx;
        yCenter += element.start.dy;
      }
      xCenter = xCenter / (offsets.length);
      yCenter = yCenter / (offsets.length);

      List<double> xCoords = [];
      List<double> yCoords = [];

      for (var i = 0; i < offsets.length; i++) {
        xCoords.add(offsets[i].start.dx);
        yCoords.add(offsets[i].start.dy);
      }
      double area = polygonArea(xCoords, yCoords, offsets.length);
      shapes.add(ShapeItems(
          lineItems: offsets, xPos: xCenter, yPos: yCenter, area: area));
    }
  }

  double polygonArea(List<double> X, List<double> Y, int n) {
    // Initialize area
    double area = 0.0;
    int j = n - 1;
    for (int i = 0; i < n; i++) {
      area +=
          ((X[j] + X[i]) * sizePixelRatio) * ((Y[j] - Y[i]) * sizePixelRatio);

      // j is previous vertex to i
      j = i;
    }

    // Return absolute value
    return (area / 2.0).abs();
  }

  setHeightPixelRatio(double realSize) {
    if (!olcuAlindi) {
      sizePixelRatio = (realSize / offsets[0].uzunluk).toDouble();
      olcuAlindi = true;
      deleteAll();
      notifyListeners();
    }
  }

  deleteAll() {
    offsets = [];
    notifyListeners();
  }

  deleteLast() {
    if (offsets.isNotEmpty) offsets.removeLast();
    notifyListeners();
  }

  setColor(
    Color color,
  ) {
    lineColor = color;
    notifyListeners();
  }
}

class EditlemeWidgets {
  static Future<void> showInitialDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          insetPadding: const EdgeInsets.all(3),
          elevation: 10,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 1, 1, 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StatikTexts.yaziText(
                              text: "Çizim Aracı Yardımı",
                              yaziRengi: Colors.black,
                              weight: FontWeight.normal,
                              size: 20,
                              align: TextAlign.left),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              alignment: FractionalOffset.topRight,
                              child: GestureDetector(
                                child: const Icon(
                                  Icons.close,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    initialDialogContentRow(
                      'cizim-araci/cizim-icon',
                      'Çizim yapmak için kullanılır. İlk çiziminizde size ölçü soracaktır. Uzun basıldığında renk seçilebilir.',
                      60,
                      context,
                    ),
                    initialDialogContentRow(
                      'cizim-araci/sil',
                      'Son yapılan çizimleri silmek için kullanılır.',
                      60,
                      context,
                    ),
                    initialDialogContentRow(
                      'cizim-araci/geri-al',
                      'Son yapılan çizimleri tek tek geri almak için kullanılır.',
                      60,
                      context,
                    ),
                    initialDialogContentRow(
                      'cizim-araci/tamamini-geri-al',
                      'Son yapılan çizimlerin tamamını  geri almak için kullanılır.',
                      60,
                      context,
                    ),
                    initialDialogContentRow(
                      'cizim-araci/kaydet',
                      'Son yapılan çizimleri kaydetmek için kullanılır.',
                      60,
                      context,
                    ),
                    initialDialogContentRow(
                      'cizim-araci/yardim',
                      'Şimdi görüntülediğiniz yardım penceresine tekrar dönmek için kullanılır.',
                      60,
                      context,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget initialDialogContentRow(
      String svg, String text, double svgSize, BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            Material(
              elevation: 10,
              shadowColor: Colors.white,
              child: StaticWidgetClass.generalIconFunc(
                svgSize,
                svgSize,
                svg,
              ),
            ),
            const SizedBox(width: 15),
            SizedBox(
              width: 300,
              child: StaticWidgetClass.specialText(
                text,
                6,
                Colors.black,
                FontWeight.normal,
                18,
                1,
                TextAlign.left,
                context,
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Future<void> showOlcuDialog(BuildContext dialogContext,
      EditlemeViewModel provider, TextEditingController controller) async {
    return showDialog<void>(
      context: dialogContext,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xfff5f5f5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          insetPadding: const EdgeInsets.all(3),
          elevation: 10,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 1, 1, 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StatikTexts.yaziText(
                              text: 'Ölçü Giriniz',
                              yaziRengi: Colors.black,
                              weight: FontWeight.normal,
                              size: 22,
                              align: TextAlign.left),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              alignment: FractionalOffset.topRight,
                              child: GestureDetector(
                                child: const Icon(
                                  Icons.close,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    StatikTexts.yaziText(
                        text:
                            'Bu alana, çizdiğiniz doğrunun uzunluğunu metre cinsinden virgül kullanmadan yazınız. Devamında yapacağınız çizimler bu ölçeğe göre hesaplanacaktır.(Örnek: 9.8)',
                        yaziRengi: Colors.black,
                        weight: FontWeight.normal,
                        size: 18,
                        align: TextAlign.left),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Material(
                          elevation: 100,
                          child: TextField(
                            controller: controller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              suffixIconConstraints: const BoxConstraints(
                                minHeight: 25,
                                minWidth: 25,
                                maxHeight: 32,
                                maxWidth: 32,
                              ),
                              hintText: 'Metre Cinsinden Ölçü Giriniz',
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 20.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: StaticWidgetClass.butonTasarimi(
                              context: context,
                              baslik: 'Vazgeç',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              provider.setHeightPixelRatio(
                                  double.parse(controller.text));
                              Navigator.of(context).pop();
                            },
                            child: StaticWidgetClass.butonTasarimi(
                              context: context,
                              baslik: 'Kaydet',
                              color: StaticWidgetClass.koyuMavi,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget bottomBarButton(String svgPath, int index, BuildContext context,
      EditlemeViewModel provider, String name, Color yaziRengi) {
    return Material(
      child: InkWell(
          onTap: () {
            switch (index) {
              case 0:
                colorPicker(
                  editlemeProvider: provider,
                  context: context,
                );
                break;
              case 1:
                provider.deleteAll();
                break;
              case 2:
                provider.deleteLast();
                break;
              case 4:
                EditlemeWidgets.showInitialDialog(context);
                break;
              default:
            }
          },
          child: SizedBox(
            height: 120,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StaticWidgetClass.generalIconFunc(25, 25, svgPath,
                          color: yaziRengi),
                      StaticWidgetClass.itemYazi(
                          context: context, baslik: name, color: yaziRengi)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          )),
    );
  }

  static colorPicker({
    required EditlemeViewModel editlemeProvider,
    required BuildContext context,
  }) {
    // raise the [showDialog] widget
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Renk Seç'),
          content: SingleChildScrollView(
            child: BlockPicker(
                pickerColor: editlemeProvider.lineColor,
                onColorChanged: (color) {
                  editlemeProvider.setColor(color);
                  Navigator.of(context).pop();
                }),
            // Use Material color picker:
            //
            // child: MaterialPicker(
            //   pickerColor: pickerColor,
            //   onColorChanged: changeColor,
            //   showLabel: true, // only on portrait mode
            // ),
            //
            // Use Block color picker:
            //
            /*child: BlockPicker(
            pickerColor: currentColor,
             onColorChanged: changeColor,
             ),*/

            /*   child: MultipleChoiceBlockPicker(
             pickerColors: currentColors,
              onColorsChanged: changeColors,
             ), */
          ),
        );
      },
    );
  }
}
