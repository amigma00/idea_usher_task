import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class IuContainer extends StatelessWidget {
  final Color? color;
  final String label1, label2, svgImage;
  final double labelCount1, labelCount2;
  final double borderRadius;
  const IuContainer(
      {Key? key,
      required this.label1,
      required this.labelCount1,
      required this.label2,
      required this.labelCount2,
      required this.svgImage,
      this.color,
      this.borderRadius = 24})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var x = NumberFormat('#,##,000');
    return Container(
      //width: Get.width,
      decoration: BoxDecoration(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Color(0xffF0F0F0)
              : Color(0xff323232),
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  "$label1: ${x.format(labelCount1)}"
                      .text
                      .size(16)
                      .textStyle(GoogleFonts.nunito())
                      .make(),
                  18.heightBox,
                  LinearPercentIndicator(
                    lineHeight: 16,
                    barRadius: Radius.circular(16),
                    percent: labelCount1 / labelCount2,
                    backgroundColor: Color(0xff8a8a8a),
                    progressColor: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    padding: EdgeInsets.zero,
                  ),
                  8.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "0"
                          .text
                          .size(10)
                          .textStyle(GoogleFonts.nunito())
                          .fontWeight(FontWeight.w500)
                          .make(),
                      "$label2: ${x.format(labelCount2)}"
                          .text
                          .size(10)
                          .textStyle(GoogleFonts.nunito())
                          .fontWeight(FontWeight.w500)
                          .make(),
                    ],
                  )
                ],
              ),
            ),
            20.widthBox,
            SvgPicture.asset(
              svgImage,
              height: 52,
              width: 52,
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
