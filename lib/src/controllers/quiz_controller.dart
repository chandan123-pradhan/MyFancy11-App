import 'dart:async';
import 'dart:developer';

import 'package:cricket_fantacy/src/dialogs/loadingDialog.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/models/get_quiz_by_category_api_response.dart';
import 'package:cricket_fantacy/src/models/get_quiz_category_api_response.dart';
import 'package:cricket_fantacy/src/models/get_quiz_details_api_response.dart';
import 'package:cricket_fantacy/src/models/get_quiz_my_list_api_response.dart';
import 'package:cricket_fantacy/src/models/get_wallet_api_response.dart';
import 'package:cricket_fantacy/src/networking/api_provider.dart';
import 'package:cricket_fantacy/src/networking/network_contant.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  GetQuizCategoryApiResponse? getQuizCategoryApiResponse;
  GetQuizByCategoryApiResponse? getQuizByCategoryApiResponse;
  QuizDetailsApiResponse? quizDetailsApiResponse;
  ApiProvider apiProvider = ApiProvider();
  double priceValue = 7.6;
  double defaultInvenstmentAmount = 0.0;
  double defaultReturnAmount = 0.0;
  Messages messages = Messages();
  // double defaultInvestmentQty = 0.0;
  double overAllStockQty = 0.0;
  int currentStockQty = 0;
  GetWalletApiResponse? getWalletApiResponse;
  GetQuizMyListApiResponse? getQuizMyListApiResponse;

  Future<void> getWalletApi() async {
    Map parameter = {};
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.Wallet_Url, bodyParams: parameter);
    print(response);
    getWalletApiResponse = GetWalletApiResponse.fromJson(response);

    update();
  }

  void getQuizCategory() async {
    try {
      // isFetchingData = true;
      // update();

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
      Map paramter = {'category_id': catId};
      //isFetchingData = true;
      // getQuizByCategoryApiResponse = null;
      // update();
      var response = await apiProvider.postAfterAuth(
          routeUrl: NetworkConstant.getQuizByCategory, bodyParams: paramter);
      getQuizByCategoryApiResponse =
          GetQuizByCategoryApiResponse.fromJson(response);
      update();
    } catch (e) {
      print(e);
    }
  }

  void getQuizListByMatchId(String matchId) async {
    try {
      Map paramter = {'match_id': matchId};
      //isFetchingData = true;
      getQuizByCategoryApiResponse = null;
      update();
      var response = await apiProvider.postAfterAuth(
          routeUrl: NetworkConstant.quizByMatchId, bodyParams: paramter);
      getQuizByCategoryApiResponse =
          GetQuizByCategoryApiResponse.fromJson(response);
      update();
    } catch (e) {
      print(e);
    }
  }

  void getQuizDetails(String quizId, flag) async {
    try {
      Map paramter = {'quiz_id': quizId};
      update();
      var response = await apiProvider.postAfterAuth(
          routeUrl: NetworkConstant.quizDetails, bodyParams: paramter);
      quizDetailsApiResponse = QuizDetailsApiResponse.fromJson(response);
      // debugger();
      update();
      calculateDefaultInvestmentAndReturns(flag);
    } catch (e) {
      print(e);
    }
  }

 

  void increaseOrDecrease(flag) {
    if (flag == 0) {
      //decrease operation
      //increase operation
      priceValue = (((priceValue * 10) - 1) / 10);
      update();
      print(priceValue);
    } else {
      //increase operation
      priceValue = (((priceValue * 10) + 1) / 10);
      update();
      print(priceValue);
    }
  }

  void calculateDefaultInvestmentAndReturns(flag) async {
    await getWalletApi();
    if (flag == 'yes') {
      overAllStockQty = (getWalletApiResponse!.data.depositWallet /
          double.parse(quizDetailsApiResponse!.data.option1));
      defaultInvenstmentAmount =
          overAllStockQty * double.parse(quizDetailsApiResponse!.data.option1);

      defaultReturnAmount =
          overAllStockQty * double.parse(quizDetailsApiResponse!.data.option2);

      // debugger();
    } else if (flag == 'no') {
      overAllStockQty = (getWalletApiResponse!.data.depositWallet /
          double.parse(quizDetailsApiResponse!.data.option2));
      defaultInvenstmentAmount =
          overAllStockQty * double.parse(quizDetailsApiResponse!.data.option2);
      defaultReturnAmount =
          overAllStockQty * double.parse(quizDetailsApiResponse!.data.option1);
    }
    currentStockQty = overAllStockQty.toInt();
    // debugger();
    update();
  }

  void changeQty(val, flag) {
    currentStockQty = val;
    update();
    if (flag == 'yes') {
      defaultInvenstmentAmount =
          currentStockQty * double.parse(quizDetailsApiResponse!.data.option1);

      defaultReturnAmount =
          currentStockQty * double.parse(quizDetailsApiResponse!.data.option2);

      // debugger();
    } else if (flag == 'no') {
      defaultInvenstmentAmount =
          currentStockQty * double.parse(quizDetailsApiResponse!.data.option2);
      defaultReturnAmount =
          currentStockQty * double.parse(quizDetailsApiResponse!.data.option1);
    }
    update();
  }

  Future<void> buyQuiz(quizId, flag, context) async {
    showLoaderDialog(context);
    Map parameter = {
      'quiz_id': quizId,
      'entry_free': defaultInvenstmentAmount.toString(),
      'qty': currentStockQty.toString(),
      'type': 'buy',
      'option': flag == 'yes'
          ? quizDetailsApiResponse!.data.option1
          : quizDetailsApiResponse!.data.option2
    };
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.buyQuiz, bodyParams: parameter);
    print(response);
    Navigator.pop(context);
    if (response['status'] == 200) {
      messages.showMsg(context: context, message: response['message']);
      Navigator.pop(context);
    } else {
      messages.showMsg(
          context: context,
          message: "Trade could't successfull, please try again!");
    }

    update();
  }

  void getMyPortfolioList() async {
    try {
      Map paramter = {'status': '1'};
      //isFetchingData = true;

      var response = await apiProvider.postAfterAuth(
          routeUrl: NetworkConstant.getMyQuizList, bodyParams: paramter);
      //  debugger();
      getQuizMyListApiResponse = GetQuizMyListApiResponse.fromJson(response);
      // debugger();
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> sellQuiz(MyQuizData myQuizData, context) async {
    showLoaderDialog(context);
    Map parameter = {
      'quiz_id': myQuizData.quizId,
      'amount': myQuizData.price,
      'qty': myQuizData.qty,
      'type': 'sell',
      'option': myQuizData.myOption
    };
    //  debugger();
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.sellQuiz, bodyParams: parameter);
    print(response);
    Navigator.pop(context);
    if (response['status'] == 200) {
      messages.showMsg(context: context, message: response['message']);
      getMyPortfolioList();
    } else {
      messages.showMsg(
          context: context,
          message: "Trade could't successfull, please try again!");
    }

    update();
  }
}