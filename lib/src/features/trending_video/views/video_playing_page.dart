import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/src/features/trending_video/controllers/fetch_data_controller.dart';
import 'package:video_player_app/src/features/trending_video/models/video_player_model.dart';
import 'package:video_player_app/src/features/trending_video/views/widgets/custom_card..dart';
import 'package:video_player_app/src/features/trending_video/views/widgets/video_player_card.dart';
import 'package:video_player_app/src/utility/app_assets_path.dart';
import 'package:video_player_app/src/utility/app_colors.dart';
import 'package:video_player_app/src/utility/custom_size_extension.dart';
import 'package:video_player_app/src/utility/text_component.dart';

class VideoPlayingPage extends StatelessWidget {
  const VideoPlayingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<FetchDataController>(
          builder: (_fetchDataController) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VideoPlayerCard(resultData: _fetchDataController.videoPlayerModel.results?.first ?? Results()),
                  Padding(
                    padding: EdgeInsets.all(16.rSp),
                    child: TextComponent(
                      text: _fetchDataController.videoPlayerModel.results?.first.title ?? '',
                      color: AppColors.appTitleColor,
                      fontSize: 16.rSp,
                      fontFamily: 'Hind Siliguri',
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.rSp,right: 16.rSp,bottom: 16.rSp),
                    child: Row(
                      children: [
                        TextComponent(
                          text: "${_fetchDataController.videoPlayerModel.results?.first.viewers ?? '0'} views   .   ",
                          color: AppColors.subTitleColor,
                          fontSize: 15.rSp,
                          fontFamily: 'Hind Siliguri',
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                        ),
                        TextComponent(
                          text: " 3 days ago",
                          color: AppColors.subTitleColor,
                          fontSize: 15.rSp,
                          fontFamily: 'Hind Siliguri',
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                        ),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CustomCard(
                          text: 'MASH ALLAH (12k)',
                          image: AppAssetsPath.heartImagePNG,
                        ),

                        Expanded(
                          child: CustomCard(
                            text: 'LIKE (12k)',
                            image: AppAssetsPath.likeImagePNG,
                          ),
                        ),
                        Expanded(
                          child: CustomCard(
                            text: 'SHARE',
                            image: AppAssetsPath.shareImagePNG,
                          ),
                        ),
                        Expanded(
                          child: CustomCard(
                            text: 'REPORT',
                            image: AppAssetsPath.reportImagePNG,
                          ),
                        ),
                      ],
                    ),
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
                              image: NetworkImage(_fetchDataController.videoPlayerModel.results?.first.channelImage ?? ''),
                            ),
                            shape: const OvalBorder(),
                          ),
                        ),
                        SizedBox(
                          width: 10.rw,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextComponent(
                                text: _fetchDataController.videoPlayerModel.results?.first.channelName ?? '',
                                color: AppColors.appTitleColor,
                                fontSize: 15.rSp,
                                fontFamily: 'Hind Siliguri',
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                              SizedBox(height: 4.rSp,),
                              TextComponent(
                                text: "${_fetchDataController.videoPlayerModel.results?.first.channelSubscriber ?? ''} Subscribers",
                                color: AppColors.subTitleColor,
                                fontSize: 13.rSp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 1,
                              ),
                            ],
                          )
                        ),
                        const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.rSp))),
                        onPressed: () {},
                        child: TextComponent(
                          text: '+ Subscribe',
                          color: AppColors.whiteColor,
                          fontSize: 15.rSp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                    ),
                  ),
                  const Divider(
                      color: Color(0xFFE2E8F0),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.rSp),
                    child: Row(
                      children: [
                        TextComponent(
                          text: 'Comments   7.5K',
                          color: AppColors.subTitleColor,
                          fontSize: 14.rSp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        const Spacer(),
                       Image.asset(AppAssetsPath.arrowImagePNG)
                      ],
                    ),
                  ),
              
                  Padding(
                    padding:  EdgeInsets.only(left: 16.rSp,right: 16.rSp),
                    child: TextFormField(
                      decoration:  InputDecoration(
                        suffixIcon: GestureDetector(
                            onTap: (){},
                            child: Image.asset(AppAssetsPath.fieldArrowImagePNG,height: 20,)),
                        hintText: 'Add Comment',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.rSp),
                    child: Row(
                      children: [
                        Container(
                          width: 40.rw,
                          height: 50.rh,
                          decoration: const ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppAssetsPath.personImagePNG),
                            ),
                            shape: OvalBorder(),
                          ),
                        ),
                        SizedBox(
                          width: 10.rw,
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextComponent(
                                    text: "Fahmida khanom",
                                    color: AppColors.appTitleColor,
                                    fontSize: 15.rSp,
                                    fontFamily: 'Hind Siliguri',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                  ),
                                  SizedBox(width: 10.rw,),
                                  const TextComponent(
                                    text: "2 days ago",
                                    color: AppColors.subTitleColor,
                                    fontSize: 8,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 1,
                                  ),
                                ],
                              ),
                                SizedBox(height: 8.rSp,),
                                const TextComponent(
                                  text: "হুজুরের বক্তব্য গুলো ইংরেজি তে অনুবাদ করে সারা পৃথিবীর মানুষদের কে শুনিয়ে দিতে হবে। কথা গুলো খুব দামি",
                                  color:AppColors.commentColor,
                                  fontSize: 12,
                                  fontFamily: 'Hind Siliguri',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                ),
                              ],
                            )
                        ),
              
                      ],
                    ),
                  ),
              
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}


