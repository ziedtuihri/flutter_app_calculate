import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SecondPageView(),
    );
  }
}

class SecondPageView extends StatefulWidget {
  SecondPageView({Key key}) : super(key: key);

  @override
  _SecondPageViewState createState() => _SecondPageViewState();
}

class _SecondPageViewState extends State<SecondPageView> {
  GetStorage box = GetStorage();
  var arg = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text(arg.toString()),
              Text(box.read("email").toString()),
              Center(
                child: Container(
                  child: Center(
                    child: Row(
                      children: [
                        RaisedButton.icon(
                          textColor: Colors.white,
                          color: Colors.blueGrey,
                          onPressed: () {
                            // Respond to button press
                            box.erase();
                            Get.updateLocale(Get.deviceLocale);
                            Get.offAllNamed('/mainPage');
                          },
                          icon: Icon(Icons.chevron_left_rounded, size: 18),
                          label: Text("Back".tr),
                        ),
                        RaisedButton.icon(
                          textColor: Colors.white,
                          color: Colors.blueGrey,
                          onPressed: () {
                            // Respond to button press
                            Get.toNamed('/thirdPage');
                          },
                          icon: Icon(Icons.chevron_right_rounded, size: 18),
                          label: Text("next".tr),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}