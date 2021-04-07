import 'package:getx_news_app/constants/Strings.dart';
import 'package:getx_news_app/models/news_info.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<News> getData() async {
    try {
      var response = await http.get(Uri.parse(Strings.url));
      var jsonString = response.body;
      if (response.statusCode == 200) {
        final news = newsFromJson(jsonString);
        return news;
      } else {
        return null;
      }
    } on Exception catch (e) {
      print('This is a custom Error line for fetched news: \n$e');
      return null;
    }
  }

  static Future<News> getSearchedNews(String query) async {
    try {
      var response = await http.get(Uri.parse(
          'https://newsapi.org/v2/everything?q=$query&from=2021-03-27&to=2021-03-27&sortBy=popularity&apiKey=65f612c8ad234b08ba8a71b4128bc84c'));
      var jsonString = response.body;
      if (response.statusCode == 200) {
        final news = newsFromJson(jsonString);
        return news;
      } else {
        return null;
      } 
    } on Exception catch (e) {
      print('This is a custom Error line for searched news: \n$e');
      return null;
    }
  }
}
