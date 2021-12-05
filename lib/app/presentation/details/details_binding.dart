import 'package:get/get.dart';

import 'details_controller.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(
      () => DetailsController(),
    );
  }
}
