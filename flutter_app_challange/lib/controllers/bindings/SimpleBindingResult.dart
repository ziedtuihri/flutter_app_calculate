import 'package:get/get.dart';
import '../ResultField.dart';

class SimpleBindingResult extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ResultField>(() => ResultField());
  }

}