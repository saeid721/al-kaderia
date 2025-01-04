
import 'package:flutter/material.dart';
import '../../../global/constants/input_decoration.dart';
import '../../../global/widget/couple_text_button.dart';
import '../../../global/widget/global_container.dart';
import '../../../global/widget/global_sizedbox.dart';
import '../../../global/widget/global_textform_field.dart';
import '../../base_widget/custom_appbar.dart';
import '../../base_widget/global_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullNameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController mobileCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  TextEditingController conPassCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: GlobalAppBar(
              title: 'Registration',
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
                        // sizeBoxH(20),
                        // const Center(
                        //   child: GlobalImageLoader(
                        //     imagePath: Images.logo,
                        //     height: 100,
                        //     width: 100,
                        //     fit: BoxFit.fitWidth,
                        //   ),
                        // ),
                        sizeBoxH(30),
                        GlobalTextFormField(
                          controller: fullNameCon,
                          titleText: 'Full Name',
                          hintText: 'Enter Your Name',
                          decoration: borderDecoration,
                          isDense: true,
                        ),
                        sizeBoxH(15),
                        GlobalTextFormField(
                          controller: emailCon,
                          titleText: 'Email',
                          hintText: 'Enter Your Email',
                          decoration: borderDecoration,
                          isDense: true,
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
                        sizeBoxH(15),
                        GlobalTextFormField(
                          controller: conPassCon,
                          titleText: 'Confirm Password',
                          hintText: 'Enter Your Password',
                          decoration: borderDecoration,
                          isDense: true,
                          isPasswordField: true,
                        ),
                        sizeBoxH(20),
                        GlobalButtonWidget(
                            str: 'SIGN IN',
                            height: 45,
                            onTap: (){}
                        ),
                        sizeBoxH(20),
                        GestureDetector(
                          onTap: () {

                          },
                          child: const Align(
                            alignment: Alignment.center,
                            child: CoupleTextButton(
                                firstText: "Don't have and any account? ",
                                secondText: "Registration"),
                          ),
                        ),
                        sizeBoxH(20)
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
}
