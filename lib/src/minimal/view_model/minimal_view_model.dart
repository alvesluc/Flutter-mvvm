
import 'package:flutter/material.dart';

import '../models/minimal_user_model.dart';
import '../state/minimal_state.dart';

// TODO: ValueNotifierRefactor
class MinimalViewModel extends ChangeNotifier {
  MinimalViewModel(this._state);

  final _user = MinimalUser();
  final MinimalState _state;
  MinimalState get state => _state;

  void setEmail(String value) {
    _user.email = value;
    if (_isAValidUser) notifyListeners();
  }

  void setPassword(String value) {
    _user.password = value;
    if (_isAValidUser) notifyListeners();
  }

  bool get _isAValidUser => _user.email.isNotEmpty && _user.password.isNotEmpty;
  bool get canLogin => !state.isLoading && _isAValidUser;

  void login() {
    if (_state.isLoading) return;
    if (!_isAValidUser) return;

    _state.isLoading = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _state.isLoading = false;
      _state.message = "Logged!";
      notifyListeners();
    });
  }
}
