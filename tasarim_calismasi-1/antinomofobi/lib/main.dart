import 'package:antinomofobi/app_s%C3%BCreleri.dart';
import 'package:antinomofobi/custom.dart';
import 'package:antinomofobi/onboard.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

//import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(ilk()
  );
}
class ilk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  AnimatedSplashScreen(
        backgroundColor: Colors.black87,
        splash: Image.asset('lib/assets/logoEApp2.png'),
        nextScreen:MyApp(),
         splashIconSize: 400,
        splashTransition: SplashTransition.scaleTransition,
      ),
  
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    
    theme: ThemeData(
      textTheme: TextTheme(
        headline1: TextStyle(fontSize:40, fontWeight: FontWeight.bold, color: Colors.white),
        headline5: TextStyle(fontSize:14, fontWeight: FontWeight.bold, color: Colors.white60),
        bodyText1: TextStyle(fontSize:14, color: Colors.white),
        bodyText2: TextStyle(fontSize:20, color: Colors.white),

        
      )
    ),
      home: Scaffold(
    
 body:SafeArea(
    child: PageView.builder(
       itemCount: 2,
       itemBuilder: (BuildContext context, int index){
         OnboardingItem oi = OnboardingItems.loadOnboardingItem()[index];
         return Container(
           height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
           color:oi.color,
           padding: EdgeInsets.fromLTRB(20, 0, 20, 0),

        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          
          children: <Widget>[
            Column(
             // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                     child:Text('GEÇ', style: Theme.of(context).textTheme.headline5),
                  onPressed:() => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>ilkSayfa(),
                     //child:Text('GEÇ', style: Theme.of(context).textTheme.headline5),),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(child: Text('HOŞGELDİNİZ'),)
                ],
            ),
            HeroImage(
              img: oi.image, 
              imgHeight:MediaQuery.of(context).size.height*0.4,),
        
        Column(
          children: [
            Text(oi.title, style: Theme.of(context).textTheme.headline1,),
            SizedBox(height: 10,),
            Text(oi.subtitle, style: Theme.of(context).textTheme.bodyText1),
            SizedBox(height: 40),
   
          index == (2-1)?//2 sayfa sayısıdır
            CustomButton(btnText: 'BAŞLA-->', ) : Container()
          ],
        ),
        ],
        )
         );
       }
       
       ),
 )   
         
     ),
  );
  }
  }
 