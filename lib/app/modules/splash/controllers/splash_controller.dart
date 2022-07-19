import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {

  late AnimationController animationController1;
  late Animation<Offset> offset;
  AnimationController? animationController2;
  AnimationController? animationController3;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    offset = Tween<Offset>(end: Offset(0.0, 3.0), begin: Offset.zero).animate(
        CurvedAnimation(parent: animationController1, curve: Curves.easeInOut));
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
