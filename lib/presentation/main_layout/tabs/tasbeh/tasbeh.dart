import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../../core/resources/assets_manager.dart';

class Tasbeh extends StatefulWidget {
  const Tasbeh({super.key});

  @override
  State<Tasbeh> createState() => _TasbehState();
}

class _TasbehState extends State<Tasbeh> with TickerProviderStateMixin {

  int counter = 0;
  String zekr = "سبحان الله";
  bool isAnimating = false;

  // Animation controller
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isAnimating = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void incrementCounter() {
    setState(() {
      counter++;
      isAnimating = true;

      if (counter == 33) {
        zekr = "الحمد لله";
      } else if (counter == 66) {
        zekr = "الله أكبر";
      } else if (counter == 99) {
        zekr = "لا إله إلا الله";
      } else if (counter > 99) {
        counter = 0;
        zekr = "سبحان الله";
      }
    });


    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebhaBackgorund),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Image.asset(AssetsManager.islamiLogo),
          SizedBox(height: 8),
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
            style: TextStyle(
              color: Colors.white,
              fontSize: 45,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),


          GestureDetector(
            onTap: incrementCounter,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 27,
                  left: 195,
                  child: Image.asset(AssetsManager.headSebha,),
                ),

                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.rotate(
                        angle: _controller.value * (math.pi / 29),
                        child: Container(
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
                          child: Image.asset(AssetsManager.sebhaBody),
                        ),
                      );
                  },
                ),

                Positioned(
                  top: MediaQuery.of(context).size.height*0.23,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        Text(
                          zekr,
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                        Text(
                          '$counter',
                          style: TextStyle(color: Colors.white70, fontSize: 35),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}