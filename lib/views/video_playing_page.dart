import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/controllers/fetch_data_controller.dart';
import 'package:video_player_app/models/video_player_model.dart';
import 'package:video_player_app/views/widgets/video_player_card.dart';

class VideoPlayingPage extends StatelessWidget {
  const VideoPlayingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<FetchDataController>(
          builder: (_fetchDataController) {
            return Column(
              children: [
                VideoThumbnailCard(resultData: _fetchDataController.videoPlayerModel.results?.first ?? Results()),
              ],
            );
          }
        ),
      ),
    );
  }
}
