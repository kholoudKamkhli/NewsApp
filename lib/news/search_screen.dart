import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';

import 'Articles.dart';
import 'news_item.dart';
import 'news_list.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "Search screen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = "";
  List<Articles>listArticles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: SizedBox(),
        centerTitle: true,
        title: Container(
          height: 45,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            onChanged: (String value){
              setState(() {
                query = value;
              });
            },
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close,color: Colors.green,),
              ),
              suffixIcon: IconButton(
                onPressed: (){},
                icon: Icon(Icons.search,color: Colors.green,),
              ),
              hintText: "Search...",
              hintStyle: TextStyle(
              ),
              contentPadding: EdgeInsets.only(top: 10),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.white)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white)
              )
            ),

          ),
        ),
        backgroundColor: Colors.green,
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35)
            )
        ),

      ),
      body: ListView.builder(itemBuilder: (_,index){
        return NewsItem(article: search().elementAt(index));
      },itemCount: search().length,),
    );
  }

  List search(){
    ApiManager.getNews(q: query).then((value){
      listArticles = value.articles??[];
    }).catchError((onError){
      debugPrint("error occured");
      });
    return listArticles;
  }
}
