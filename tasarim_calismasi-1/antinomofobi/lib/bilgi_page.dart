import 'package:flutter/material.dart';

class bilgi extends StatefulWidget {
  @override
  bilgiState createState() => bilgiState();
}

class bilgiState extends State<bilgi> {
    List<String> bilgiler = [
    'YATAK ODANIZA SOKMAYIN \n Yetişkinlerin üçte biri telefonlarını uyandıktan sonra geçen ilk 5 dakika içinde kontrol ediyor, yarısından fazlası ise ilk 15 dakika içinde. Yüzde 38’i ise geceleri telefonlarıyla ilgileniyor. Eğer hayatınızı kontrol altına almak istiyorsanız yatak odanıza telefonunuzu sokmayın.',
     'bilgi 2', 'bilgi 3',
  ];
  int index = 0;  

  @override
  Widget build(BuildContext context) {
       
     // for(i = 0; i < bilgiler.length; i++){
//print('${bilgiler[i]}');
   //   } 
   
    return MaterialApp(
        debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: AppBar(
    title: Text('Tavsiyelerimiz'),
    backgroundColor: Colors.pink.shade100,
        ),
        body: ColoredBox(
                  color: Colors.pink.shade50,
                  child: Column(         
    children:<Widget> [
      SizedBox(height: 100),
     /* ClipRRect(//containerı clipRRect yaptım
       borderRadius: BorderRadius.only(
    topRight:    Radius.circular(50.0),
    topLeft:     Radius.circular(90.0),
    bottomRight: Radius.circular(50.0),
    bottomLeft:  Radius.circular(10.0)
          ),*/
                     Container(      
                 margin: EdgeInsets.only(left: 10, top:100, right:10, bottom:60),
                   alignment: Alignment.bottomCenter,
                  color: Colors.pink.shade200,                             
                  width: double.infinity, height: 200,   
                  child:ClipRRect(
                    
                                      child: SingleChildScrollView(            
                    padding: EdgeInsets.only(left: 10, top:20, right:10, bottom:140),
                    child: Text('${bilgiler[index]}', textAlign: TextAlign.start,),
                    ),
                  ),
                    ),
  //    ),
SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton( 
                      style: ElevatedButton.styleFrom(
                      primary: Colors.orange.shade300,
                      onPrimary: Colors.white,
                    ),
                      child: Text('Önceki'),
                    onPressed: (){
                      setState(() {
                      index--;
                      if(index==-1){
                        index++;                          
                      }
                    });}),
                    SizedBox(width:100),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange.shade600,
                      onPrimary: Colors.white,
                    ),
                     child: Text('Sonraki'),
                    onPressed: (){
                      setState(() {
                      index++;
                      if(index==bilgiler.length){
                        index--;                          
                      }
                    });}
                     )
                ],)
    ],
          ),
        ),      
         
       /* ElevatedButton(
           child: Text('sonraki tavsiye'),
           
          onPressed:(){setState(() {
            i++;
           //  Text('${bilgiler[i]}');
          });}
           ),*/      
        ),
      );
    
  }
}

