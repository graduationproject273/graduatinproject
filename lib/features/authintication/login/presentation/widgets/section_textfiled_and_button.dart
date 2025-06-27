import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart' show Routes;
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/core/widgets/custom_textfield.dart';

class SectionTextFiledAndButton extends StatefulWidget {
  const SectionTextFiledAndButton({
    super.key,
  });

  @override
  State<SectionTextFiledAndButton> createState() => _SectionTextFiledAndButtonState();
}

class _SectionTextFiledAndButtonState extends State<SectionTextFiledAndButton> {
  final TextEditingController phoneController = TextEditingController();
  bool isLoading = false;

  // إرسال OTP لرقم الهاتف
  Future<void> _sendOtp() async {
    if (phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your phone number')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    // محاكاة إرسال OTP
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP sent to your phone!')),
      );
      
      // الانتقال لشاشة التحقق من OTP
      GoRouter.of(context).push(Routes.register);
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Enhanced phone input section
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(
              color: textcolorinauthpagebuttons.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: textcolorinauthpagebuttons.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.phone,
                      color: textcolorinauthpagebuttons,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Phone Number',
                    style: TextStyle(
                      color: textcolorinauthpagebuttons,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextformfield(
                controller: phoneController,
                hintText: '+20 123 456 7890',
                keyboardType: TextInputType.phone,
                color: Colors.grey[50]!,
                colorborder: textcolorinauthpagebuttons.withOpacity(0.3),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 30),
        
        // Enhanced button with loading state
        Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: isLoading 
                ? [Colors.grey, Colors.grey[400]!]
                : [
                    textcolorinauthpagebuttons,
                    textcolorinauthpagebuttons.withOpacity(0.8),
                  ],
            ),
            boxShadow: [
              BoxShadow(
                color: textcolorinauthpagebuttons.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: isLoading ? null : _sendOtp,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isLoading) ...[
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      const SizedBox(width: 12),
                    ] else ...[
                      const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      isLoading ? 'Sending OTP...' : 'Send OTP',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Additional info
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
                        color: maincolor.withOpacity(.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                        color: maincolor.withOpacity(.5),

              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: maincolor,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'OTP will be sent within 30 seconds',
                  style: TextStyle(
                    color: maincolor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}