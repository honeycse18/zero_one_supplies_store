import 'package:get/get.dart';

class PickupThirdScreenController extends GetxController {
  String selectedOption = '0';
  int counter = 0;

  void incrementCounter() {
    if (counter < 10) {
      // setState(() {
      counter++;
      // });
    }
  }

  void decrementCounter() {
    if (counter > 0) {
      // setState(() {
      counter--;
      // });
    }
  }
}
