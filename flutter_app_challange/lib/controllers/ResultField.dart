import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class ResultField extends GetxController {
  final headline = "Noraml".obs;
  final comment = "Good ".obs;


  setComment(String ch){
    comment.value = ch;
  }

  setHeadline(String ch){
    headline.value = ch;
  }
}





