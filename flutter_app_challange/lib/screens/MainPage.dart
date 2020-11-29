import 'package:flutter/material.dart';
import 'package:flutter_app_challange/utils/theame.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_app_challange/controllers/BmiField.dart';
import 'package:flutter_app_challange/screens/ResultPage.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color:secondary,
          child: Column(
            children: <Widget>[
              AppBar(
                title: Text("BMI "),
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: primary
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/male.png',height: 100.0,width: 100.0,),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('MALE',style: headlines)
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: primary
                  ),
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/female.png',height: 100.0,width: 100.0,),
                      SizedBox(
                        height: 20.0,
                      ),
                          Text('FEMALE',style: headlines)
                    ],
                  ),
                    ),
              )
            ],
          ),

          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(10.0),
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: primary
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Text('HEIGHT',style: headlines),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GetX<BmiField>(
                            builder: (_) {
                              return Center(
                                child: Text(
                                  '${_.height.value}',
                                  style: boldNumber,
                              ),
                              );
                            },
                        ),
                  ),

                  Slider(
                      value: Get.find<BmiField>().Height.toDouble(),
                      min: 20,
                      max: 200,
                      activeColor: Colors.orangeAccent,
                      inactiveColor: Colors.black,
                      onChanged: ( double newValue) {
                        setState(() {
                          Get.find<BmiField>().setHeight(newValue.round());
                        });
                      },
                      semanticFormatterCallback: (double newValue) {
                        return '$newValue.round()';
                      }
                  )
                ],
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color:primary
                  ),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text('WEIGHT',style: headlines),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  GetX<BmiField>(
                          builder: (_) {
                            return Center(
                              child: Text(
                                '${_.weight.value}',
                                style: boldNumber,
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: Get.find<BmiField>().weightDecrement,
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.orangeAccent
                              ),
                              child: Center(
                                child: Text("-", style: secondaryButtonColorStyle,),
                              ),
                            ),
                          ),

                          Container(
                            height: 40.0,
                            width: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.orangeAccent
                            ),
                            child: InkWell(
                              onTap: Get.find<BmiField>().weightIncrement,
                              child: Center(
                                child: Text("+", style: secondaryButtonColorStyle,),
                              ),
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: primary
                  ),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text('AGE',style: headlines),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GetX<BmiField>(
                          builder: (_) {
                            return Center(
                              child: Text(
                                '${_.age.value}',
                                style: boldNumber,
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: Get.find<BmiField>().ageDecrement,
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.orangeAccent
                              ),
                              child: Center(
                                child: Text("-", style: secondaryButtonColorStyle,),
                              ),
                            ),
                          ),

                          Container(
                            height: 40.0,
                            width: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.orangeAccent
                            ),
                            child: InkWell(
                              onTap: Get.find<BmiField>().ageIncrement,
                              child: Center(
                                child: Text("+", style: secondaryButtonColorStyle,),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),

 

          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(height: Get.find<BmiField>().Height, weight: Get.find<BmiField>().Weight,))),
            child: Container(
              color: primaryButtonColor,
              margin: EdgeInsets.only(top: 10.0),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Center(
                child: Text('CALCULATE BMI', style: primaryButtonStyle),
              ),
            ),
          ),


        ],
      ),


    ),
      ),
    );
  }
}