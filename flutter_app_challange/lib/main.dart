import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_app_challange/screens/MainPage.dart';
import 'package:flutter_app_challange/screens/ResultPage.dart';
import 'package:flutter_app_challange/controllers/bindings/SimpleBindingMain.dart';
import 'package:flutter_app_challange/controllers/bindings/SimpleBindingResult.dart';

void main() async {
  await GetStorage.init();
    runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    initialRoute: '/mainPage',
    //theme: ThemeData(accentColor: Colors.teal,
    //primaryColor: Colors.blueAccent),
    getPages: [GetPage(name: '/mainPage', page: ()=> MainPage(),
      binding: SimpleBindingMain(),),
    GetPage(name: '/second', page: () => ResultPage(),
      binding: SimpleBindingResult(),)
    ],


  ));
}

