import 'package:get/get.dart';

class CallSecondScreenController extends GetxController {
  /// Microphone active toggle
  RxBool isMicrophoneActive = true.obs;

  /// Speaker active toggle
  RxBool isSpeakerActive = false.obs;
}
