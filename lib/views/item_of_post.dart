import 'package:arxitektura_1/model/post.dart';
import 'package:arxitektura_1/viewmodel/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget itemPost( HomeViewModel homeViewModel, Post post) {
  return Slidable(
    startActionPane: ActionPane(
        motion: ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: (){

          },
        ),
        children: [SlidableAction(
          onPressed: (BuildContext cxt) {

          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.edit,
        )]
    ),
    endActionPane:  ActionPane(
        motion: ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: (){

          },
        ),
        children: [
          SlidableAction(
          onPressed: (BuildContext cxt) {
            homeViewModel.apiDelete(post).then((value) => {
              if(value) homeViewModel.apiPostList()
            });
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
        )]
    ),
    child: Container(
      padding: EdgeInsets.only(top: 10,left: 5,right: 5),
      child: Column(
        children: [
          Text(post.title!.toUpperCase()),
          SizedBox(
            height: 5,
          ),
          Text(post.body ?? ""),
        ],
      ),
    ),
  );
}