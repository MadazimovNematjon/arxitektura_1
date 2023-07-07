import 'package:arxitektura_1/model/post.dart';
import 'package:arxitektura_1/viewmodel/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../views/item_of_post.dart';
import 'creata_data.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.apiPostList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("set state"),
      ),
      body: ChangeNotifierProvider(
        create: (context)=> homeViewModel,
        child:Consumer<HomeViewModel>(
          builder: (context,model,index) => Stack(
          children: [
            ListView.builder(
              itemCount: homeViewModel.items.length,
              itemBuilder: (context, index){
                Post post = homeViewModel.items[index];
                return itemPost(homeViewModel,post);
              }
            )
          ],
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, CreateData.id);
      },child: const Icon(Icons.add,color: Colors.white,)),
    );
  }
}
