import 'package:arxitektura_1/service/log.dart';
import 'package:flutter/foundation.dart';

class CreateViewModel extends ChangeNotifier {
  String title = '';
  String body = '';

   createTitle(String value) {
    title = value;
    notifyListeners();
  }

   createBody(String value) {
    body = value;
    notifyListeners();
  }

  createData() {

     LogService.d(body);
     LogService.d(title);
    // Perform data creation logic here
    // You can access the title and body variables
    // to use the input values entered by the user
  }
}