import 'package:flutter/foundation.dart';

import '../service/log.dart';

class UpdateViewModel extends ChangeNotifier{

  String title = '';
  String body = '';

  updateTitle(String value) {
    title = value;
    notifyListeners();
  }

  updateBody(String value) {
    body = value;
    notifyListeners();
  }

  updateData() {

    LogService.d(body);
    LogService.d(title);
    // Perform data creation logic here
    // You can access the title and body variables
    // to use the input values entered by the user
  }
}