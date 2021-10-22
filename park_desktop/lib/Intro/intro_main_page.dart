import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:park_desktop/Intro/intro_slide_class.dart';
import 'package:park_desktop/Intro/intro_view_model.dart';
import 'package:stacked/stacked.dart';

class IntroMainPage extends StatelessWidget {
  const IntroMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IntroViewModel>.reactive(
      viewModelBuilder: () => IntroViewModel(),
      builder: (context, model, child) => IntroSlider(
        onSkipPress: () => model.navigateTo(),
        onDonePress: () => model.navigateTo(),
        
        // Dot indicator Color(0x33ffcc5c),
        colorDot: Colors.white,
        sizeDot: 13.0,
        // Tabs
        slides: [
          IntroSlideClass().addSlide(
              "Evden Çıkmadan Park Yerini Kap",
              """Evden çıkmadan acaba park alanı var mıdır diye düşünüyorsun ve strese mi giriyorsun?
         Acaaba araba ile dışarı çıkmasam diye  mi düşünüyorsun? """,
              "sport-car",
              context),
          IntroSlideClass().addSlide(
              "Rahatlıkla Yerini Rezerve Et",
              """Evden çıkmadan yerini ayarla ve kimseye kaptırma.Böylelikle direksiyon başında rahatça sürüşünü gerçekleştir.
        Kaç saat park edeceğini ve park alanı hakkunda genel yorumları ve puanlamalarını da gör. Aracını nereye bıraktığını kullanıcı 
        yorumlarıyla kolayca öğreneblirsin.""",
              "park",
              context),
          IntroSlideClass().addSlide(
              "Boşa Yakıt Harcamayı da Durdurabiliriz",
              """Bütün gün park aramaktan korkma.Değerli zamanını bu gibi işlere harcamayı bırakıp acele etmeden sürüşün keyfini çıkar.
        Çünkü senin için biz park yeri buluruz. """,
              "fuel",
              context),
          IntroSlideClass().addSlide(
              "Peki İstediğini Zaman Arabanı Kontrol Etmen",
              """Tek tıkla arabanın nerede olduğunu son durumunu kontrol edebilirsin. Herhangi bir sorun olduğunda bildirim alırsın.
        Böylelikle önemli bir yükten de kolay bir şekilde kurtuldun. Ayrıca ödemelerini de buradan kolaylıkla yapabilirsin.""",
              "secure",
              context),
        ],
        backgroundColorAllSlides: Colors.white,
        // Behavior
        scrollPhysics: const BouncingScrollPhysics(),
        hideStatusBar: true,
      ),
    );
  }
}
