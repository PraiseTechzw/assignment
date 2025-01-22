import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'video_player_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DreamOrbit Video Platform',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
        iconTheme: IconThemeData(color: Colors.amberAccent), // Bright accent color for icons
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold, color: Colors.white),
          titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white70),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white70),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
          accentColor: Colors.deepPurpleAccent,
        ).copyWith(
          secondary: Colors.pinkAccent, // Secondary accent color for highlights
          brightness: Brightness.dark, // Ensure the brightness matches
        ),
        appBarTheme: AppBarTheme(
          color: Colors.indigo[800], // Darker AppBar background
          elevation: 4, // Subtle shadow effect for AppBar
          iconTheme: IconThemeData(color: Colors.amberAccent), // Icons will use this color
          toolbarTextStyle: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: LoginScreen(),
      routes: {
        '/video': (context) => VideoPlayerScreen(),
      },
    );
  }
}
