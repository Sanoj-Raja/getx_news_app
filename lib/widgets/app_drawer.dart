import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/views/home_page.dart';
import 'package:getx_news_app/views/search_page.dart';

customAppDrawer() {
  return Drawer(
    child: ListView(
      children: [
        ListTile(
          title: Text('News Headlines'),
          onTap: () {
            Get.to(HomePage());
          },
          leading: Icon(Icons.contact_page_outlined),
        ),
        ListTile(
            title: Text('Search News'),
            onTap: () {
              Get.to(SearchPage());
            },
            leading: Icon(Icons.search)),
      ],
    ),
  );
}
