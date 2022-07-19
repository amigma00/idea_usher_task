import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:idea_usher_task/app/modules/splash/views/animation.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Align(alignment: Alignment.center, child: MyStatefulWidget()),
    );
  }
}
