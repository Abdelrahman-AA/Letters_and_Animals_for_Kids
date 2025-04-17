import 'dart:developer';

import 'package:animals_v3/adi.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

bool toopen = false;

late double scc = AdSize.banner.width.toDouble();

class Adpanner extends StatefulWidget {
  const Adpanner({super.key});

  @override
  State<Adpanner> createState() => _AdpannerState();
}

class _AdpannerState extends State<Adpanner> {
  late BannerAd bannerAd;
  bool _isAdReady = false;
  final AdSize _adSize = AdSize.banner;
  void _creatpannerAd() {
    bannerAd = BannerAd(
      size: _adSize,
      adUnitId: adi.bannerAdUnitId,
      listener: BannerAdListener(onAdLoaded: (ad) {
        setState(() {
          _isAdReady = true;
          toopen = _isAdReady;
        });
      }, onAdFailedToLoad: (ad, error) {
        log('ad failed to load: ${error.message}');
        showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                backgroundColor: Color.fromARGB(255, 241, 225, 169).withOpacity(.85),
                content: Text(
                  "يرجى التأكد من الاتصال بشبكة الانترنت",
                  textAlign: TextAlign.center,
                ),
                contentTextStyle: TextStyle(color: Color.fromARGB(255, 4, 56, 6), fontSize: 17),
              );
            }));
        setState(() {});
      }),
      request: const AdRequest(),
    );
    bannerAd.load();
  }

  @override
  void initState() {
    super.initState();
    _creatpannerAd();

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isAdReady) {
      return Container(
        // color: Colors.red,
        // width: 500,
        // height: 40,
        width: _adSize.width.toDouble(),
        height: _adSize.height.toDouble(),
        child: AdWidget(
          ad: bannerAd,
        ),
        alignment: Alignment.topCenter,
      );
    }
    return Container();
  }
}
