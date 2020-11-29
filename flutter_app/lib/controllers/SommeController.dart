import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SommeController extends GetxController {
  final cont1 = 0.obs;
  final cont2 = 0.obs;
  final name = 'Mouhamed Jihed'.obs; 

  @override
  void onInit() {
    GetStorage box = GetStorage();
    if (box.read("cont1") != null) {
      cont1.value = box.read("cont1");
      cont2.value = box.read("cont2");
    }
  }

  int get sum => cont1.value + cont2.value;
  increment() => cont1.value++;
  increment2() => cont2.value++;
}