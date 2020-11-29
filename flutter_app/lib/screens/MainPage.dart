import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Second.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainPageView();
  }
}

class MainPageView extends StatefulWidget {
  @override
  _MainPageViewState createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  final TextEditingController emailcontroller = TextEditingController();

  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    box.writeIfNull("email", "test email");
    print(box.read('email'));
    return Scaffold(
      appBar:
          AppBar(title: Text("title".trArgs([box.read('email').toString()]))),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () {
          // Respond to button press
          box.write("email", emailcontroller.text);
          Get.to(SecondPage() , arguments: "this argument");
        },
        icon: Icon(Icons.arrow_right_outlined),
        label: Text("next".tr),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              obscureText: false,
              controller: emailcontroller,
            ),
          ),
          RaisedButton(
            color: Colors.teal,
            textColor: Colors.deepOrange,
            child: Text("valide".tr),
            onPressed: () {
              GetUtils.isEmail(emailcontroller.text)
                  ? Get.snackbar("correct".tr, "formatgood".tr,
                      backgroundColor: Colors.green,
                      snackPosition: SnackPosition.BOTTOM)
                  : Get.snackbar(
                      "incorrect".tr,
                      "formatbad".tr,
                      backgroundColor: Colors.redAccent,
                      snackPosition: SnackPosition.TOP,
                    );
            },
          ),
          SizedBox(
            height: 40,
          ),
          RaisedButton.icon(
            textColor: Colors.white,
            color: Colors.blueGrey,
            onPressed: () {
              // Respond to button press
              Get.updateLocale(Locale('fr'));
            },
            icon: Icon(Icons.g_translate_outlined, size: 18),
            label: Text("Chenger FR "),
          ),
          SizedBox(
            height: 40,
          ),
          RaisedButton.icon(
            textColor: Colors.white,
            color: Colors.blueGrey,
            onPressed: () {
              // Respond to button press
              Get.updateLocale(Locale('en'));
            },
            icon: Icon(Icons.g_translate_outlined, size: 18),
            label: Text("Change English  "),
          ),
          SizedBox(
            height: 40,
          ),
          RaisedButton.icon(
            textColor: Colors.white,
            color: Colors.blueGrey,
            onPressed: () {
              // Respond to button press
              Get.updateLocale(Get.deviceLocale);
            },
            icon: Icon(Icons.g_translate_outlined, size: 18),
            label: Text("Change to Device language "),
          )
        ],
      ),
    );
  }
}