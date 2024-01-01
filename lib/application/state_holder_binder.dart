import 'package:get/get.dart';
import 'package:video_player_app/controllers/fetch_data_controller.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(FetchDataController());
  }

}