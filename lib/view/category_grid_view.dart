import 'package:flutter/material.dart';

import 'category_data.dart';

class CategoryGridView extends StatelessWidget{
  CategoryItem category;
  int index;
  Function onClickItem;
  CategoryGridView({required this.category,required this.index,required this.onClickItem});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClickItem(category);
      },
      child: Container(
        margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: category.categoryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(index%2==0?25:0),
                bottomRight: Radius.circular(index%2==0?0:25),
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
          child:Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(category.categoryImage),
                Text(category.categoryName,style: Theme.of(context).textTheme.headline5?.copyWith(color:Colors.white),)
              ],
            ),
          )
      ),
    );
  }
}
