import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_button.dart';
import 'package:gradution/featrues/services/presentation/widgets/container_in_appoinment.dart';

class AppointmentDialog extends StatelessWidget {
  const AppointmentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 10, 
      // ignore: deprecated_member_use
      shadowColor: Colors.black.withOpacity(0.3),
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Appointment Summary',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => GoRouter.of(context).pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Divider(
                color: const Color.fromRGBO(224, 224, 224, 1),
                thickness: 2,
              ),
              const SizedBox(height: 20),
              ContainerInAppoinment(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Free At Home Consultation Visit',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('With any staff member - 1 hr - Free (Cairo & Giza)'),
                  ],
                ),),
              const SizedBox(height: 40),
              Text('Do You want to add another service to this appoinment?'),
              SizedBox(height: 20,),
             ContainerInAppoinment(child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 10),
                    Text('Add Another Service', style: Textstyles.textitemcart,)
                  ],
                )),
              const SizedBox(height: 20),
              Divider(
                color: const Color.fromRGBO(224, 224, 224, 1),
                thickness: 2,
              ),
              const SizedBox(height: 20),
             CustomButton(text: 'Schedue Appointment',onTap: (){},buttonbodycolor: Colors.black,fontWeight: FontWeight.w500,)
            ],
          ),
        ),
      ),
    );
  }
}

