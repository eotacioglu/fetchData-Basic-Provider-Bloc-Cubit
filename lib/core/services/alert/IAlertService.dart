import 'package:flutter/material.dart';

abstract class IAlertService {

  Future<void> showAlert(String? value, Color? color);
}
