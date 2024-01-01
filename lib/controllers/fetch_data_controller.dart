import 'dart:developer';

import 'package:get/get.dart';
import 'package:video_player_app/models/video_player_model.dart';
import 'package:video_player_app/services/network_caller.dart';
import 'package:video_player_app/services/network_response.dart';
import 'package:video_player_app/utility/urls.dart';

class FetchDataController extends GetxController{
  bool _isLoading = false;
  String _errorMessage = '';
  VideoPlayerModel _videoPlayerModel = VideoPlayerModel();

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  VideoPlayerModel get videoPlayerModel => _videoPlayerModel;

  @override
  onInit(){
     getData();
     super.onInit();
   }

  Future<bool>getData() async{
    _isLoading = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.trendingVideo);

    log("statusCode ==> ${response.statusCode}");
    log("body ==> ${response.body}");

    _isLoading = false;
    if(response.isSuccess){
      _videoPlayerModel = VideoPlayerModel.fromJson(response.body);
      update();
      return true;
    }else{
      _errorMessage = "Data can't fetch!";
      update();
      return false;
    }
  }
}