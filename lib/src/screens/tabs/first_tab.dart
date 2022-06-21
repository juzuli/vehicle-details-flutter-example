import 'package:flutter/material.dart';
import 'package:vehicle_list_app/src/custom_ui/detail_card.dart';
import 'package:vehicle_list_app/src/model/vehicle_details.dart';

class FirstTab extends StatefulWidget {
  final List<VehicleDetails>? vehicleDetails;

  const FirstTab({Key? key, this.vehicleDetails}) : super(key: key);

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  @override
  Widget build(BuildContext context) {
    if (widget.vehicleDetails != null) {
      List _vehicleDetails = widget.vehicleDetails!
          .where((e) => e.vehicleType!.contains("Bike"))
          .toList();
      if (_vehicleDetails.isNotEmpty) {
        return ListView.builder(
          itemCount: _vehicleDetails.length,
          itemBuilder: (BuildContext context, int index) {
            return DetailCard(
              vehicleNumber: _vehicleDetails[index].vehicleNumber ?? "",
              vehicleBrand: _vehicleDetails[index].vehicleBrand ?? "",
              vehicleType: _vehicleDetails[index].vehicleType ?? "",
              fuelType: _vehicleDetails[index].fuelType ?? "",
              onPressed: () {
                setState(() {
                  int idx =
                      widget.vehicleDetails!.indexOf(_vehicleDetails[index]);
                  widget.vehicleDetails!.removeAt(idx);
                });
              },
            );
          },
        );
      } else {
        return const Center(
          child: Text("No bikes added !"),
        );
      }
    } else {
      return const Center(
        child: Text("No bikes added !"),
      );
    }
  }
}
