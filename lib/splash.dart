import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ytquran/index.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin{
late AnimationController animationController;
late Animation<Offset> slidingAnimation;



  @override
void initState(){
  super.initState();
initalAnimation();
Future.delayed(Duration(seconds: 2),(){
  Get.to(()=>IndexPage(),transition: Transition.downToUp);
});

}

  void initalAnimation() {
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 1));
    slidingAnimation=Tween(begin: Offset(0,7),end: Offset.zero).animate(animationController);
    
    animationController.forward();
    slidingAnimation.addListener(() {
      setState(() {
        
      });
    });
  }
@override
  void dispose() {
    super.dispose();
  animationController.dispose();    
  }
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/quran.png",fit: BoxFit.none,),
          const  SizedBox(height: 10,),
           SlideTransition(
             position: slidingAnimation,
             child: Text(" واجعله لي اماما ونورا ",style: TextStyle(
              color: const Color.fromARGB(255, 83, 43, 29),
              fontSize: 30.0,
              fontWeight: FontWeight.w400,
             ),
             textAlign: TextAlign.center,
             ),
           ),
      
          ],
        ),
      ),
    );
  }
}