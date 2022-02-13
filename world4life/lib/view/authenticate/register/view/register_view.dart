import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world4life/core/base/state/base_state.dart';
import 'package:world4life/core/base/view/base_view.dart';
import 'package:world4life/core/constants/assets_constants.dart';
import 'package:world4life/core/constants/routers.dart';
import 'package:world4life/core/constants/validator_constant.dart';
import 'package:world4life/core/init/locator.dart';
import 'package:world4life/core/management/padding/page_padding.dart';
import 'package:world4life/view/authenticate/register/viewmodel/register_viewmodel.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends BaseState<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(onPageBuilder: (context) => _scaffold);
  }

  Widget get _scaffold => ChangeNotifierProvider<RegisterViewmodel>(
        create: (context) => RegisterViewmodel(
          context: context
        ),
        builder: (_, a) => Scaffold(
          body: Form(
            key: _.read<RegisterViewmodel>().formKey,
            child: ListView(
              padding: PagePadding.all(),
              children: [
                space(5),
                SvgPicture.asset(
                  AssetConstant.instance.APP_LOGO,
                  width: 50.w,
                ),
                space(5),
                _usernameForm(_),
                space(2),
                _emailForm(_),
                space(2),
                _passwordForm(_),
                space(2),
                ElevatedButton(
                  onPressed: () => _.read<RegisterViewmodel>().register(),
                  child:const Text("Kayıt ol"),
                ),
                space(20),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context,  Routes.login.routeName);
              },
              child: const    Text(
                    "Giriş yap",
                    textAlign: TextAlign.center,
                  ),
            )
              ],
            ),
          ),
        ),
      );
  Widget _emailForm(BuildContext _) => TextFormField(
        validator: locator<Validator>().emailValidator,
        onSaved: _.read<RegisterViewmodel>().setEmail,
        decoration: const InputDecoration(hintText: "Email"),
      );
  Widget _usernameForm(BuildContext _) => TextFormField(
        validator: locator<Validator>().userNameValidator,
        onSaved: _.read<RegisterViewmodel>().setUsername,
        decoration: const InputDecoration(hintText: "Kullanıcı adı"),
      );
  Widget _passwordForm(BuildContext _) => TextFormField(
        validator: locator<Validator>().passwordValidator,
        onSaved: _.read<RegisterViewmodel>().setPassword,
        decoration: const InputDecoration(hintText: "Şifre"),
      );
}
