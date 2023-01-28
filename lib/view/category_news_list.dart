import 'package:flutter/material.dart';
import 'package:news_app/api/SourcesResponse.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/view/category_data.dart';
import 'package:news_app/view/category_tabs_widget.dart';

class CategoryNewsList extends StatelessWidget{
  CategoryItem category;
  CategoryNewsList({required this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SourcesResponse>(
        future: ApiManager.getSources(category.categoryID),
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
          return CategoryTabsWidget(sources: snapshot.data!.sources!);
        },
      ),
    );
  }
}