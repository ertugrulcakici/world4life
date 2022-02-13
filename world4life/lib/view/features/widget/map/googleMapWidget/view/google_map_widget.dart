import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:world4life/view/features/widget/map/googleMapWidget/viewmodel/google_map_viewmodel.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({Key? key}) : super(key: key);

  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GooglemapViewmodel(context: context),
      builder: (_, a) => _scaffold(_),
    );
  }

  Scaffold _scaffold(BuildContext _) => Scaffold(
        body: GoogleMap(
          markers: _.watch<GooglemapViewmodel>().markers,
          mapType: MapType.normal,
          initialCameraPosition: _.watch<GooglemapViewmodel>().cameraPosition,
          onMapCreated: (GoogleMapController controller) {
          _.read<GooglemapViewmodel>().controller.complete(controller);
          },
        ),
      );
}
