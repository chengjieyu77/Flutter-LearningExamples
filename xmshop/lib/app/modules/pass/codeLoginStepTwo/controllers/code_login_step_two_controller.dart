import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodeLoginStepTwoController extends GetxController {
  //TODO: Implement CodeLoginStepTwoController
  final StreamController<ErrorAnimationType>? errorAnimationController =
      StreamController();
  final TextEditingController editingController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
