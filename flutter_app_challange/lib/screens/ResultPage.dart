import 'package:flutter/material.dart';
import 'package:flutter_app_challange/utils/theame.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_app_challange/controllers/ResultField.dart';


class ResultPage extends StatelessWidget {
  final int height;
  final int weight;

  ResultPage({this.height,this.weight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('YOUR RESULT'),
    
        backgroundColor: Colors.transparent,
        leading: IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context),),
      ),
      body: Result(this.height,this.weight),
    );
  }
}


class Result extends StatefulWidget {

 final int height;
 final int weight;

  Result(this.height,this.weight);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

  final controllerResult = Get.put(ResultField());
  //final Controller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    

    return Column(

      children: <Widget>[

        Expanded(

          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width *0.9,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: primary

            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GetX<ResultField>(
                  builder: (_) {
                    return Center(
                      child: Text(
                        '${controllerResult.headline.value}',
                        style: headlines,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('${bmiResult(this.widget.height, this.widget.weight)}', style: resultNumber),
                ),
                Column(
                  children: <Widget>[
                    Text('Normal BMI range:'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("18.5 - 25 kg/m",style: headlines,),
                ),
                  ],
                ),
                

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  GetX<ResultField>(
                    builder: (_) {
                      return Center(
                        child: Text(
                          '${controllerResult.comment.value}',
                          style: headlines,
                        ),
                      );
                    },
                  ),

                )
              ],
            ),
          ),        
        ),

        InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                color: primaryButtonColor,
                margin: EdgeInsets.only(top: 10.0),
                height: MediaQuery.of(context).size.height * 0.1,
                child: Center(
                  child: Text('RE-CALCULATE', style: primaryButtonStyle),
                  ),
             ),
           ),


      ],
    );
  }
}


bmiResult(h,w){

  double bmi = (w/(h*h)) * 10000;
  debugPrint("Message"+ w.toString() + "////" +h.toString() +"//** / " + bmi.toString());


  if(bmi<18.5){

    Get.find<ResultField>().setComment("You are under  Weight");
    Get.find<ResultField>().setHeadline("UNDERWEIGHT");

  }else if(bmi >= 18.5 && bmi <25){

    Get.find<ResultField>().setComment("You are at a  healthy weight.");
    Get.find<ResultField>().setHeadline("NORMAL");
  }else if(bmi > 25 && bmi <= 29.99){

    Get.find<ResultField>().setComment("You are at overweight.");
    Get.find<ResultField>().setHeadline("OVERWEIGHT");
  }else{

    Get.find<ResultField>().setComment("You are obese.");
    Get.find<ResultField>().setHeadline("OBESE");
  }

  return bmi.round();
}