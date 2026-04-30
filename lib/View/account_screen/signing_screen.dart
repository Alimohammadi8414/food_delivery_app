import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hellofood/view/account_screen/signing_widgets/divider_widget.dart';
import 'package:hellofood/view/account_screen/signing_widgets/login_option.dart';
import 'package:hellofood/view/account_screen/signing_widgets/sign_button_widget.dart';
import 'package:hellofood/view/account_screen/signing_widgets/signing_switch_text.dart';
import 'package:hellofood/view/account_screen/utils/text_field_widget.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});
  bool haveAnAccount = true;
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

bool securePassword = false;
bool secureConfirmPassword = false;
var nameController = TextEditingController();
var lastNameController = TextEditingController();
var phoneController = TextEditingController();
var passwordController = TextEditingController();
var confirmPasswordController = TextEditingController();
var formState = GlobalKey<FormState>();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: SingleChildScrollView(
          child: Form(
            key: formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Hello Food Logo
                Image.asset(
                  'assets/images/ic_food_express.png',
                  width: 250,
                  height: 165,
                ),
                const SizedBox(height: 40),
                if (!widget.haveAnAccount)
                  Row(
                    spacing: 10,
                    children: [
                      // Name
                      TextFormFieldWidget(
                        hinttext: "First Name",
                        obscure: false,
                        prefixIcon: null,
                        suffixIcon: null,
                        width: size.width / 2 - 21,
                        height: 75,
                        controller: nameController,
                        keybourdtype: TextInputType.name,
                        inputFormatters: [],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Pleas enter you're name";
                          }
                          return null;
                        },
                      ),

                      //  Last Name
                      TextFormFieldWidget(
                        hinttext: 'Last Name',
                        obscure: false,
                        prefixIcon: null,
                        suffixIcon: null,
                        width: size.width / 2 - 21,
                        height: 75,
                        controller: lastNameController,
                        keybourdtype: TextInputType.name,
                        inputFormatters: [],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Pleas enter you're lastname";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),

                // Phone Number
                TextFormFieldWidget(
                  hinttext: "Phone",
                  obscure: false,
                  prefixIcon: Icon(
                    Icons.phone,
                    color: AppColors.heavyGray.withValues(alpha: 0.7),
                    size: 20,
                  ),
                  suffixIcon: null,
                  width: size.width,
                  height: 75,
                  controller: phoneController,
                  keybourdtype: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Pleas enter you're phone number";
                    }
                    return null;
                  },
                ),

                // Password
                TextFormFieldWidget(
                  hinttext: 'Password',
                  obscure: securePassword,
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.heavyGray.withValues(alpha: 0.7),
                    size: 20,
                  ),
                  suffixIcon: IconButton(
                    iconSize: 20,
                    color: AppColors.heavyGray.withValues(alpha: 0.7),
                    onPressed: () {
                      setState(() {
                        securePassword = !securePassword;
                      });
                    },
                    icon:
                        securePassword
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                  ),
                  width: size.width,
                  height: 75,
                  controller: passwordController,
                  keybourdtype: TextInputType.visiblePassword,
                  inputFormatters: [],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Pleas enter you're password";
                    }
                    return null;
                  },
                ),

                // Confirm Password
                if (!widget.haveAnAccount)
                  TextFormFieldWidget(
                    hinttext: "Confirm Password",
                    obscure: secureConfirmPassword,
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.heavyGray.withValues(alpha: 0.7),
                      size: 20,
                    ),
                    suffixIcon: IconButton(
                      iconSize: 20,
                      color: AppColors.heavyGray.withValues(alpha: 0.7),
                      onPressed: () {
                        setState(() {
                          secureConfirmPassword = !secureConfirmPassword;
                        });
                      },
                      icon:
                          secureConfirmPassword
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                    ),
                    width: size.width,
                    height: 75,
                    controller: confirmPasswordController,
                    keybourdtype: TextInputType.visiblePassword,
                    inputFormatters: [],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Pleas confirm you're passwords";
                      }
                      return null;
                    },
                  ),

                const SizedBox(height: 35),

                // Sign  Button
                SignButtonWidget(haveAnAccount: widget.haveAnAccount),

                const SizedBox(height: 20),

                // Divider
                DividerWidget(),
                const SizedBox(height: 20),

                // Other login Options
                LoginOptions(),

                widget.haveAnAccount
                    ? SizedBox(height: 178)
                    : SizedBox(height: 30),

                //  Switch to Sign in
                SigningSwitchTextWidget(
                  haveAnAccount: widget.haveAnAccount,
                  ontap: () {
                    setState(() {
                      widget.haveAnAccount = !widget.haveAnAccount;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
