import 'package:flutter/material.dart';
import 'package:video_player_app/utility/custom_size_extension.dart';
import 'package:video_player_app/views/home_screen.dart';

class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;

    return MaterialApp(
      title: 'Video Player App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}