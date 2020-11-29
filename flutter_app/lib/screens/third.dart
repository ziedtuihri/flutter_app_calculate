import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_app_calculate/controllers/SommeController.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(child: ThirdPageView()),
    );
  }
}

class ThirdPageView extends StatefulWidget {
  ThirdPageView({Key key}) : super(key: key);

  @override
  _ThirdPageViewState createState() => _ThirdPageViewState();
}

class _ThirdPageViewState extends State<ThirdPageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Third Page"),),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetX<SommeController>(
                builder: (_) {
                  return Center(
                    child: Text(
                      'Counter #1:   ${_.cont1.value}',
                       style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
              GetX<SommeController>(
                builder: (_) => 
                    Text(
                      'Counter #2:   ${_.cont2.value}',
                       style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
              ),
              SizedBox(
              height: 40,
            ),
             RaisedButton(
              child: Text("Increment Counter #1"),
              onPressed: () {
                Get.find<SommeController>().increment();
              },
            ),
              RaisedButton(
              child: Text("Increment Counter #2"),
              onPressed: () {
                Get.find<SommeController>().increment2();
              },
            ),
             RaisedButton(
              child: Text("Store Values"),
              onPressed: () {
                GetStorage box = GetStorage();
                box.write("cont1", Get.find<SommeController>().cont1.value);
                box.write("cont2", Get.find<SommeController>().cont2.value);
              },
            ),
            GetX<SommeController>(builder: (_) {
              print("sum rebuild");
              return Container(
                width: Get.width *0.5,
                height: Get.height*0.2,
                child: Text(
                  'Sum:                 ${_.sum}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            }),
            ],
          ),
        ),
      ),
    );
  }
}