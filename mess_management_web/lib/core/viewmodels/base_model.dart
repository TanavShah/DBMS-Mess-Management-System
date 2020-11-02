import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BaseModel extends ChangeNotifier {
  Status _status;

  bool get loading => _status == Status.LOADING;
  bool get completed => _status == Status.COMPLETED;
  bool get error => _status == Status.ERROR;

  String _errorText;

  String get errorText => _errorText;

  set errorText(String value) {
    _errorText = value;
    Fluttertoast.showToast(msg: _errorText);
  }

  set status(Status value) {
    _status = value;
    notifyListeners();
  }
}

enum Status { LOADING, COMPLETED, ERROR }
