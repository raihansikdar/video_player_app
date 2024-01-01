import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/application/state_holder_binder.dart';
import 'package:video_player_app/utility/custom_size_extension.dart';
import 'package:video_player_app/views/home_screen.dart';

class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: StateHolderBinder(),
      title: 'Video Player App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}