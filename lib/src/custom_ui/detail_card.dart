import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  DetailCard({
    Key? key,
    this.vehicleNumber,
    this.vehicleBrand,
    this.vehicleType,
    this.fuelType,
    this.onPressed,
  }) : super(key: key);

  String? vehicleNumber;
  String? vehicleBrand;
  String? vehicleType;
  String? fuelType;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        child: Stack(
          children: [
            Positioned(
              right: 5,
              top: 5,
              child: IconButton(
                onPressed: onPressed??(){},
                icon: const Icon(Icons.delete_outline),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
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
                      Text(vehicleNumber ?? ""),
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
                      Text(vehicleBrand ?? ''),
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
                      Text(vehicleType ?? ''),
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
                      Text(fuelType ?? ''),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
