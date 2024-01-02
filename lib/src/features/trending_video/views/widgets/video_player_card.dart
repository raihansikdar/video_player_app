import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/src/features/trending_video/models/video_player_model.dart';
import 'package:video_player_app/src/utility/custom_size_extension.dart';



class VideoPlayerCard extends StatefulWidget {
  const VideoPlayerCard({
    super.key,
    required this.resultData,
  });

  final Results resultData;

  @override
  State<VideoPlayerCard> createState() => _VideoPlayerCardState();
}

class _VideoPlayerCardState extends State<VideoPlayerCard> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(widget.resultData.manifest ?? ''),
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      elevation: 0,
      // color: Colors.white,
      // shape: const RoundedRectangleBorder(
      //   side: BorderSide(
      //     color: Colors.white,
      //     width: 1,
      //   ),
      //   borderRadius: BorderRadius.zero,
      // ),
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: SizedBox(
                  height: 250.rh,
                  width: double.infinity,
                  child: FlickVideoPlayer(
                    flickManager: flickManager,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 15,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black38,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.rSp),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
