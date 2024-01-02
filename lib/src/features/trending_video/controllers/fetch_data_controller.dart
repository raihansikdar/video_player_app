// import 'dart:developer';
//
// import 'package:get/get.dart';
// import 'package:video_player_app/src/features/trending_video/models/video_player_model.dart';
// import 'package:video_player_app/src/services/network_caller.dart';
// import 'package:video_player_app/src/services/network_response.dart';
// import 'package:video_player_app/src/utility/api_url/urls.dart';
//
// class FetchDataController extends GetxController{
//   bool _isLoading = false;
//   String _errorMessage = '';
//   VideoPlayerModel _videoPlayerModel = VideoPlayerModel();
//
//   int _currentPage = 1; // Track the current page
//   int _pageSize = 10; // Set the page size according to your API
//
//
//   bool get isLoading => _isLoading;
//   String get errorMessage => _errorMessage;
//   VideoPlayerModel get videoPlayerModel => _videoPlayerModel;
//
//   @override
//   onInit(){
//      getData();
//      super.onInit();
//    }
//
//   Future<bool>getData() async{
//     _isLoading = true;
//     update();
//     NetworkResponse response = await NetworkCaller.getRequest(Urls.trendingVideo);
//
//     log("statusCode ==> ${response.statusCode}");
//     log("body ==> ${response.body}");
//
//     _isLoading = false;
//     if(response.isSuccess){
//       _videoPlayerModel = VideoPlayerModel.fromJson(response.body);
//       update();
//       return true;
//     }else{
//       _errorMessage = "Data can't fetch!";
//       update();
//       return false;
//     }
//   }
// }

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:video_player_app/src/features/trending_video/models/video_player_model.dart';
import 'package:video_player_app/src/services/network_caller.dart';
import 'package:video_player_app/src/services/network_response.dart';
import 'package:video_player_app/src/utility/api_url/urls.dart';

class FetchDataController extends GetxController {
  bool _isLoading = false;
  String _errorMessage = '';
  VideoPlayerModel _videoPlayerModel = VideoPlayerModel();

  int _currentPage = 1; // Track the current page

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  VideoPlayerModel get videoPlayerModel => _videoPlayerModel;

  @override
  onInit() {
    getData();
    super.onInit();
  }

  Future<bool> getData() async {
    if (_isLoading) return false;

    _isLoading = true;
    update();

    String url = Urls.trendingVideo(pageNo: _currentPage);
    log("Fetching data from: $url");

    NetworkResponse response = await NetworkCaller.getRequest(url);

    _isLoading = false;

    if (response.isSuccess) {
      VideoPlayerModel newModel = VideoPlayerModel.fromJson(response.body);

      log("Response status code: ${response.statusCode}");
      log(jsonEncode(response.body));

      if (newModel.results != null) {
        if (_videoPlayerModel.results == null) {
          _videoPlayerModel.results = [];
        }

        _videoPlayerModel.results!.addAll(newModel.results!);

        _currentPage++;
        log("Updated current page: $_currentPage");
        update();
        return true;
      } else {
        log("No results in the response.");
        return false;
      }
    } else {
      _errorMessage = "Data can't fetch! Status code: ${response.statusCode}";
      print(_errorMessage);
      update();
      return false;
    }
  }

}
