import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world4life/core/base/state/base_state.dart';
import 'package:world4life/core/base/view/base_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(userRequired: true, onPageBuilder: (context) => _scaffold);
  }

  Scaffold get _scaffold => Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () async {
              SharedPreferences _pref = await SharedPreferences.getInstance();
             await _pref.remove("token");
            },
            child: Text("Çıkış Yap"),
          ),
        ),
      );
}
