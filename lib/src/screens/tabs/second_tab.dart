import 'package:flutter/material.dart';
import 'package:vehicle_list_app/src/model/vehicle_details.dart';

class SecondTab extends StatefulWidget {
  List<VehicleDetails>? vehicleDetails = [];

  SecondTab({Key? key, this.vehicleDetails}) : super(key: key);

  @override
  State<SecondTab> createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  @override
  Widget build(BuildContext context) {
    if (widget.vehicleDetails != null) {
      List _vehicleDetails = widget.vehicleDetails!.where((e) => e.vehicleType!.contains("Car")).toList();
      if(_vehicleDetails.isNotEmpty){
        return ListView.builder(
          itemCount: _vehicleDetails.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, right: 24, left: 24),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
                child: Container(
                  margin:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  child: Column(
                    // spacing: 10,
                    // direction: Axis.vertical,
                    children: [
                      Row(
                        children: [
                          const Text("Vehicle Number"),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(":"),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(_vehicleDetails[index].vehicleNumber ?? ""),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Vehicle Brand"),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(":"),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(_vehicleDetails[index].vehicleBrand ?? ""),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Vehicle Type"),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(":"),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(_vehicleDetails[index].vehicleType ?? ""),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Fuel Type"),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(":"),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(_vehicleDetails[index].fuelType ?? ""),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
      else{
        return const Center(
          child: Text("No cars added !"),
        );
      }
    } else {
      return const Center(
        child: Text("No cars added !"),
      );
    }
  }
}
