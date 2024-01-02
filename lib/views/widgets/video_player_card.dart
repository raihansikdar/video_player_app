import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/models/video_player_model.dart';
import 'package:video_player_app/utility/custom_size_extension.dart';


class VideoThumbnailCard extends StatefulWidget {
  const VideoThumbnailCard({
    super.key,
    required this.resultData,
  });

  final Results resultData;

  @override
  State<VideoThumbnailCard> createState() => _VideoThumbnailCardState();
}

class _VideoThumbnailCardState extends State<VideoThumbnailCard> {
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
          Padding(
            padding: EdgeInsets.all(16.rSp),
            child: Text(
              widget.resultData.title ?? '',
              maxLines: 4,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: const Color(0xFF1A202C),
                fontSize: 15.rSp,
                fontFamily: 'Hind Siliguri',
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.rSp),
            child: Row(
              children: [
                Text(
                  "${widget.resultData.viewers ?? '0'} views   .   ",
                  style: const TextStyle(
                    color: Color(0xFF718096),
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.11,
                    letterSpacing: -0.26,
                  ),
                ),
                Text(
                  widget.resultData.dateAndTime ?? '',
                  style: const TextStyle(
                    color: Color(0xFF718096),
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.11,
                    letterSpacing: -0.26,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
