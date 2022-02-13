import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world4life/core/constants/routers.dart';
import "package:flutter/services.dart";
import 'package:world4life/core/init/theme/theme_management.dart';
import 'package:world4life/core/init/locator.dart';
import 'package:world4life/product/utility/userAuthentication/viewmodel/user_viewmodel.dart';

void main() {
  setupLocator();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => ChangeNotifierProvider(
        create: (context) => UserViewmodel(),
        lazy: false,
        child: MaterialApp(
            theme: themeData,
            debugShowCheckedModeBanner: false,
            title: '',
            routes: Routes.routes),
      ),
    );
  }
}
