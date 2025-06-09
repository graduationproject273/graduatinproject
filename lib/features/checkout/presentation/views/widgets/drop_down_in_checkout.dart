import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(
     width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Color(0xFFF9FAFA)
      ),
      height: 50.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:  8.0,horizontal: 16),
        child:  DropdownButtonHideUnderline(
          
    child: DropdownButton<String>(
      dropdownColor: Color(0xFFF9FAFA),
      value: selectedCity,
      hint:  Text("Select a city",style: const TextStyle(color: Color(0xff8F959E))),
      icon: const Icon(Icons.arrow_drop_down),
          
     isExpanded: true, // حجم القائمة لا يتوسع مع الشاشة
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
          
      ),);
  }
}