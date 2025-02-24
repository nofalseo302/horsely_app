import 'package:get/get.dart';

class RatingController extends GetxController {
  var rating = 0.0.obs; // التقييم يبدأ من 0.0

  // دالة لتحديث التقييم
  void updateRating(double newRating) {
    rating.value = newRating;
  }
}
