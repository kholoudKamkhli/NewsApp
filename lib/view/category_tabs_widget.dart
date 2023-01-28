import 'package:flutter/material.dart';
import 'package:news_app/news/news_list.dart';
import 'package:news_app/view/source_tab_item.dart';

import '../api/Source.dart';

class CategoryTabsWidget extends StatefulWidget{
  List<Source>sources;

  CategoryTabsWidget({required this.sources});

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
          onTap: (index){
            setState(() {
              selectedIndex = index;
            });

          }
              ,tabs: widget.sources.map((e) => SourceTabItem(name:e.name??"",isSelected: selectedIndex == widget.sources.indexOf(e)?true:false,)).toList(),isScrollable: true,indicatorColor: Colors.transparent,),
            Expanded(child: NewsList(source: widget.sources[selectedIndex],))
          ],
        ),
      ),
    );
  }
}