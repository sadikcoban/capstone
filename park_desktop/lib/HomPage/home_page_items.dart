import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:park_desktop/StaticWidgets/renkler.dart';

class HomePageItems {
  setAvatar() {
    return Container(
      width: 60,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Text("SA",
              style: GoogleFonts.montserrat(
                  color: Colors.black, fontWeight: FontWeight.w500)),
        ),
      ),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
    );
  }

  getName() {
    return Container(
      width: 200,
      alignment: Alignment.centerLeft,
      child: Text(
        'Merhaba, Salih',
        style: GoogleFonts.montserrat(
          fontSize: 22.0,
          color: const Color(0xFF000B22),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  getTotalPrice() {
    return Container(
      width: 200,
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: 'Hesap Bakiyesi:',
          style: GoogleFonts.montserrat(
              color: const Color(0xFFB0B3BA), fontSize: 13),
          children: const <TextSpan>[
            TextSpan(
              text: '   +95.75 ₺',
              style: TextStyle(color: Color(0xff22E31B), fontSize: 13),
            )
          ],
        ),
      ),
    );
  }

  avatarCard() {
    return Center(
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: setAvatar(),
            ),
            Column(
              children: [
                getName(),
                getTotalPrice(),
              ],
            ),
            const SizedBox(),
            const Icon(
              Icons.more_vert,
              color: Color(0xff8F9BBC),
            ),
          ],
        ),
      ),
    );
  }

  getCampaigns(BuildContext context) {
    var padding = MediaQuery.of(context).size.width / 20;
    return Container(
      height: 180.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Renkler.morRenk,
            Renkler.morKapali,
          ],
        ),
        borderRadius: BorderRadius.circular(22.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 0),
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Arkadaşını Davet Et!',
                        style: GoogleFonts.montserrat(
                          fontSize: 17.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        """Arkadaşını davet edersen, onların, davet kodu ile sende belirli yerlerde indirim kazanabilirsin.Gerekli bilgileri almak için lütfen tıklayınız.""",
                        style: GoogleFonts.montserrat(
                          fontSize: 15.0,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  "icons/support.svg",
                  height: 60,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getInfo(String title, String desc, Color color) {
    return Container(
      width: 170.0,
      height: 95.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 125,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 120,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: 12.0,
                      color: const Color(0xFFB0B3BA),
                    ),
                  ),
                ),
                Container(
                  width: 120,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    desc,
                    style: GoogleFonts.montserrat(
                      fontSize: 18.0,
                      color: const Color(0xFF000B22),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  getInfoList() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getInfo('HESAP BAKİYESİ', '+95.75 ₺', const Color(0xff3E64FF)),
            getInfo("AYLIK SÜRE", "11.45 Saat", const Color(0xFFFE4A5E)),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getInfo("FAVORİM", "Kayseri Forum", const Color(0xffFF9401)),
            getInfo("FAVORİM", "Kayseri Forum", const Color(0xFF20D22C)),
          ],
        ),
      ],
    );
  }

  carIdentity() {
    return Container(
      height: 95.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "images/clio.png",
            height: 50,
          ),
          const SizedBox(),
          Container(
            width: 200,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 250,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Renault Clio (2018)',
                    maxLines: 2,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0,
                      color: const Color(0xFF000B22),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '39 SMA 0001',
                    style: GoogleFonts.montserrat(
                      fontSize: 12.0,
                      color: const Color(0xFFB0B3BA),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xff8F9BBC),
          ),
        ],
      ),
    );
  }
}
