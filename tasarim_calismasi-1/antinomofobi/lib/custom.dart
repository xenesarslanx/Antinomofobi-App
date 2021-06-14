import 'package:antinomofobi/app_s%C3%BCreleri.dart';
import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final String img;
  final double imgHeight;
  HeroImage({this.img, this.imgHeight});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: imgHeight,
      child: Image.asset(img),
    );
  }
}
class CustomButton extends StatelessWidget {
  final String btnText;
 // final Function btnFn;
  CustomButton({ this.btnText});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.green,
      child: Text('BAŞLA-->', style:Theme.of(context).textTheme.bodyText2,),
      onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ilkSayfa(),
        
       )
        )
    );
      
    
  }
}