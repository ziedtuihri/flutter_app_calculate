import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_app_calculate/controllers/bindings/SimpleBind.dart';
import 'package:flutter_app_calculate/screens/MainPage.dart';
import 'package:flutter_app_calculate/utils/MyTranslation.dart';

import 'screens/third.dart';

void main() async {
    await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    initialRoute: '/mainPage',
    theme: ThemeData(accentColor: Colors.teal,
    primaryColor: Colors.blueAccent),
    defaultTransition: Transition.zoom,
    translations: MyTranslation(),
    //locale: Locale('fr'),
    locale : Get.deviceLocale ,
    fallbackLocale: Locale('fr'),
    getPages: [GetPage(name: '/mainPage', page: ()=> MainPage()),
    GetPage(name: '/thirdPage', page: () => ThirdPage(),
      binding: SampleBind(),
    )
    ],


  ));
}
