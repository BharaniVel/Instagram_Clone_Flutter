import 'package:flutter/material.dart';
import 'package:instagram_clone/auth/auth_options.dart';
import 'package:instagram_clone/models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final Authmethods _authmethods = Authmethods();
  User? get getUser => _user;

  Future<void> refreshUser() async {
    User user = await _authmethods.getUserdetails();
    _user = user;
    notifyListeners();
  }
}
