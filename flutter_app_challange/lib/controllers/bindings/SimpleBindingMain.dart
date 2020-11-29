import 'package:get/get.dart';
import '../BmiField.dart';

class SimpleBindingMain extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<BmiField>(() => BmiField());
  }

}