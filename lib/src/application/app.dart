import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/src/application/state_holder_binder.dart';
import 'package:video_player_app/src/features/trending_video/views/home_screen.dart';
import 'package:video_player_app/src/utility/custom_size_extension.dart';

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

        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(
              vertical: 4.rh, horizontal: 16.rh),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.rh),
            borderSide:  BorderSide(
                color: Colors.grey.withOpacity(0.2), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.rh),
            borderSide:  BorderSide(
                color:  Colors.grey.withOpacity(0.2), width: 2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.rh),
            borderSide: BorderSide(
                color:  Colors.grey.withOpacity(0.2), width: 2),
          ),
          hintStyle: TextStyle(
            fontSize:15.rSp,
            color: const Color(0xFFCBD5E0),
            fontWeight:FontWeight.w500,
            letterSpacing: 0.4,
          ),

        ),
        ),

      home: const HomeScreen(),
    );
  }
}