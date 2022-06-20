import 'package:flutter/material.dart';
import 'package:vehicle_list_app/src/model/vehicle_details.dart';
import 'package:vehicle_list_app/src/screens/second_screen.dart';
import 'package:vehicle_list_app/src/screens/tabs/first_tab.dart';
import 'package:vehicle_list_app/src/screens/tabs/second_tab.dart';

class FirstScreen extends StatefulWidget {
  final List<VehicleDetails>? vehicleDetails;
  const FirstScreen({Key? key,this.vehicleDetails}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vehicle Details'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("Bike"),
              ),
              Tab(
                child: Text("Car"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FirstTab(vehicleDetails: widget.vehicleDetails),
            SecondTab(vehicleDetails: widget.vehicleDetails),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) =>   SecondScreen(vehicleDetails: widget.vehicleDetails ?? [],),
              ),
            );
          },
          label: Row(
            children: const [
              Text("Add Vehicles"),
              Icon(Icons.add_circle),
            ],
          ),
        ),
      ),
    );
  }
}
