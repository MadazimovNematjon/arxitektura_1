import 'package:arxitektura_1/pages/post.dart';
import 'package:arxitektura_1/service/log.dart';
import 'package:arxitektura_1/service/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'creata_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> items = [];

  void _apiPostList() async {
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    LogService.w(response.toString());
    if(response != null){
    setState(() {
      items = Network.parsePostList(response);
    });
    }else{
      items = [];
    }
  }

  void _apiDelete(Post post)async{

    var respons = await Network.DEL(Network.API_DELETE+post.id.toString(), Network.paramsEmpty());
  setState(() {
    if(respons != null){
      _apiPostList();
    }
  });

  }

  void _apiEdit(Post post)async{
    var response = await Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    setState(() {
      _apiPostList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("set state"),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => itemPost(items[index]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, CreateData.id);
      },child: Icon(Icons.add,color: Colors.white,)),
    );
  }

  Widget itemPost(Post item) {
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
              _apiEdit(item);
            },
          ),
          children: [SlidableAction(
            onPressed: (BuildContext cxt) {
              _apiDelete(item);
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
            Text(item.title!.toUpperCase()),
            SizedBox(
              height: 5,
            ),
            Text(item.body ?? ""),
          ],
        ),
      ),
    );
  }
}
