import 'package:codeland/AppTheme/app_color.dart';
import 'package:codeland/custome_widgets/reusable_text_field.dart';
import 'package:codeland/main.dart';
import 'package:codeland/screens/upload_img_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: mq.height * 1,
          width: mq.width * 1,
          child: Column(
            children: [
              // CodeLand Logo
              Container(
                height: mq.height * .44,
                width: mq.width * 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: mq.height * .15,
                      width: mq.width * .4,
                      child: Image.asset(
                        'assets/images/logo 2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: mq.height * .2,
                      width: mq.width * .7,
                      child: Image.asset('assets/images/logo 1.png'),
                    ),
                    const Text('Biomedical Kiosk',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 21)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: mq.width * .2),
                          child: Text(
                            'for HCE"\'"s',
                            style: TextStyle(
                                color: AppColor().orange,
                                fontFamily: 'Poppins'),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.01,
              ),

              // Text Field and Button
              Container(
                height: mq.height * .3,
                width: mq.width * 1,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ReusableTextFormField(
                        controller: _userName,
                        fieldName: 'username',
                        keyboardtype: TextInputType.name,
                        errormsg: 'Please enter User Name',
                      ),
                      ReusableTextFormField(
                          controller: _password,
                          fieldName: 'Password',
                          keyboardtype: TextInputType.visiblePassword,
                          isObsecure: true,
                          errormsg: 'Please enter Password'),
                      SizedBox(
                        width: mq.width * 1,
                        height: mq.height * .07,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const UploadImgScreen()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 6,
                              backgroundColor: AppColor().orange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: AppColor().white,
                                fontFamily: 'Poppins',
                                fontSize: 23),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),

              // For assistance & Login Detail
              Container(
                height: mq.height * .1,
                width: mq.width * 1,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('For Assistance & Login Details Contact: '),
                    RichText(
                      text: TextSpan(
                        text: 'English, Kannada & Telugu : ',
                        style: TextStyle(
                            fontFamily: 'Poppins', color: AppColor().black),
                        children: <TextSpan>[
                          TextSpan(
                              text: '7406333800',
                              style: TextStyle(color: AppColor().orange)),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'English, Kannada & Hindi    :',
                        style: TextStyle(
                            fontFamily: 'Poppins', color: AppColor().black),
                        children: <TextSpan>[
                          TextSpan(
                              text: '9071386515',
                              style: TextStyle(color: AppColor().orange)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.06,
              ),
              Text('v1.7 © 2023, Codeland Infosolutions Pvt Ltd.')
            ],
          ),
        ),
      ),
    );
  }
}
