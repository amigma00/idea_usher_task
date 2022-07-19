import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late final AnimationController present =
      AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
  late final Animation<double> _title = CurvedAnimation(
    parent: present,
    curve: Curves.easeIn,
  );

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  late final AnimationController _pin = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..animateTo(1, duration: const Duration(seconds: 1)).then((value) async {
      await _controller.forward();
      await present.forward();
      Future.delayed(Duration(seconds: 1), () {
        Get.offNamed('/home');
      });
    });
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.22, 0),
  ).animate(
    _pin,
  );
  // @override
  // void initState() {
  //   super.initState();
  //   _controller.forward();
  // }

  @override
  void dispose() {
    _pin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SlideTransition(
          position: _offsetAnimation,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/svg/pin.svg',
              height: 78,
            ),
          ),
        ),
        FadeTransition(
          opacity: _animation,
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: MediaQuery.of(context).platformBrightness == Brightness.light
                ? SvgPicture.asset(
                    'assets/svg/booz.svg',
                    height: 65,
                  )
                : SvgPicture.asset(
                    'assets/svg/booz_dark.svg',
                    height: 65,
                  ),
          ),
        ),
        FadeTransition(
          opacity: _title,
          child: Padding(
              padding: EdgeInsets.only(top: 130),
              child: "Fitness"
                  .text
                  .size(20)
                  .textStyle(GoogleFonts.nunito())
                  .make()),
        )
      ],
    );
  }
}
