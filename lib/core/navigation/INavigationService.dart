import 'package:flutter/material.dart';

abstract class INavigationService {
  Future<void> navigateToPageNamed(String? path);
  Future<void> navigateToPageClear(String? path);
  Future<void> navigateToPageWidget(Widget? widget);
  Future<void> popContext();
}
