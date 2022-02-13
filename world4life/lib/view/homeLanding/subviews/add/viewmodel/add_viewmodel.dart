import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:world4life/core/init/locator.dart';
import 'package:world4life/product/models/response_model.dart';
import 'package:world4life/view/homeLanding/subviews/add/service/add_service.dart';

class AddViewModel extends ChangeNotifier {
  final AddService _addService = locator<AddService>();

  add() {}

  takePhoto() {
    final ImagePicker _picker = ImagePicker();
    _picker.pickImage(source: ImageSource.camera).then((value) {
      value?.saveTo(
          "/storage/emulated/0/Android/data/com.example.world4life/files/temp.png");
    });
  }

  AddViewModel();
}
