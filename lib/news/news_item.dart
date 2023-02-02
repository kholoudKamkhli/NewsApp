import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/news/Articles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/Source.dart';

class NewsItem extends StatefulWidget{
  Articles ?article;

  NewsItem({required this.article});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  bool isvisible = false;

  @override
  Widget build(BuildContext context) {
    var publishedAt = DateTime.parse(widget.article?.publishedAt??"");
    return InkWell(
      onTap: (){
        setState(() {
          isvisible = !isvisible;
        });

      },
      child: Visibility(
        visible: isvisible,
        replacement: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
              //height: MediaQuery.of(context).size.height*0.3,
              width: double.infinity,
              child:
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: CachedNetworkImage(
                  imageUrl: widget.article?.urlToImage??"",
                  placeholder: (context, url) => Center(child:CircularProgressIndicator() ,),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),

              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
              color: Colors.transparent,
              child: Text(widget.article?.source?.name??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
              color: Colors.transparent,
              child: Text("${showPublishedAt(widget.article!)}",textAlign: TextAlign.end,style: TextStyle(
                color: Colors.black54
              ),),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
              color: Colors.transparent,
              child: Text(widget.article?.title??""),
            ),
            SizedBox(height: 18,)
          ],
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
              //height: MediaQuery.of(context).size.height*0.3,
              width: double.infinity,
                  child:
                      ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: CachedNetworkImage(
                          imageUrl: widget.article?.urlToImage??"",
                          placeholder: (context, url) => Center(child:CircularProgressIndicator() ,),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),

                      ),
                  ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
              color: Colors.transparent,
              child: Text(widget.article?.source?.name??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
  Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
        color: Colors.transparent,
    //widget.article?.publishedAt??""
        child: Text("${showPublishedAt(widget.article!)}",textAlign: TextAlign.end,style: TextStyle(
            color: Colors.black54
        ),),
  ),
  Container(
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
        color: Colors.transparent,
        child: Text(widget.article?.title??""),
  ),
  Container(
    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
    color: Colors.transparent,
    child: Text(widget.article?.description??""),
  ),
  InkWell(
    onTap: (){
      _launchUrl(Uri.parse("${widget.article?.url??""}"));
    },
    child: Container(
      margin: EdgeInsets.all(5),
      padding:EdgeInsets.all(3) ,
      child: Row(
        children: [
          Icon(Icons.arrow_right,size: 35,color: Colors.green,),
          Text("View Full article",style: TextStyle(fontSize: 18),),
        ],
      )
    ),
  ),

  SizedBox(height: 18,)
          ],
        ),
      ),
    );
  }
  Future<void> _launchUrl(Uri url) async {

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  showPublishedAt(Articles article){
    var dateTime = DateTime.now();
    var difference = dateTime.difference(DateTime.parse(article.publishedAt??"")).inMinutes;
    if(difference<0){
      difference = dateTime.difference(DateTime.parse(article.publishedAt??"")).inSeconds;
      return "${difference} seconds ago";
    }
    if(difference > 0 && difference <60){
      return "${difference} minutes ago";
    }
    if(difference>=60 && difference < (24*60)){
      difference = dateTime.difference(DateTime.parse(article.publishedAt??"")).inHours;
      return "${difference} hours ago";
    }
    else //difference = dateTime.difference(DateTime.parse(article.publishedAt??"")).inDays;
    return DateFormat.yMd().format(DateTime.parse(article.publishedAt??""));
  }
}