import 'package:flutter/material.dart';

class SourceTabItem extends StatelessWidget{
  String name;
  bool isSelected;
  SourceTabItem({required this.name,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7,horizontal: 1),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Theme.of(context).primaryColor,width: 1),
        color: isSelected?Theme.of(context).primaryColor:Colors.transparent,
      ),
      child:Center(child: Text(name,style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: !isSelected?Theme.of(context).primaryColor:Colors.white,
      )),) ,
    );
  }
}