// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';

import '../model/post.dart';
import '../service/log.dart';
import '../service/network.dart';

class HomeViewModel extends ChangeNotifier {
  List<Post> items = [];


  Future apiPostList() async {
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    LogService.i(response.toString());
    if (response != null) {
      items = Network.parsePostList(response);
      notifyListeners();
    } else {
      items = [];
      notifyListeners();
    }
  }

  Future<bool> apiDelete(Post post) async {
    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    apiPostList();
    return response != null;
  }

  void apiUpdate(Post post) async {
    var response = await Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    apiPostList();
  }
}
