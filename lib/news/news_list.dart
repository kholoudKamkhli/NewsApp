import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/news/NewsResponse.dart';
import 'package:news_app/news/news_item.dart';

import '../api/Source.dart';

class NewsList extends StatelessWidget{
  Source? source;
  NewsList({required this.source});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(sourceID:source?.id??""),
        builder: (buildContext,snapshot){
          if(snapshot.connectionState== ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }
          if(snapshot.hasData){
            if(snapshot.data?.status=='error'){
              return Center(child: Text("${snapshot.data?.message}"),);
            }
          }
          return ListView.builder(itemBuilder: (_,index){
            return NewsItem(article: snapshot.data?.articles?[index]);
              //Text("${snapshot.data?.articles?[index]?.title??""}");
          },itemCount: snapshot.data?.articles?.length??0,);
        },
      ),
    );
  }
}