import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkedin_clone/screen/pages/sign_up/sign_up3.dart';
import 'package:linkedin_clone/size_config.dart';

import '../../../../constants.dart';

class SignUp2 extends StatelessWidget {
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

                      Text("Add your Email",style: TextStyle(color: Colors.black,fontSize: 30),),

                      SizedBox(height: 50,),

                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Email"
                        ),
                      ),

                      SizedBox(height: 30,),



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
                                builder: (BuildContext context) => SignUp3(),
                              )),
                          child: Text(
                            "Continue",
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
