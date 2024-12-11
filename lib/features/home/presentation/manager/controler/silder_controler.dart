import 'package:get/get.dart';

class SliderController extends GetxController {
  // القيم الافتراضية للقيم الأدنى والأعلى
  var minValuePricesRating = 20.0.obs;
  var maxValuepricesRating = 80.0.obs;

  // تحديث القيم عند تحريك الـ Slider
  void updateValues(double newMin, double newMax) {
    minValuePricesRating.value = newMin;
    maxValuepricesRating.value = newMax;
  }

  //---------------------------------------------------Transaction Limits---------------------
  var minValuetranactionlimit = 20.0.obs;
  var maxValuetranactionlimit = 80.0.obs;

  // تحديث القيم عند تحريك الـ Slider
  void updateValuestranactionlimit(double newMin, double newMax) {
    minValuetranactionlimit.value = newMin;
    maxValuetranactionlimit.value = newMax;
  }
}
