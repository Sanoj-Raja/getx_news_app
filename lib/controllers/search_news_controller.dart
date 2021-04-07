import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/models/news_info.dart';
import 'package:getx_news_app/services/api_manager.dart';

class SearchNewsController extends GetxController {
  List<News> searchedNewsData = <News>[].obs;
  RxBool isLoading = false.obs;
  final searchTextController = TextEditingController();

  @override
  void onInit() {
    searchTextController.addListener(() {
      if (searchTextController.text.length >= 2) {
        searchedNewsData = [];
        searchNewsHeadline();
      }
    });
    super.onInit();
  }

  void searchNewsHeadline() async {
    isLoading.toggle();
    News searchedNews =
        await ApiManager.getSearchedNews(searchTextController.text);
    searchedNewsData.add(searchedNews);
    isLoading.toggle();
    // Toggle just change the value of isLoading to false if it's true & vice-versa.
  }
}
