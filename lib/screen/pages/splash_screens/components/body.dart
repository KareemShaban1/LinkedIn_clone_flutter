
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkedin_clone/constants.dart';

import 'package:linkedin_clone/screen/pages/sign_in/sign_in.dart';
import 'package:linkedin_clone/screen/pages/sign_up/sign_up1.dart';
import 'package:linkedin_clone/size_config.dart';

// This is the best practice
import 'splash_content.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Find and land your next job",
      "image": "assets/image1.jpg"
    },
    {
      "text":
          "build your network on the go",
      "image": "assets/image2.jpg"
    },
    {
      "text": "stay ahead with curated content for your career",
      "image": "assets/image3.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),

        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset(
                "assets/Logo.svg",
                width: 30,
                height: 30,
              ),
            ),


            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    // Spacer(flex: 1),
                    SizedBox(height: 20,),

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
                              builder: (BuildContext context) => SignUp(),
                            )),
                        child: Text(
                          "Join now",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),

                    SizedBox(
                      width: double.infinity,
                      height: getProportionateScreenHeight(55),
                      child: ElevatedButton(

                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    side: BorderSide(color: Colors.black)
                                )
                            )
                        ),
                        child:
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: 60,),
                            SvgPicture.asset(
                              "assets/icons-google.svg",
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 10,),

                            Text(
                              "Join with Google",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),

                      ),
                    ),
                    SizedBox(height: 25,),


                    GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => SignIn(),
                            )),
                        child: Text("Sign In",style: TextStyle(color:kPrimaryColor,fontSize: 20 ,fontWeight: FontWeight.bold),)),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: currentPage == index ? 10 : 10,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.grey[800] : Colors.white,

        border: Border.all(
          color: currentPage == index ? Colors.grey[800] : Colors.black ,

        ),
        borderRadius: BorderRadius.circular(10),//Border.all


      ),
    );
  }


}
