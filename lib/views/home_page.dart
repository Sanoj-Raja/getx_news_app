import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/controllers/news_headline_controller.dart';
// import 'package:getx_news_app/models/news_info.dart';
// import 'package:getx_news_app/services/api_manager.dart';
import 'package:getx_news_app/widgets/app_appbar.dart';
import 'package:getx_news_app/widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  final newsHeadlineController = Get.put(NewsHeadlineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(),
        drawer: customAppDrawer(),
        // This is the way using FutureBuilder.
        // body: Center(
        //   child: FutureBuilder<News>(
        //     future: ApiManager.getData(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         var articles = snapshot.data.articles;
        //         return ListView.builder(
        //             itemCount: articles.length,
        //             itemBuilder: (context, index) {
        //               return Stack(children: [
        //                 Column(
        //                   children: [
        //                     Text('No.${index + 1} ${articles[index].title}',
        //                         style: TextStyle(
        //                             fontSize: 20, fontWeight: FontWeight.bold))
        //                   ],
        //                 )
        //               ]);
        //             });
        //       } else {
        //         return CircularProgressIndicator();
        //       }
        //     },
        //   ),
        // ));

        // This is the way using Obx and controller. Without Future Builder.
        body: Center(
            child: Obx(
          () => newsHeadlineController.isLoading.value
              // ? Text("Loading")
              ? CircularProgressIndicator()
              : newsHeadlineController.newsData[0] == null 
                  ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                        child: Text(
                        "Server Timeout. Unable to Fetch News Data. Try Again Later.",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  )
                  : ListView.builder(
                      itemCount:
                          newsHeadlineController.newsData[0].articles.length,
                      itemBuilder: (context, index) => Container(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 10, bottom: 14),
                        child: Column(
                          children: [
                            newsHeadlineController.newsData[0].articles[index]
                                        .urlToImage !=
                                    null
                                ? Image.network(
                                    '${newsHeadlineController.newsData[0].articles[index].urlToImage}')
                                : Image.asset('assets/image_not_found.png'),
                            const SizedBox(height: 8),
                            Text(
                                '${newsHeadlineController.newsData[0].articles[index].title}',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Text(
                                '${newsHeadlineController.newsData[0].articles[index].description}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300)),
                            const SizedBox(height: 8),
                          ],
                        ),
                      )),
                    ),
        )));
  }
}
