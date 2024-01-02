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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextComponent(
          text: "Trending Videos",
          color: AppColors.appTitleColor,
          fontSize: 20.rSp,
          fontFamily: 'Hind Siliguri',
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.rSp),
        child: GetBuilder<FetchDataController>(
          builder: (_fetchDataController) {
            if (_fetchDataController.isLoading && _fetchDataController.videoPlayerModel.results == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo is ScrollEndNotification &&
                    scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                  // Reached the end of the list, trigger pagination
                  _fetchDataController.getData();
                  return true;
                }
                return false;
              },
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: (_fetchDataController.videoPlayerModel.results?.length ?? 0) + 1,
                itemBuilder: (context, index) {
                  if (index < (_fetchDataController.videoPlayerModel.results?.length ?? 0)) {
                    return VideoThumbnailCard(
                      resultData: _fetchDataController.videoPlayerModel.results?[index] ?? Results(),
                    );
                  } else if (_fetchDataController.isLoading) {
                    // Display a loading indicator at the end of the list
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 8.rSp,),
                          SizedBox(
                            height: 24.rSp,
                            width: 24.rSp,
                            child: const CircularProgressIndicator(color: Colors.red),
                          ),
                          SizedBox(height: 8.rSp),
                          TextComponent(text: "Please wait",color: AppColors.subTitleColor, fontSize: 14.rSp,fontWeight: FontWeight.w600,),
                        ],
                      ),
                    );
                  }
                  else if (_fetchDataController.videoPlayerModel.results == null ||
                      _fetchDataController.videoPlayerModel.results!.isEmpty) {
                    // Display a message when there is no data
                    return const Center(child: Text("There is no data."));
                  } else {
                    // Display an empty container when not loading
                    return Container();
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}


/*class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextComponent(
          text: "Trending Videos",
          color: AppColors.appTitleColor,
          fontSize: 20.rSp,
          fontFamily: 'Hind Siliguri',
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.rSp),
        child: GetBuilder<FetchDataController>(
          builder: (_fetchDataController) {
            if (_fetchDataController.isLoading && _fetchDataController.videoPlayerModel.results == null) {
              // Display a loading indicator in the center
              return Center(child: CircularProgressIndicator());
            }

            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo is ScrollEndNotification &&
                    scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                  // Reached the end of the list, trigger pagination
                  _fetchDataController.getData();
                  return true;
                }
                return false;
              },
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: (_fetchDataController.videoPlayerModel.results?.length ?? 0) + 1,
                itemBuilder: (context, index) {
                  if (index < (_fetchDataController.videoPlayerModel.results?.length ?? 0)) {
                    // Display your VideoThumbnailCard
                    return VideoThumbnailCard(
                      resultData: _fetchDataController.videoPlayerModel.results?[index] ?? Results(),
                    );
                  } else if (_fetchDataController.isLoading) {
                    // Display a loading indicator at the end of the list
                    return Center(child: CircularProgressIndicator());
                  } else {
                    // Display an empty container when not loading
                    return Container();
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}*/