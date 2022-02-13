import "package:flutter/material.dart";

class CustomLoaderOverlay extends StatelessWidget {
  const CustomLoaderOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
