import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  User? _user;

  void updateUser(User user) {
    _user = user;
    notifyListeners();
  }

  User? get user => _user;

  UserModel();
}
