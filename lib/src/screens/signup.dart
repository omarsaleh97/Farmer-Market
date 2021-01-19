import 'dart:io';

import 'package:farmer_market/src/styles/base.dart';
import 'package:farmer_market/src/styles/text.dart';
import 'package:farmer_market/src/widgets/button.dart';
import 'package:farmer_market/src/widgets/social_button.dart';
import 'package:farmer_market/src/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(child: pageBody(context));
    } else {
      return Scaffold(
        body: pageBody(context),
      );
    }
  }

  Widget pageBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/top_bg.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/logo.png'))),
        ),
        AppTextField(
          isIOS: Platform.isIOS,
          hintText: 'Email',
          cupertinoIcon: CupertinoIcons.mail_solid,
          materialIcon: Icons.email,
          textInputType: TextInputType.emailAddress,
        ),
        AppTextField(
          isIOS: Platform.isIOS,
          hintText: 'Password',
          cupertinoIcon: IconData(0xf4c9,fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage),
          materialIcon: Icons.lock,
          obscureText: true,
        ),
        AppButton(buttonText: 'Signup',buttonType: ButtonType.LightBlue,),
        Center(child: Text('Or',style: TextStyles.suggestion),),
        Padding(
          padding: BaseStyles.listPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppSocialButton(socialType: SocialType.Facebook,),
              SizedBox(width: 15,),
              AppSocialButton(socialType: SocialType.Google),
            ],),
        ),
        Padding(
          padding: BaseStyles.listPadding,
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Already Have an Account? ',
                  style: TextStyles.body,
                  children: [
                    TextSpan(
                        text: 'Login',
                        style: TextStyles.link,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushNamed(context, '/login')
                    )
                  ]
              )
          ),
        )
      ],
    );
  }
}
