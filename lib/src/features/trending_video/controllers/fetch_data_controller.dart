import 'dart:developer';

import 'package:get/get.dart';
import 'package:video_player_app/src/features/trending_video/models/video_player_model.dart';
import 'package:video_player_app/src/services/network_caller.dart';
import 'package:video_player_app/src/services/network_response.dart';
import 'package:video_player_app/src/utility/api_url/urls.dart';

class FetchDataController extends GetxController {
  bool _isLoading = false;
  String _errorMessage = '';
  final VideoPlayerModel _videoPlayerModel = VideoPlayerModel();

  int _currentPage = 1;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  VideoPlayerModel get videoPlayerModel => _videoPlayerModel;

  @override
  onInit() {
    getData();
    super.onInit();
  }

  Future<bool> getData() async {
    // if (_isLoading) return false;

    _isLoading = true;
    update();

    NetworkResponse response = await NetworkCaller.getRequest(
        Urls.trendingVideo(pageNo: _currentPage));

    _isLoading = false;

    if (response.isSuccess) {
      VideoPlayerModel newModel = VideoPlayerModel.fromJson(response.body);

      if (newModel.results != null) {
        if (_videoPlayerModel.results == null) {
          _videoPlayerModel.results = [];
        }

        _videoPlayerModel.results!.addAll(newModel.results!);

        _currentPage++;
        update();
        return true;
      } else {
        log("No results in the response.");
        return false;
      }
    } else {
      _errorMessage = "Data can't fetch! Status code: ${response.statusCode}";
      log(_errorMessage);

      update();
      return false;
    }
  }
}
