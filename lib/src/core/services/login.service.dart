import 'package:frontend_engineer_test/src/core/models/user.model.dart';

class LoginService {
  Future<bool> login(User user) async {
    // Simula a la llamada http a un servicio de autenticación

    await Future.delayed(Duration(seconds: 3));
    if (user.username == 'admin' && user.password == 'admin2020')
      return Future.value(true);

    return Future.value(false);
  }
}
