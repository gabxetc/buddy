import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:buddy_application/eish/tester.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const MyHomePage(title: "My Home Page"),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: const Color.fromRGBO(117, 169, 85, 1.0),
          //     decoration: BoxDecoration(
          //         gradient: LinearGradient(
          //   colors: [Colors.blue, Colors.purple],
          //   begin: Alignment.bottomRight,
          //   end: Alignment.bottomLeft,
          // ))
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Buddy",
                  style: GoogleFonts.abhayaLibre(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Helping You, Help You",
                  style: GoogleFonts.inter(
                    textStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
