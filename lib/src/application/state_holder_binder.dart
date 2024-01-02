import 'package:get/get.dart';
import 'package:video_player_app/src/features/trending_video/controllers/fetch_data_controller.dart';


class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(FetchDataController());
  }

}