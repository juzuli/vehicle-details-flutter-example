import 'package:flutter/material.dart';
import 'package:vehicle_list_app/src/model/vehicle_details.dart';
import 'package:vehicle_list_app/src/screens/first_screen.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key? key, required this.vehicleDetails}) : super(key: key);

  List<VehicleDetails> vehicleDetails;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  final _vehicleDetails = VehicleDetails();

  List<String> vehicleBrands = [
    'Maruti Suzuki',
    'Hyundai',
    'Mahindra & Mahindra',
    'Tata',
    'Honda',
    'Toyota Kirloskarr',
    'Ford',
    'Renault',
    'Nissan',
    'Volkswagen',
    'Yamaha',
    'Royal Enfield',
  ];
  String selectedBrand = 'Maruti Suzuki';

  List<String> vehicleType = [
    'Bike',
    'Car',
  ];
  String selectedVehicleType = 'Bike';

  List<String> fuelType = [
    'Petrol',
    'Diesel',
  ];
  String selectedFuelType = 'Petrol';

  TextEditingController vehicleNoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vehicle form"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (val) {
                      _vehicleDetails.vehicleNumber = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'This field cant be empty';
                      } else {
                        return null;
                      }
                    },
                    controller: vehicleNoController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: const Text("Vehicle No."),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField<String>(
                    onSaved: (val) {
                      _vehicleDetails.vehicleBrand = val;
                    },
                    decoration: InputDecoration(
                      label: const Text("Vehicle Brand"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    value: selectedBrand,
                    items: vehicleBrands
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (e) => setState(() {
                      selectedBrand = e!;
                    }),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField<String>(
                    onSaved: (val) {
                      _vehicleDetails.vehicleType = val;
                    },
                    decoration: InputDecoration(
                      label: const Text("Vehicle Type"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    value: selectedVehicleType,
                    items: vehicleType
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (e) => setState(() {
                      selectedVehicleType = e!;
                    }),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField<String>(
                    onSaved: (val) {
                      _vehicleDetails.fuelType = val;
                    },
                    decoration: InputDecoration(
                      label: const Text("Fuel Type"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    value: selectedFuelType,
                    items: fuelType
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (e) => setState(() {
                      selectedFuelType = e!;
                    }),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          widget.vehicleDetails.add(_vehicleDetails);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstScreen(
                                vehicleDetails: widget.vehicleDetails,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
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

// class CustomDropDown extends StatefulWidget {
//   CustomDropDown({
//     Key? key,
//     this.title,
//     required this.items,
//     required this.selectedItem,
//   }) : super(key: key);
//
//   String? title;
//   final List<String> items;
//   String selectedItem;
//
//   @override
//   State<CustomDropDown> createState() => _CustomDropDownState();
// }
//
// class _CustomDropDownState extends State<CustomDropDown> {
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//         label: Text(widget.title ?? ''),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//       ),
//       value: widget.selectedItem,
//       items: widget.items
//           .map(
//             (e) => DropdownMenuItem<String>(
//               value: e,
//               child: Text(e),
//             ),
//           )
//           .toList(),
//       onChanged: (e) => setState(() {
//         widget.selectedItem = e!;
//       }),
//     );
//   }
// }
