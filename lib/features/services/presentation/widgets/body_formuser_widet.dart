import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/styles/textstyles.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/features/services/presentation/cubit/services_cubit.dart'; // تأكد من المسار الصحيح

class BodyFormuserWidet extends StatelessWidget {
  const BodyFormuserWidet({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ServicesCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextformfield(
              hintText: 'First Name*',
              hintStyle: Textstyles.namereview.copyWith(color: Colors.grey, fontSize: 15),
              keyboardType: TextInputType.text,
              controller: cubit.firstNameController,
              color: Colors.white,
              border: const UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: maincolor),
              ),
            ),
            const SizedBox(height: 20),

            CustomTextformfield(
              hintText: 'Last Name*',
              hintStyle: Textstyles.namereview.copyWith(color: Colors.grey, fontSize: 15),
              keyboardType: TextInputType.text,
              controller: cubit.lastNameController,
              color: Colors.white,
              border: const UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: maincolor),
              ),
            ),
            const SizedBox(height: 20),

            IntlPhoneField(
              controller: cubit.mobileController,
              decoration: InputDecoration(
                labelText: 'Mobile',
                hintStyle: Textstyles.namereview.copyWith(color: Colors.grey, fontSize: 15),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: maincolor),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: maincolor),
                ),
              ),
              dropdownDecoration: const BoxDecoration(
                color: Colors.white,
              ),
              initialCountryCode: 'EG',
            ),
            const SizedBox(height: 20),

            CustomTextformfield(
              hintText: 'Email*',
              hintStyle: Textstyles.namereview.copyWith(color: Colors.grey, fontSize: 15),
              keyboardType: TextInputType.emailAddress,
              controller: cubit.emailController,
              color: Colors.white,
              border: const UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: maincolor),
              ),
            ),
            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Address',
                style: Textstyles.namereview.copyWith(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: CustomTextformfield(
                    hintText: 'City',
                    hintStyle: Textstyles.namereview.copyWith(color: Colors.grey, fontSize: 15),
                    keyboardType: TextInputType.text,
                    controller: cubit.cityController,
                    color: Colors.white,
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: maincolor),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextformfield(
                    hintText: 'State',
                    hintStyle: Textstyles.namereview.copyWith(color: Colors.grey, fontSize: 15),
                    keyboardType: TextInputType.text,
                    controller: cubit.stateController,
                    color: Colors.white,
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: maincolor),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: CustomTextformfield(
                    hintText: 'Street',
                    hintStyle: Textstyles.namereview.copyWith(color: Colors.grey, fontSize: 15),
                    keyboardType: TextInputType.text,
                    controller: cubit.streetController,
                    color: Colors.white,
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: maincolor),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextformfield(
                    hintText: 'Zipcode',
                    hintStyle: Textstyles.namereview.copyWith(color: Colors.grey, fontSize: 15),
                    keyboardType: TextInputType.number,
                    controller: cubit.zipController,
                    color: Colors.white,
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: maincolor),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Share with us your requirements*',
                  style: Textstyles.namereview.copyWith(color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 20),

            CustomTextformfield(
              hintText: 'i.e I Wanna make my home smart',
              hintStyle: Textstyles.namereview.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
              keyboardType: TextInputType.text,
              maxLines: 5,
              controller: cubit.requirementsController,
              colorborder: maincolor,
            )
          ],
        ),
      ),
    );
  }
}
