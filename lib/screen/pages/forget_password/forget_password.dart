import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkedin_clone/screen/pages/sign_up/sign_up3.dart';
import 'package:linkedin_clone/size_config.dart';

import '../../../../constants.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: double.infinity,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(
                    "assets/Logo.svg",
                    width: 40,
                    height: 40,
                  ),
                ),

                SizedBox(height: 50,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Forget Password",style: TextStyle(color: Colors.black,fontSize: 30),),
                      Text("Reset password in two quick steps",style: TextStyle(color: Colors.black,fontSize: 16),),

                      SizedBox(height: 50,),

                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Email or phone",
                            border: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(10.0)
                            )

                        ),
                      ),

                      SizedBox(height: 30,),



                      SizedBox(
                        width: double.infinity,
                        height: getProportionateScreenHeight(55),
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
                                builder: (BuildContext context) => SignUp3(),
                              )),
                          child: Text(
                            "Reset password",
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
