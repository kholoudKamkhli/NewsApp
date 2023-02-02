import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/news/search_screen.dart';
import 'package:news_app/view/category_data.dart';
import 'package:news_app/view/category_grid_view.dart';
import 'package:news_app/view/category_news_list.dart';

class HomeView extends StatefulWidget{

  static const String routeName = "HomeView";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryItem> categories = [
    CategoryItem(categoryName: "Sports",
        categoryID: "sports",
        categoryImage: "assets/images/sports.png",
        categoryColor: Colors.red),
    CategoryItem(categoryName: "Politics",
        categoryID: "general",
        categoryImage: "assets/images/Politics.png",
        categoryColor: Colors.deepPurple),
    CategoryItem(categoryName: "Health",
        categoryID: "health",
        categoryImage: "assets/images/health.png",
        categoryColor: Colors.pinkAccent),
    CategoryItem(categoryName: "Business",
        categoryID: "business",
        categoryImage: "assets/images/bussines.png",
        categoryColor: Colors.amber),
    CategoryItem(categoryName: "Entertainment",
        categoryID: "entertainment",
        categoryImage: "assets/images/environment.png",
        categoryColor: Colors.lightBlueAccent),
    CategoryItem(categoryName: "Science",
        categoryID: "science",
        categoryImage: "assets/images/science.png",
        categoryColor: Colors.tealAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title:  Text(selectedCategory==null?"News App":selectedCategory!.categoryName),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35)
          )
        ),
        actions: [
          selectedCategory!=null?InkWell(
            onTap: (){
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 9.0),
              child: Icon(Icons.search,size: 22,),
            ),
          ):SizedBox(),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.20,
              width: double.infinity,
              color: Colors.green,
              child: const Center(
                child:
                Text("News App!",style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            GestureDetector(
              onTap: (){
                selectedCategory = null;
                Navigator.popAndPushNamed(context, HomeView.routeName);
              },
              child: Row(
                children:  [
                   Container(
                     padding: const EdgeInsets.only(left: 10,right:3),
                       child: const Icon(Icons.list,size: 24,)),
                    Text("Categories",style: Theme.of(context).textTheme.headline5!,),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){},
              child: Row(
                children:  [
                  Container(
                      padding: const EdgeInsets.only(left: 10,right: 3),
                      child: const Icon(Icons.settings,size: 24,)),
                   Text("Settings",style: Theme.of(context).textTheme.headline5!,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: selectedCategory==null?Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(18),

              ),
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child: Text("Pick up your favourite category",style: Theme.of(context).textTheme.headline5!,),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 6/7,
                  ),
                itemBuilder: (context,index)=>CategoryGridView(
                    category: categories[index], index: index,
                    onClickItem: onClick,
                ),
                itemCount: categories.length,
              ),
            )
          ],
        ),
      ):CategoryNewsList(category: selectedCategory!),
    );

  }

  CategoryItem ?selectedCategory = null;

  onClick(CategoryItem category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
