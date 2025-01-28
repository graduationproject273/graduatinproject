import 'package:flutter/material.dart';

class DropDownInCheckout extends StatefulWidget {
  const DropDownInCheckout({super.key});


  @override
  State<DropDownInCheckout> createState() => _DropDownInCheckoutState();
}

class _DropDownInCheckoutState extends State<DropDownInCheckout> {
    String? selectedCity; 
 // المدينة المختارة
  final List<String> cities = [
    "Cairo",
    "Alexandria",
    "Giza",
    "Sharm El-Sheikh",
    "Hurghada",
    "Luxor",
    "Aswan",
    "Port Said",
    "Ismailia",
    "Faiyum",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
         width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffE7E3E3)
          ),
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:  8.0,horizontal: 16),
            child:  DropdownButtonHideUnderline(
      
        child: DropdownButton<String>(
          dropdownColor: Color(0xffE7E3E3),
          value: selectedCity,
          hint: const Text("Select a city"),
          icon: const Icon(Icons.arrow_drop_down),
      
         isExpanded: false, // حجم القائمة لا يتوسع مع الشاشة
        //  menuMaxHeight: 200,
          menuWidth: double.infinity, 
          items: cities.map((city) {
            return DropdownMenuItem<String>(
              value: city,
              child: Text(city),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedCity = value;
            });
          },
        ),
      ),
      
          ),));
  }
}