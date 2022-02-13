// ignore_for_file: deprecated_member_use

import 'dart:developer';

import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:world4life/core/base/state/base_state.dart';
import 'package:world4life/core/base/view/base_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:world4life/view/homeLanding/subviews/add/viewmodel/add_viewmodel.dart';

class AddView extends StatefulWidget {
  AddView({Key? key}) : super(key: key);

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends BaseState<AddView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      onPageBuilder: (context) => _scaffold,
    );
  }

  Scaffold get _scaffold => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => AddViewModel(),
          builder: (_, a) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlineButton(
                    onPressed: _.watch<AddViewModel>().takePhoto,
                    child: const Text("ekle")),
                OutlineButton(
                    onPressed: _.watch<AddViewModel>().takePhoto,
                    child: const Text("resim"))
              ],
            ),
          ),
        ),
      );
}
