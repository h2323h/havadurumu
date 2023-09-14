import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:havadurumu/assets/loading_screen.dart';
import 'anasayfa.dart';



void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hava Durumu',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        //  appBarTheme: AppBarTheme(
             // elevation: 4,
             // shape: RoundedRectangleBorder(
               // borderRadius: BorderRadius.only(
                 //   bottomRight: Radius.circular(25),
                  //  bottomLeft: Radius.circular(25)
             //   ),
            //  ),
            //  backgroundColor: Colors.black
         // )
      ),
      home: LoadingScreen(),
    );
  }
}