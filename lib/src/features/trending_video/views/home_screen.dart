import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/src/features/trending_video/controllers/fetch_data_controller.dart';
import 'package:video_player_app/src/features/trending_video/views/widgets/video_thumbnail_card.dart';
import 'package:video_player_app/src/utility/app_colors.dart';
import 'package:video_player_app/src/utility/custom_size_extension.dart';
import 'package:video_player_app/src/utility/text_component.dart';


import '../models/video_player_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextComponent(
            text: "Trending Videos",
            color: AppColors.appTitleColor,
            fontSize: 20.rSp,
            fontFamily: 'Hind Siliguri',
            fontWeight: FontWeight.w700,
        )
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.rSp),
        child: GetBuilder<FetchDataController>(
          builder: (_fetchDataController) {
            if(_fetchDataController.isLoading){
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.separated(
              itemCount: _fetchDataController.videoPlayerModel.results?.length ?? 0,
              itemBuilder: (context, index) {
                return VideoThumbnailCard(resultData: _fetchDataController.videoPlayerModel.results?[index] ??  Results(),);
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 10.rSp,
              ),
            );
          }
        ),
      ),
    );
  }
}


