import 'package:flutter/material.dart';
import 'package:video_player_app/src/utility/app_colors.dart';
import 'package:video_player_app/src/utility/custom_size_extension.dart';
import 'package:video_player_app/src/utility/text_component.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.text,
    required this.image,
  });
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:  EdgeInsets.only(top: 8.rSp,left: 4.rSp,right: 4.rSp,bottom: 16.rSp),
        child: Center(
          child: Column(
            children: [
              Image.asset(image),
              SizedBox(height: 4.rSp,),
              TextComponent(
                text: text,
                color: AppColors.subTitleColor,
                fontSize: 14.rSp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              )
            ],
          ),
        ),
      ),
    );
  }
}