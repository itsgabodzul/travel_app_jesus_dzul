import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app_jesus_dzul/theme.dart';
import 'package:travel_app_jesus_dzul/feed_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ),
  );
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TravelTheme.theme,
      home: const FeedScreen(),
      );
  }
}


