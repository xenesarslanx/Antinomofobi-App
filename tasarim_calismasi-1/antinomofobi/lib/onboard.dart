import 'package:flutter/material.dart';

class OnboardingItem{
  final String title;
  final String subtitle;
  final String image;
  final Color color;
 
const OnboardingItem({
  this.title, this.subtitle, this.image, this.color
});
}

class OnboardingItems{
  static List<OnboardingItem> loadOnboardingItem(){
    const fi = <OnboardingItem>[
      OnboardingItem(
        title: 'İlk Ekranınız',
        subtitle:"Bu Sayfada Uygulama Kullanım Sürelerini Saat/Dakika/Saniye Cinsinden Görebilceksiniz -->",
        image:"lib/assets/app.jpg",
        color:Colors.green
      ),
      OnboardingItem(
        title: 'Grafikler',
        subtitle:"Satır ve Pasta Grafiği Şeklinde Grafikler İle Uygulama Kullanım Sürelerini Görebilceksiniz",
        image:"lib/assets/grafiks.jpg",
        color:Colors.red
      ),
    ];
    return fi;
  }
}