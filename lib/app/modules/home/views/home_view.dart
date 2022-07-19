import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idea_usher_task/app/data/components/idea_usher_rounded_container.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: kToolbarHeight, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            "Hi!"
                .text
                .size(32)
                .textStyle(GoogleFonts.nunito())
                .fontWeight(FontWeight.w700)
                .make(),
            40.heightBox,
            IuContainer(
                label1: "Steps",
                labelCount1: 13112,
                label2: "Goal",
                labelCount2: 15000,
                svgImage: 'assets/svg/ion_footsteps-sharp.svg'),
            32.heightBox,
            IuContainer(
                label1: "Calories Burned",
                labelCount1: 500,
                label2: "Goal",
                labelCount2: 1000,
                svgImage: 'assets/svg/kcal.svg'),
          ],
        ),
      ),
    );
  }
}
