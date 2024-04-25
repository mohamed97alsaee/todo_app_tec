import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/appIcon.png",
          width: 200,
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          "TODO APP TEC",
          style: TextStyle(
              fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),
        )
      ],
    )
            // Container(
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(400),
            //       gradient: const LinearGradient(
            //           begin: Alignment.topLeft,
            //           end: Alignment.bottomRight,
            //           colors: [Colors.green, Colors.yellow])),
            //   width: 300,
            //   height: 300,
            //   child: const Padding(
            //     padding: EdgeInsets.all(24.0),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           "AYA",
            // style: TextStyle(fontSize: 50, color: Colors.white70),
            //         ),
            //         Text(
            //           "GHOFRAN",
            //           style: TextStyle(fontSize: 50, color: Colors.white70),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            ));
  }
}
