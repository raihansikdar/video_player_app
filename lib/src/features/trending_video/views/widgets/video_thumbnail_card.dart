import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:video_player_app/src/features/trending_video/models/video_player_model.dart';
import 'package:video_player_app/src/features/trending_video/views/video_playing_page.dart';
import 'package:video_player_app/src/utility/app_colors.dart';
import 'package:video_player_app/src/utility/custom_size_extension.dart';
import 'package:video_player_app/src/utility/text_component.dart';

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
        color: AppColors.whiteColor,
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
                          child: TextComponent(
                        text: resultData.duration ?? '',
                        color: AppColors.whiteColor,
                        fontSize: 14.rSp,
                        fontFamily: 'Hind Siliguri',
                        fontWeight: FontWeight.w500,
                      )),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 16.rSp, right: 16.rSp, top: 16.rSp, bottom: 8.rSp),
              child: Row(
                children: [
                  Container(
                    width: 50.rSp,
                    height: 50.rSp,
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
                    child: TextComponent(
                      text: convertText(data: resultData.title ?? ''),
                      color: AppColors.appTitleColor,
                      fontSize: 16.rSp,
                      fontFamily: 'Hind Siliguri',
                      fontWeight: FontWeight.w600,
                      height: 1.2,
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
              padding:
                  EdgeInsets.only(left: 60.0, bottom: 26.rSp, right: 16.rSp),
              child: Row(
                children: [
                  TextComponent(
                    text: "${resultData.viewers ?? '0'} views   .   ",
                    color: AppColors.subTitleColor,
                    fontSize: 15.rSp,
                    fontFamily: 'Hind Siliguri',
                    fontWeight: FontWeight.w400,
                  ),
                  TextComponent(
                    text: resultData.dateAndTime ?? '',
                    color: AppColors.subTitleColor,
                    fontSize: 15.rSp,
                    fontFamily: 'Hind Siliguri',
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  // dynamic convertText({required var data}){
  //   var unescape = HtmlUnescape();
  //   var document = parse(utf8.decode(data.codeUnits));
  //   String parsedString = unescape.convert(document.body?.text ?? '');
  //   return parsedString;
  // }
}
