import 'dart:async';

import 'package:covi19tracker/View/Word_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this)..repeat();


  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds:5 ),
      () => Navigator.push(context, MaterialPageRoute(
          builder: (context)=>wordStatesScreen()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            AnimatedBuilder(
                animation:_controller ,
                child: Container(
                  height: MediaQuery.of(context).size.height*.3,
                  width: MediaQuery.of(context).size.width*3,
                  child: const Center(
                    child: Image(image:AssetImage("assets/images/virus.png") ),),
                ),
                builder:(BuildContext context,Widget ? child){
                  return Transform.rotate(
                    angle: _controller.value *2.0* math.pi,
                    child: child,
                  );
                }),
            SizedBox(
              height:MediaQuery.of(context).size.height* .08
            ),
            Align(
              alignment: Alignment.center,
              child: Text('COVID-19\nTracher App',textAlign: TextAlign.center,style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white ),),
            )
          ],
        ),
      ),
    );
  }
}
