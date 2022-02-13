
import "package:flutter/material.dart";
import 'package:world4life/view/features/widget/map/googleMapWidget/view/google_map_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GoogleMapWidget(),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              decoration:
                  InputDecoration(fillColor: Colors.white, filled: true ,hintText: "Arama sayfası"),
            ),
          )
        ],
      ),
    );
  }
}
