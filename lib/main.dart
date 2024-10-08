import 'package:buddy_application/utils/constants/colors.dart';
import 'package:buddy_application/utils/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

  // Todo: Add Widgets Binding
  // Todo: Init Local Storage
  // Todo: Await Native Splash
  // Todo: Initialise Firebase
  // Todo: Intialise Authentication


  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

// import 'package:buddy_application/eish/tester.dart';
// import 'package:buddy_application/eish/splash.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/splash',
//       routes: {
//         '/splash': (context) => const SplashScreen(),
//         '/home': (context) => const MyHomePage(
//               title: 'Home Page',
//             ),
//         // Add other routes for your app screens here
//       },
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(
//             seedColor: const Color.fromRGBO(117, 169, 85, 1.0)),
//         useMaterial3: true,
//       ),
//       home: const SplashScreen(),
//     );
//   }

//   ThemeData _buildTheme(brightness) {
//     var bodyTheme = ThemeData(brightness: brightness);
//     var titleTheme = ThemeData(brightness: brightness);

//     return bodyTheme.copyWith(
//         textTheme: GoogleFonts.interTextTheme(bodyTheme.textTheme).copyWith(
//           bodyLarge: const TextStyle(fontSize: 16, color: Colors.white),
//           bodySmall: const TextStyle(fontSize: 16, color: Colors.white),
//         ),
//         primaryTextTheme: GoogleFonts.abhayaLibreTextTheme(titleTheme.textTheme)
//             .copyWith(
//                 displayLarge:
//                     const TextStyle(fontSize: 32, color: Colors.white)));
//   }
// }
