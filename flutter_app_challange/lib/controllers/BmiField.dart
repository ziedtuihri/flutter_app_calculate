import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BmiField extends GetxController {
  final age = 17.obs;
  final weight = 50.obs;

  final height = 180.obs;
  final name = "Zied Tuihri".obs;

  final headline = "Noraml".obs;
  final comment = "Good ".obs;

  @override
  void onInit() {
      GetStorage box = GetStorage();
      if(box.read("name") != null){
        name.value = box.read("name");
      }
  }
  setComment(String ch){
    comment.value = ch;
  }

  setHeadline(String ch){
    headline.value = ch;
  }

  setHeight(int sliderHeight){
    height.value = sliderHeight;
  }
  
  int get Height => height.value;

  int get Weight => weight.value;

  String get Name => name.value;

  ageIncrement() => age.value++;

  ageDecrement() => age.value--;

  weightIncrement() => weight.value++;

  weightDecrement() => weight.value--;
}