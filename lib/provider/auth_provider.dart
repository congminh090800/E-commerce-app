import 'package:flutter/foundation.dart';
import 'package:lettutor/real_models/auth.dart';

class AuthProvider extends ChangeNotifier {
  static Auth _auth = Auth();
  Auth get auth => _auth;
  void setAuth(Auth auth) {
    _auth = auth;
    notifyListeners();
  }
}
