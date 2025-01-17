
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/images.dart';
import '../../../../global/constants/input_decoration.dart';
import '../../../../global/utils/show_toast.dart';
import '../../../../global/widget/global_container.dart';
import '../../../../global/widget/global_image_loader.dart';
import '../../../../global/widget/global_sizedbox.dart';
import '../../../../global/widget/global_textform_field.dart';
import '../../base_widget/custom_appbar.dart';
import '../../base_widget/global_button.dart';
import '../controller/auth_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailCon = TextEditingController(text: "asif@gmail.com");
  TextEditingController passCon = TextEditingController(text: "123456");

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: GlobalAppBar(
                  title: 'Sign In',
                  isBackIc: false,
                  centerTitle: true,
                  notiOnTap: () {},
                )),
            body: GlobalContainer(
              height: size(context).height,
              width: size(context).width,
              color: Colors.white,
              child: SafeArea(
                child: Form(
                  key: formKey,
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll) {
                      overScroll.disallowIndicator();
                      return true;
                    },
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            sizeBoxH(40),
                            const Center(
                              child: GlobalImageLoader(
                                imagePath: Images.logo,
                                height: 140,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            sizeBoxH(40),
                            GlobalTextFormField(
                              controller: emailCon,
                              titleText: 'Email',
                              hintText: 'Enter Your Email',
                              decoration: borderDecoration,
                            ),
                            sizeBoxH(15),
                            GlobalTextFormField(
                              controller: passCon,
                              titleText: 'Password',
                              hintText: 'Enter Your Password',
                              decoration: borderDecoration,
                              isDense: true,
                              isPasswordField: true,
                            ),
                            sizeBoxH(20),
                            GlobalButtonWidget(
                                str: 'SIGN IN',
                                height: 45,
                                onTap: (){
                                  if(emailCon.text.isNotEmpty){
                                    if(passCon.text.isNotEmpty){
                                      authController.logIn(
                                        email: emailCon.text.trim(),
                                        password: passCon.text.trim(),
                                      );
                                    } else{
                                      showCustomSnackBar("Required Password");
                                    }
                                  } else{
                                    showCustomSnackBar("Required Email");
                                  }
                                }
                            ),
                            sizeBoxH(20),
                            // GestureDetector(
                            //   onTap: () {
                            //     Get.to(()=> const SignUpScreen());
                            //   },
                            //   child: const Align(
                            //     alignment: Alignment.center,
                            //     child: CoupleTextButton(
                            //         firstText: "Don't have and any account? ",
                            //         secondText: "Sign Up"),
                            //   ),
                            // ),
                            // sizeBoxH(20)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
        );
      }
    );
  }
}
