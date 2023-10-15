import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';



class Loc extends StatefulWidget {
  @override
  _LocState createState() => _LocState();
}

class _LocState extends State<Loc> {
  Position? _currentPosition;
  String? _locality;
  String? _city;
  String? _postalCode;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        return;
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return;
      }
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );

    setState(() {
      _currentPosition = position;
    });

    _getAddressFromCoordinates(position.latitude, position.longitude);
  }

  Future<void> _getAddressFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        _locality = place.locality;
        _city = place.administrativeArea;
        _postalCode = place.postalCode;
      }
    } catch (e) {
      _locality = 'Error retrieving location';
      _city = '';
      _postalCode = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Location'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.location_on,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                'Your Current Location:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Locality: ${_locality ?? 'Loading...'}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'City: ${_city ?? 'Loading...'}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Postal Code: ${_postalCode ?? 'Loading...'}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    
  }
}