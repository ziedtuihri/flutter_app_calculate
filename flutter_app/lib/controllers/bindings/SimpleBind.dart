import 'package:get/get.dart';

import '../SommeController.dart';

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SommeController>(() => SommeController());
  }
}