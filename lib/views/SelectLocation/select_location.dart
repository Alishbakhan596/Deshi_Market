import 'package:e_commerce_fruits_app/views/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  List<String> zones = [
    'Gulshan',
    'Shahfaisal',
    'Johar',
    'DHA',
    'Clifton',
    'Malir'
  ];
  List<String> areas = [
    'Area 1',
    'Area 2',
    'Area 3',
    'Area 4',
    'Area 5',
    'Area 6'
  ];

  String? selectedZone;
  String? selectedArea;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset("assets/Images/location.png"),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  "Select Your Location",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "Switch on your Location to stay in tune with whats happening in your area ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 50),
              const Text(
                "Your Zones",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              DropdownButton<String>(
                  value: selectedZone,
                  isExpanded: true,
                  hint: Text("Select Your zone"),
                  items: zones.map((String zone) {
                    return DropdownMenuItem<String>(
                      child: Text(zone),
                      value: zone,
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedZone = newValue;
                    });
                  }),
              const SizedBox(height: 20),
              const Text(
                "Your Areas",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              DropdownButton<String>(
                  value: selectedArea,
                  isExpanded: true,
                  hint: Text("Select Your Area"),
                  items: areas.map((String area) {
                    return DropdownMenuItem<String>(
                      child: Text(area),
                      value: area,
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedArea = newValue;
                    });
                  }),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: height * 0.08,
                  width: width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xff53B175),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Get.off(HomeScreen());
                        // Get.off(LoginScreen());
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
