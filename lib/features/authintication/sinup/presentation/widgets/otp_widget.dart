import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/databases/cache/cache_helper.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/features/authintication/sinup/presentation/cubit/verify_otp/cubit/verifyotp_cubit.dart';

class OTPVerificationPage extends StatefulWidget {
  // إضافة الـ email كمعامل مطلوب
  final String email;
  
  const OTPVerificationPage({super.key, required this.email});

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  List<TextEditingController> controllers = [];
  List<FocusNode> focusNodes = [];
  String otpCode = '';
  
  // اللون الرئيسي
  final Color primaryColor = const Color(0xFF00917C);
  
  @override
  void initState() {
    super.initState();
    // إنشاء 6 controllers و focus nodes للـ 6 خانات
    for (int i = 0; i < 6; i++) {
      controllers.add(TextEditingController());
      focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void onOTPChanged(String value, int index) {
    setState(() {
      if (value.isNotEmpty) {
        // الانتقال للخانة التالية
        if (index < 5) {
          FocusScope.of(context).requestFocus(focusNodes[index + 1]);
        } else {
          // إزالة التركيز من آخر خانة
          FocusScope.of(context).unfocus();
        }
      } else {
        // الرجوع للخانة السابقة عند المسح
        if (index > 0) {
          FocusScope.of(context).requestFocus(focusNodes[index - 1]);
        }
      }
      
      // تجميع الـ OTP
      otpCode = controllers.map((controller) => controller.text).join();
    });
  }

  void verifyOTP() {
    if (otpCode.length == 6) {
      print('OTP Code: $otpCode');
      // استخدام BLoC للتحقق من الـ OTP
      context.read<VerifyotpCubit>().verifyOtp( widget.email,otpCode);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى إدخال الكود كاملاً'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void resendOTP() {
    // مسح الحقول الحالية
    for (var controller in controllers) {
      controller.clear();
    }
    setState(() {
      otpCode = otpCode;
    });
    
    // التركيز على أول حقل
    FocusScope.of(context).requestFocus(focusNodes[0]);
    
    // منطق إعادة إرسال الـ OTP
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('تم إعادة إرسال الكود'),
        backgroundColor: primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocListener<VerifyotpCubit, VerifyotpState>(
        listener: (context, state) {
          if (state is VerifyotpSuccess) {
            // في حالة النجاح
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Account verified successfully!'),
                backgroundColor: primaryColor,
              ),
              
            );
            final roles = state.roles;
          CacheHelper.sharedPreferences.setString('roles', roles.join(', '));
          if (roles.contains("ROLE_SELLER")) {
            GoRouter.of(context).go(Routes.dashboardseller);
          } else {
            GoRouter.of(context).go(Routes.home);
          }
            
          } else if (state is VerifyotpError) {
            // في حالة الخطأ
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                
                // أيقونة المنزل الذكي
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.home_outlined,
                    size: 50,
                    color: primaryColor,
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // العنوان
                Text(
                  'Confirm Identity',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                
                const SizedBox(height: 12),
                
                // النص التوضيحي مع عرض الإيميل
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Please enter the 6-digit code sent to\n',
                      ),
                      TextSpan(
                        text: widget.email,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 48),
                
                // حقول إدخال الـ OTP
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, (index) {
                    return Container(
                      width: 50,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: controllers[index].text.isNotEmpty 
                              ? primaryColor 
                              : Colors.grey[300]!,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: controllers[index].text.isNotEmpty 
                            ? primaryColor.withOpacity(0.05) 
                            : Colors.white,
                      ),
                      child: TextField(
                        controller: controllers[index],
                        focusNode: focusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          counterText: '',
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) => onOTPChanged(value, index),
                      ),
                    );
                  }),
                ),
                
                const SizedBox(height: 48),
                
                // زر التحقق مع BlocBuilder
                BlocBuilder<VerifyotpCubit, VerifyotpState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: (otpCode.length == 6 && state is! VerifyotpLoading) 
                            ? verifyOTP 
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        child: state is VerifyotpLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Confirm',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 24),
                
                // رابط إعادة الإرسال
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn\'t receive the code? ',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: resendOTP,
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const Spacer(),
                
                // نص الحماية
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.security,
                        color: Colors.grey[400],
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Protected by our privacy policy',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}