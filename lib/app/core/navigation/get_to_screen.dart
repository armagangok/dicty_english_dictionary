import 'package:flutter/material.dart';
import 'package:get/get.dart';

final Navigation navigation = Navigation();

class Navigation {
  void getTo(Widget routeName) {
    Get.to(() => routeName);
  }
}
