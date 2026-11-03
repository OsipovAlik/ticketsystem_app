import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class AddressMap extends StatelessWidget {
  final String thName;
  final double lat;
  final double lng;
  // final GoogleMapController? mapController; 
 const AddressMap({ super.key, required this.thName, required this.lat,required this.lng });
 
   @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Container(
            height: 250,
             decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0)
      ),
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
                 borderRadius: BorderRadius.circular(12.0),
              child: GoogleMap(
        //       onMapCreated: (GoogleMapController controller) {
        //   mapController = controller;
        // },
                initialCameraPosition: CameraPosition(
                        target: LatLng(lat, lng), // Initial map position
                        zoom: 16.0),
                markers: {
                Marker(
                  
                  markerId: MarkerId('unique_marker_id'),
                  position: LatLng(lat, lng), // Marker position
                  infoWindow: InfoWindow(
                    title: thName,
                    snippet: thName,
                  ),
                  icon: BitmapDescriptor.defaultMarker, // Default marker icon
                ),
              },
                        ),
            ),
           )
        ],
      ),
      
    );
  }
}