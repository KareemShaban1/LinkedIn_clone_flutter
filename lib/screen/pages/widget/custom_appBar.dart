import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomAppBar extends StatelessWidget {
  final SizingInformation sizingInformation;

  const CustomAppBar({Key key, this.sizingInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      height: sizingInformation.screenSize.height * 0.08,
      padding: EdgeInsets.only(top: 5,left: 15,right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [


              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 33,
                  width: 33,
                  decoration: BoxDecoration(
                    color: Colors.purple[500],
                    // border: Border.all(color: Colors.white,width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(child: Text("c",style: TextStyle(fontSize: 20,color: Colors.white),)),
                ),
              ),


            ],
          ),

          Container(
            height: 35,
            width: sizingInformation.screenSize.width/1.40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.white70
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search,color: Colors.black87,),
                suffixIcon: Icon(Icons.qr_code,color: Colors.black87)
              ),
            ),
          ),

          Container(
            height: 30,
            width: 30,
            child:
              Icon(FontAwesomeIcons.facebookMessenger)

          ),
        ],
      ),
    );
  }
}
