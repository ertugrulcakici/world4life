import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:world4life/product/utility/userAuthentication/viewmodel/user_viewmodel.dart';
import 'package:world4life/product/widget/overlay/custom_overlay.dart';
import 'package:world4life/view/authenticate/haveNotUser/view/have_not_user_view.dart';
import 'package:world4life/view/authenticate/register/view/register_view.dart';

class BaseView extends StatefulWidget {
  final Function(BuildContext context) onPageBuilder;
  final Function? onPageReady;
  final List<FocusNode>? nodes;
  final bool userRequired;
  final bool showUserRequiredAppbar;
  const BaseView({
    Key? key,
    required this.onPageBuilder,
    this.nodes,
    this.onPageReady,
    this.showUserRequiredAppbar = true,
    this.userRequired = false,
  }) : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView> {
  @override
  void initState() {
    super.initState();
    if (widget.onPageReady != null) {
      widget.onPageReady!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const CustomLoaderOverlay(),
      child: GestureDetector(
        onTap: () {
          if (widget.nodes != null) {
            for (FocusNode element in widget.nodes!) {
              element.unfocus();
            }
          }
        },
        child: getChild(),
      ),
    );
  }

  Widget getChild() {
    if (widget.userRequired) {
      if (context.watch<UserViewmodel>().user != null) {
        return widget.onPageBuilder(context);
      } else {
        return const HaveNotUserView();
      }
    } else {
      return widget.onPageBuilder(context);
    }
  }
}
