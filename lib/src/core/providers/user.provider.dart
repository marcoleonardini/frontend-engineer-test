import 'package:flutter/foundation.dart';
import 'package:frontend_engineer_test/src/core/models/user.model.dart';

class UserProvider extends ChangeNotifier {
  User _user;

  void setUser(User user) {
    _user = user;
  }

  void unsetUser() {
    _user = User();
  }

  User get user => _user;
}
