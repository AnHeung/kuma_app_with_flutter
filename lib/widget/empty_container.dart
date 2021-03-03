import 'package:flutter/material.dart';

class EmptyContainer extends StatelessWidget {

  String title;
  double size;

  EmptyContainer({this.title, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: size,
      height: size,
      child: Center(
        child: Text(title , style: TextStyle(fontSize: 20.0 ,color: Colors.grey ,fontWeight: FontWeight.bold),),
      ),
    );
  }
}