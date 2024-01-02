import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/controllers/fetch_data_controller.dart';
import 'package:video_player_app/models/video_player_model.dart';
import 'package:video_player_app/utility/custom_size_extension.dart';
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

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Card(
                        child: Padding(
                          padding:  EdgeInsets.only(top: 8.rSp,left: 8..rSp,right: 8.rSp,bottom: 16.rSp),
                          child: const Center(
                            child: Column(
                              children: [
                                Icon(Icons.heart_broken),
                                Text(
                                  'MASH ALLAH (12k)',
                                  style: TextStyle(
                                    color: Color(0xFF718096),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0.14,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(

                        child: Padding(
                          padding:  EdgeInsets.only(top: 8.rSp,left: 8..rSp,right: 8.rSp,bottom: 16.rSp),
                          child: const Center(
                            child: Column(
                              children: [
                                Icon(Icons.subdirectory_arrow_right),

                                Text(
                                  'LIKE (12k)',
                                  style: TextStyle(
                                    color: Color(0xFF718096),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0.14,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(

                        child: Padding(
                          padding:  EdgeInsets.only(top: 8.rSp,left: 8..rSp,right: 8.rSp,bottom: 16.rSp),
                          child: const Center(
                            child: Column(
                              children: [
                                Icon(Icons.share),
                                Text(
                                  'SHARE',
                                  style: TextStyle(
                                    color: Color(0xFF718096),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0.14,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(

                        child: Padding(
                          padding:  EdgeInsets.only(top: 8.rSp,left: 8..rSp,right: 8.rSp,bottom: 16.rSp),
                          child: const Center(
                            child: Column(
                              children: [
                                Icon(Icons.flag),
                                Text(
                                  'REPORT',
                                  style: TextStyle(
                                    color: Color(0xFF718096),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0.14,
                                  ),
                                )
                              ],
                            ),
                          ),
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
                        width: 40.rw,
                        height: 40.rh,
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
                            Text(
                              _fetchDataController.videoPlayerModel.results?.first.channelName ?? '',
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
                            SizedBox(height: 4.rSp,),
                            Text(
                              "${_fetchDataController.videoPlayerModel.results?.first.channelSubscriber ?? ''} Subscribers",
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xFF718096),
                                fontSize: 11,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 1,
                                letterSpacing: 0.22,
                              ),
                            ),
                          ],
                        )
                      ),
                      const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.rSp)
                          )
                        ),
                          onPressed: (){},
                          child: const Text(
                            '+ Subscribe',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.12,
                              letterSpacing: -0.24,
                            ),
                          ),),
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
                      const Text(
                        'Comments   7.5K',
                        style: TextStyle(
                          color: Color(0xFF718096),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0.12,
                        ),
                      ),
                      const Spacer(),
                     Image.asset("assets/images/arrow.png")
                    ],
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.only(left: 16.rSp,right: 16.rSp),
                  child: TextFormField(

                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 4.rh, horizontal: 16.rh),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.rh),
                        borderSide:  BorderSide(
                            color: Colors.grey.withOpacity(0.2), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.rh),
                        borderSide:  BorderSide(
                            color:  Colors.grey.withOpacity(0.2), width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.rh),
                        borderSide: BorderSide(
                            color:  Colors.grey.withOpacity(0.2), width: 2),
                      ),
                      hintStyle: TextStyle(
                        fontSize:15.rSp,
                        color: Color(0xFFCBD5E0),
                        fontWeight:FontWeight.w500,
                        letterSpacing: 0.4,
                      ),
                      suffixIcon: const Icon(Icons.search),
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
                        height: 40.rh,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Fahmida khanom",
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
                                SizedBox(width: 10.rw,),
                                Text(
                                  "2 days ago",
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xFF718096),
                                    fontSize: 8,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                              SizedBox(height: 8.rSp,),
                              Text(
                                "হুজুরের বক্তব্য গুলো ইংরেজি তে অনুবাদ করে সারা পৃথিবীর মানুষদের কে শুনিয়ে দিতে হবে। কথা গুলো খুব দামি",
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xFF4A5568),
                                  fontSize: 12,
                                  fontFamily: 'Hind Siliguri',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          )
                      ),

                    ],
                  ),
                ),

              ],
            );
          }
        ),
      ),
    );
  }
}
