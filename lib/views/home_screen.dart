import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/controllers/fetch_data_controller.dart';
import 'package:video_player_app/utility/custom_size_extension.dart';
import 'package:video_player_app/views/widgets/video_thumbnail_card.dart';

import '../models/video_player_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'Trending Videos',
          style: TextStyle(
            color: Color(0xFF1A202C),
            fontSize: 20.rSp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.rSp),
        child: GetBuilder<FetchDataController>(
          builder: (_fetchDataController) {
            if(_fetchDataController.isLoading){
              return Center(child: CircularProgressIndicator());
            }
            return ListView.separated(
              itemCount: _fetchDataController.videoPlayerModel.results?.length ?? 0,
              itemBuilder: (context, index) {
                return VideoThumbnailCard(resultData: _fetchDataController.videoPlayerModel.results?[index] ??  Results(),);
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
            );
          }
        ),
      ),
    );
  }
}


