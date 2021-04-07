import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/controllers/search_news_controller.dart';
import 'package:getx_news_app/widgets/app_appbar.dart';
import 'package:getx_news_app/widgets/app_drawer.dart';

class SearchPage extends StatelessWidget {
  final searchNewsController = Get.put(SearchNewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      drawer: customAppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: searchNewsController.searchTextController,
              decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
            ),
            Expanded(
                child: Obx(
              () => searchNewsController.isLoading.isTrue
                  ? Center(child: CircularProgressIndicator())
                  // If there is any search performed.
                  : searchNewsController.searchedNewsData.isEmpty
                      ? Center(
                          child: Text(
                          "Search News Headline. No Result Found.",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ))
                      : searchNewsController.searchedNewsData[0] == null
                          ? Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                  child: Text(
                                "Server Timeout. Unable to Fetch News Data. Try Again Later.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                            )
                          : ListView.builder(
                              itemCount: searchNewsController
                                  .searchedNewsData[0].articles.length,
                              itemBuilder: (context, index) => Container(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 10, bottom: 14),
                                child: Column(
                                  children: [
                                    searchNewsController.searchedNewsData[0]
                                                .articles[index].urlToImage !=
                                            null
                                        ? Image.network(
                                            '${searchNewsController.searchedNewsData[0].articles[index].urlToImage}')
                                        : Image.asset(
                                            'assets/image_not_found.png'),
                                    const SizedBox(height: 8),
                                    Text(
                                        '${searchNewsController.searchedNewsData[0].articles[index].title}',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 8),
                                    Text(
                                        '${searchNewsController.searchedNewsData[0].articles[index].description}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300)),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              )),
                            ),
            ))
          ],
        ),
      ),
    );
  }
}
