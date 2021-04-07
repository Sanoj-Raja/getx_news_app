import 'package:get/get.dart';
import 'package:getx_news_app/models/news_info.dart';
import 'package:getx_news_app/services/api_manager.dart';

class NewsHeadlineController extends GetxController {
  List<News> newsData = <News>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    fetchNewsData();
    super.onInit();
  }

  void fetchNewsData() async {
    News fetchedNews = await ApiManager.getData();
    newsData.add(fetchedNews);
    isLoading.toggle();
    // Toggle just change the value of isLoading to false if it's true & vice-versa.
  }
}
