import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:park_mobil/UI/ApplicationBar/application_bar_view.dart';
import 'package:park_mobil/UI/StaticWidgets/renkler.dart';
import 'package:park_mobil/UI/StaticWidgets/statik_texts.dart';

class Anasayfa extends StatelessWidget {
  const Anasayfa({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.arkaPlanRengi,
      appBar: const AppliactionBarView(),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StatikTexts.sayfaIsmi(
                            sayfaAdi: "Anasayfa",
                            aciklama: "Tekrar Hoşgeldiniz"),
                       const SizedBox(
                          height: 15,
                        ),
                        hizliBakis(context),
                      ],
                    ),
                  ),
                  Flexible(flex: 3, child: profil()),
                ],
              ),
              StatikTexts.yaziText(
                  text: "Müşteriler",
                  size: 22,
                  align: TextAlign.start,
                  weight: FontWeight.w900),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: kullanicilar(),
                    flex: 8,
                  ),
                  Flexible(child: bildirimler(), flex: 3),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  hizliBakis(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StatikTexts.yaziText(text: "Hızlı Bakış", size: 16),
        Row(
          children: [
            StatikTexts.hizliBakis(
                baslik: "Boş Park Yeri ",
                aciklama: "15",
                context: context,
                yukesliyorMu: false,
                noktaRengi: Colors.green),
            StatikTexts.hizliBakis(
                baslik: "Anlık Araç Sayısı ",
                aciklama: "30",
                context: context,
                yukesliyorMu: true,
                noktaRengi: Colors.blue),
            StatikTexts.hizliBakis(
                baslik: "Günlük Araç Sayısı ",
                aciklama: "1,500",
                context: context,
                yukesliyorMu: true,
                noktaRengi: Colors.red),
            StatikTexts.hizliBakis(
                baslik: "Müşteri Memnuniyeti",
                aciklama: "4.2/5",
                context: context,
                yukesliyorMu: true,
                noktaRengi: Colors.deepPurple),
            StatikTexts.hizliBakis(
                baslik: "Günlük kazanç ",
                aciklama: "480 TL",
                context: context,
                yukesliyorMu: false,
                noktaRengi: Colors.indigoAccent),
          ],
        ),
      ],
    );
  }

  kullanicilar() {
    return Wrap(
      children: [
        StatikTexts.kullaniciBilgileri(
            isimSoyisim: "Salih Mert ATALAY",
            araba: "Renault Clio GT Line",
            tarih: "28 Nisan 2021",
            zaman: "11.00 - 12.00",
            otoparkBolumu: "B1",
            disRenk: Renkler.gelenMusteri),
        StatikTexts.kullaniciBilgileri(
            isimSoyisim: "Salih Mert ATALAY",
            araba: "Renault Clio GT Line",
            tarih: "28 Nisan 2021",
            zaman: "11.00 - 12.00",
            otoparkBolumu: "B1",
            disRenk: Renkler.gelenMusteri),
        StatikTexts.kullaniciBilgileri(
            isimSoyisim: "Salih Mert ATALAY",
            araba: "Renault Clio GT Line",
            tarih: "28 Nisan 2021",
            zaman: "11.00 - 12.00",
            otoparkBolumu: "B1",
            disRenk: Renkler.gelmeyenMusteri),
        StatikTexts.kullaniciBilgileri(
            isimSoyisim: "Salih Mert ATALAY",
            araba: "Renault Clio GT Line",
            tarih: "28 Nisan 2021",
            zaman: "11.00 - 12.00",
            otoparkBolumu: "B1",
            disRenk: Renkler.gelmeyenMusteri),
        StatikTexts.kullaniciBilgileri(
            isimSoyisim: "Salih Mert ATALAY",
            araba: "Renault Clio GT Line",
            tarih: "28 Nisan 2021",
            zaman: "11.00 - 12.00",
            otoparkBolumu: "B1",
            disRenk: Renkler.beklenenMusteri),
        StatikTexts.kullaniciBilgileri(
            isimSoyisim: "Salih Mert ATALAY",
            araba: "Renault Clio GT Line",
            tarih: "28 Nisan 2021",
            zaman: "11.00 - 12.00",
            otoparkBolumu: "B1",
            disRenk: Renkler.beklenenMusteri),
        StatikTexts.kullaniciBilgileri(
            isimSoyisim: "Salih Mert ATALAY",
            araba: "Renault Clio GT Line",
            tarih: "28 Nisan 2021",
            zaman: "11.00 - 12.00",
            otoparkBolumu: "B1",
            disRenk: Renkler.beklenenMusteri),
      ],
    );
  }

  profil() {
    return Container(
      height: 300,
      decoration:const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(left: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SvgPicture.asset("assets/user.svg"),
            StatikTexts.yanYanaYazi(
                sayfaAdi: "Ad-Soyad", aciklama: "Salih Mert ATALAY"),
            const Spacer(),
            StatikTexts.yanYanaYazi(sayfaAdi: "Meslek", aciklama: "Güvenlik"),
           const  Spacer(),
            StatikTexts.yanYanaYazi(sayfaAdi: "il", aciklama: "KIRKLARELİ"),
            const Spacer(),
            StatikTexts.yanYanaYazi(sayfaAdi: "İlçe", aciklama: "MERKEZ"),
           const  Spacer(),
            StatikTexts.yanYanaYazi(
                sayfaAdi: "Adres",
                aciklama: "Cumhuriyet Mahallesi Huzurum Sitesi E blok Daire 9"),
           const  Spacer(),
          ],
        ),
      ),
    );
  }

  bildirimler() {
    return Container(
      alignment: Alignment.topRight,
      height: 500,
      decoration:const  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(left: Radius.circular(15))),
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatikTexts.yaziText(
                      text: "Bildirimler", weight: FontWeight.w900, size: 20),
                  StatikTexts.yaziText(
                      text: "Hepsini Gör",
                      weight: FontWeight.w900,
                      size: 14,
                      yaziRengi: Renkler.turuncu),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Mesaj(
                    disRenk: index % 2 == 0
                        ? Renkler.gelmeyenMusteri
                        : Renkler.beklenenMusteri,
                    svgName: index % 2 == 0 ? "unlem" : "email",
                    baslik: index % 2 == 0 ? "ACİL !!!" : "Kapanış",
                    aciklama: index % 2 == 0
                        ? "Park etmemesi gereken bir araç parketmiştir.Aracın çekilmesi gerekmektedir."
                        : "Otoparktan çıkılmadan kayıtların kontrol edilip çıkış yapılması gerekir.",
                  ),
                  itemCount: 16,
                ),
              ),
            ],
          )),
    );
  }
}

class Mesaj extends StatelessWidget {
  const Mesaj(
      {required this.disRenk,
      required this.svgName,
      required this.baslik,
      required this.aciklama,Key? key}) : super(key: key);
  final String svgName;
  final Color disRenk;
  final String baslik;
  final String aciklama;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: mesajKutusu(disRenk: disRenk, svgName: svgName),
        title: Text(baslik),
        subtitle: Text(aciklama),
      ),
    );
  }

  mesajKutusu({required Color disRenk, required String svgName}) {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: disRenk),
      child: Center(
        child: SvgPicture.asset("assets/$svgName.svg"),
      ),
    );
  }
}
