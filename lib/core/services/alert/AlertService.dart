import 'package:flutter/material.dart';
import 'package:getdata/core/services/alert/IAlertService.dart';
import 'package:getdata/core/services/global.dart';

class AlertService implements IAlertService {
  static final AlertService _instace = AlertService._init();
  static AlertService get instance => _instace;
  AlertService._init();

  @override
  Future<void> showAlert(String? value, Color? color) async {
    SnackBar snackBar = SnackBar(
      content: Text(value ?? ""),
      backgroundColor: color,
    );
    snackbarKey.currentState?.showSnackBar(snackBar);
  }
}
