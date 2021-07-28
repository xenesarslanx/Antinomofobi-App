import 'package:firebase_admob/firebase_admob.dart';

class AdvertService {
  static final AdvertService _instance = AdvertService._internal();
  factory AdvertService() => _instance;
  MobileAdTargetingInfo _targetingInfo;
  final String _gecis = "ca-app-pub-5417429060364094/5128942409";
  final String _banner = "ca-app-pub-5417429060364094/1215911260";
  AdvertService._internal() {
    _targetingInfo = MobileAdTargetingInfo();
  }
  showBanner() {
    BannerAd banner = BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.smartBanner,
        targetingInfo: _targetingInfo);

    banner
      ..load()
      ..show();

    banner.dispose();
  }

  showIntersitial() {
    InterstitialAd interstitialAd =
        InterstitialAd(adUnitId: _gecis, targetingInfo: _targetingInfo);

    interstitialAd
      ..load()
      ..show(anchorOffset: 30);

    interstitialAd.dispose();
  }
}
