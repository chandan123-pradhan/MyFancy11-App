import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/models/get_quiz_by_category_api_response.dart';
import 'package:cricket_fantacy/src/models/get_quiz_category_api_response.dart';
import 'package:cricket_fantacy/src/networking/api_provider.dart';
import 'package:cricket_fantacy/src/networking/network_contant.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  GetQuizCategoryApiResponse? getQuizCategoryApiResponse;
  GetQuizByCategoryApiResponse? getQuizByCategoryApiResponse;
  ApiProvider apiProvider = ApiProvider();

  void getQuizCategory() async {
    try {
      isFetchingData = true;
      update();
      var response = await apiProvider.postAfterAuth(
          routeUrl: NetworkConstant.getQuizCategory, bodyParams: {});
      getQuizCategoryApiResponse =
          GetQuizCategoryApiResponse.fromJson(response);
      isFetchingData = false;
      update();
      getQuizList(getQuizCategoryApiResponse!.data[0].categoryId.toString());
    } catch (e) {
      print(e);
    }
  }

  void getQuizList(String catId) async {
    try {
      Map paramter={
        'category_id':catId
      };
      //isFetchingData = true;
      getQuizByCategoryApiResponse=null;
      update();
      var response = await apiProvider.postAfterAuth(
          routeUrl: NetworkConstant.getQuizByCategory, bodyParams: paramter);
      getQuizByCategoryApiResponse =
          GetQuizByCategoryApiResponse.fromJson(response);
      update();
    } catch (e) {
      print(e);
    }
  }
}
