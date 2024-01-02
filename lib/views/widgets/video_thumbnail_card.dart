import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/models/video_player_model.dart';
import 'package:video_player_app/utility/custom_size_extension.dart';
import 'package:video_player_app/views/video_playing_page.dart';

class VideoThumbnailCard extends StatelessWidget {
  const VideoThumbnailCard({
    super.key,
    required this.resultData,
  });

  final Results resultData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const VideoPlayingPage());
      },
      child: Card(
        borderOnForeground: true,
        elevation: 1,
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.zero,
        ),
        margin: EdgeInsets.zero,
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    resultData.thumbnail ?? '',
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.error),
                      );
                    },
                  ),
                ),
                Positioned(
                    bottom: 10.rSp,
                    right: 10.rSp,
                    child: Container(
                      height: 20.rh,
                      width: 40.rw,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.rSp)),
                      child: Center(
                        child: Text(
                          resultData.duration ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0.12,
                            letterSpacing: -0.24,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.rSp),
              child: Row(
                children: [
                  Container(
                    width: 50.rw,
                    height: 60.rh,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(resultData.channelImage ?? ''),
                        fit: BoxFit.cover,
                      ),
                      shape: const OvalBorder(),
                    ),
                  ),
                  SizedBox(
                    width: 10.rw,
                  ),
                  Expanded(
                    child: Text(
                      /* 'আরব নেতাদের যে ভুলে ফি*লি*স্তি*নের এই দুর্দাশা | আবু ত্বহা মুহাম্মদ আদনান',*/
                      resultData.title ?? '',
                      maxLines: 4,
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
                  SizedBox(
                    width: 10.rw,
                  ),
                  const Icon(Icons.more_vert)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 76.rSp, bottom: 26.rSp, right: 16.rSp),
              child: Row(
                children: [
                  Text(
                    "${resultData.viewers ?? '0'} views   .   ",
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
                    resultData.dateAndTime ?? '',
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
      ),
    );
  }
}
