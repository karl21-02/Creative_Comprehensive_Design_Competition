import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:robot/map/ScrollSheetPage/ScrollSheetPage.dart';
// import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<StatefulWidget> createState() => _MapPage();
}

class _MapPage extends State<MapPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(37.28654667179114, 127.21662988021154);
  final Set<Marker> _markers = {};
  late LocationData _currentPosition;
  final Location _location = Location();

  @override
  void initState() {
    super.initState();

    _location.requestPermission().then((status) {
      if (status == PermissionStatus.granted) {
        _location.onLocationChanged.listen((LocationData currentLocation) {
          setState(() {
            _currentPosition = currentLocation;

            // 현재 위치 마커 추가
            _markers.add(
              Marker(
                markerId: const MarkerId('current_location'),
                position: LatLng(_currentPosition.latitude!, _currentPosition.longitude!),
                infoWindow: const InfoWindow(title: 'Your Location'),
              ),
            );

            // 예시로 다른 마커를 추가
            _markers.add(
              const Marker(
                markerId: MarkerId('example_location'),
                position: LatLng(37.28654667179114, 127.21662988021154),
                infoWindow: InfoWindow(title: 'Competition Location'),
              ),
            );

            // 지도 카메라 위치를 업데이트하여 현재 위치로 이동
            mapController.animateCamera(
              CameraUpdate.newLatLng(LatLng(_currentPosition.latitude!, _currentPosition.longitude!)),
            );
          });
        });
      }
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentPosition = currentLocation;
        _markers.add(
          Marker(
            markerId: const MarkerId('current_location'),
            position: LatLng(_currentPosition.latitude!, _currentPosition.longitude!),
            infoWindow: const InfoWindow(
              title: 'your location',
            )
          )
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("지도"),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 11.0
                  ),
                  markers: _markers,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                )
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.03,
              minChildSize: 0.03,
              maxChildSize: 0.9,
              builder: (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                      height: 1500,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                          color: Colors.white),
                      child: ScrollSheetPage()
                  ),
                );
              },
              snap: true,
            )
          ],
        ),
      )
    );
  }
}
