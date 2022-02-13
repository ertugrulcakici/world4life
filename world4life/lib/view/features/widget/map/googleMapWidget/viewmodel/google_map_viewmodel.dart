import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:world4life/core/constants/assets_constants.dart';
import 'package:world4life/core/constants/testdata_constants.dart';
import 'dart:async';
import 'dart:ui' as ui;

import 'package:world4life/product/models/waste_model.dart';

class GooglemapViewmodel extends ChangeNotifier {
  final List<LatLng> _coordinates = [];
  List<LatLng> get coordinates => _coordinates;
  Set<Marker> _markers = Set<Marker>();
  Set<Marker> get markers => _markers;
  late CameraPosition _cameraPosition;
  CameraPosition get cameraPosition => _cameraPosition;
  Completer<GoogleMapController> _controller = Completer();
  Completer<GoogleMapController> get controller => _controller;
  late BuildContext? superContext;
  BitmapDescriptor? _customIcon;
  List<BitmapDescriptor> bitmapDescriptors = [];

  GooglemapViewmodel({BuildContext? context}) {
    superContext = context;
    _createIcon();
    _markersAdd();

    _createCameraPosition();
  }

  _createCameraPosition() async {
    try {
      LocationPermission permission;
      _cameraPosition = const CameraPosition(
          target: LatLng(13.6358813, 34.4863712), zoom: 7.251926040649414);
      notifyListeners();
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }
      Position _position =
          await GeolocatorPlatform.instance.getCurrentPosition();
      _animateTheCamera(LatLng(_position.latitude, _position.longitude));
      notifyListeners();
    } catch (ex) {}
  }

  _markersAdd() async {
    for (WasteModel data in TestDataConstants.coordinates) {
      await _createIcon(categoryId: data.category_id);
      _markers.add(
        Marker(
            markerId: MarkerId(
              (_markers.length + 1).toString(),
            ),
            position: LatLng(data.lang, data.long),
            icon: _customIcon ?? BitmapDescriptor.defaultMarker,
            onTap: () => superContext == null
                ? null
                : showDialog(
                    context: superContext!, builder: (_) => Text("as"))),
      );
    }
  }

  _animateTheCamera(LatLng coordinate) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: coordinate, zoom: 8),
      ),
    );
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  _createIcon({int? categoryId}) async {
    final Uint8List markerIcon =
        await getBytesFromAsset(getIconPathById(categoryId ?? 1), 20.w.toInt());
    _customIcon = BitmapDescriptor.fromBytes(markerIcon);
    notifyListeners();
  }

  getIconPathById(int id) {
    switch (id) {
      case 1:
        return AssetConstant.instance.battery;
      case 2:
        return AssetConstant.instance.bread;
      case 3:
        return AssetConstant.instance.glass;
      case 4:
        return AssetConstant.instance.metal;
      case 5:
        return AssetConstant.instance.organic;

      default:
        return "";
    }
  }
}
