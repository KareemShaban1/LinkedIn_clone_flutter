import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'file:///D:/linkedIn-clone-master/lib/screen/pages/home.dart';
import 'package:linkedin_clone/screen/pages/sign_up/sign_up2.dart';
import 'package:linkedin_clone/size_config.dart';

import '../../../../constants.dart';

class SignUp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            // width: double.infinity,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(
                    "assets/Logo.svg",
                    width: 30,
                    height: 30,
                  ),
                ),

                SizedBox(height: 50,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Set your password",style: TextStyle(color: Colors.black,fontSize: 30),),

                      SizedBox(height: 50,),

                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Email"
                        ),
                      ),

                      SizedBox(height: 20,),

                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password"
                        ),
                      ),


                      SizedBox(height: 20,),
                      Text.rich(
                          TextSpan(
                              text: "You agree to the LinkedIn  ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,

                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: 'User Agreement ',
                                  style: TextStyle(fontSize: 14,color: kPrimaryColor),

                                  // recognizer: TapGestureRecognizer()..onTap = () {
                                  // Navigator.push(context,MaterialPageRoute(builder: (context) => SignIn()),);
                                  // // single tapped
                                  // },
                                ),
                                TextSpan(
                                  text: ' , Privacy Policy ',
                                  style: TextStyle(fontSize: 14,color: kPrimaryColor,),

                                  // recognizer: TapGestureRecognizer()..onTap = () {
                                  // Navigator.push(context,MaterialPageRoute(builder: (context) => SignIn()),);
                                  // // single tapped
                                  // },
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(fontSize: 14,color: Colors.grey),

                                  // recognizer: TapGestureRecognizer()..onTap = () {
                                  // Navigator.push(context,MaterialPageRoute(builder: (context) => SignIn()),);
                                  // // single tapped
                                  // },
                                ),
                                TextSpan(
                                  text: 'Cookie Policy ',
                                  style: TextStyle(fontSize: 14,color: kPrimaryColor),

                                  // recognizer: TapGestureRecognizer()..onTap = () {
                                  // Navigator.push(context,MaterialPageRoute(builder: (context) => SignIn()),);
                                  // // single tapped
                                  // },
                                ),


                              ]
                          )
                      ),

                      SizedBox(height: 20,),


                      SizedBox(
                        width: double.infinity,
                        height: getProportionateScreenHeight(50),
                        child: ElevatedButton(

                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side: BorderSide(color: kPrimaryColor)
                                  )
                              )
                          ),
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => MobileScreen(),
                              )),
                          child: Text(
                            "Agree & Join",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                )


              ],
            ),
          ),
        ));
  }
}
