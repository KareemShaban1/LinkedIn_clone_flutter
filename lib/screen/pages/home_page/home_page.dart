
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:linkedin_clone/constants.dart';
import 'package:linkedin_clone/repository/data.dart';
import 'package:linkedin_clone/screen/pages/widget/Custom_Buttons.dart';
import 'package:linkedin_clone/screen/pages/widget/custom_appBar.dart';
import 'package:responsive_builder/responsive_builder.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  final _post = Data.postList;
  bool _showAppNavBar = true;
  ScrollController _scrollController;
  bool _isScrollDown = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _initialScroll();
  }

  void _initialScroll() async {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_isScrollDown) {
          _isScrollDown = true;
          _hideAppNavBar();
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_isScrollDown) {
          _isScrollDown = false;
          _showAppNvBar();
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return
      ResponsiveBuilder(
          builder: (BuildContext context, SizingInformation sizingInformation) {
            return Container(
              color: Colors.black12,
              child: Column(
                children: [
                  _showAppNavBar
                      ? CustomAppBar(
                    sizingInformation: sizingInformation,
                  )
                      : Container(
                    height: 0.0,
                    width: 0.0,
                  ),
                  _listPostWidget(sizingInformation),
                ],
              ),
            );
          });
  }

  Widget _listPostWidget(SizingInformation sizingInformation) {
    return Expanded(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _post.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                margin: EdgeInsets.only(bottom: 0.0, top: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        top: BorderSide(color: Colors.black54, width: 0.50),
                        bottom: BorderSide(color: Colors.black54, width: 0.50))),
                child: Column(
                  children: [

                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.all(Radius.circular(0)),
                              image: DecorationImage(
                                  image: AssetImage(_post[index].profileUrl)
                              )

                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _post[index].name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: sizingInformation.screenSize.width / 1.34,
                              child: Text(
                                _post[index].headline,
                                style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),

                    SizedBox(height: 10,),

                    Text(
                      _post[index].description,
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      _post[index].tags,
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: sizingInformation.screenSize.width,
                      child: Image.asset(
                        _post[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                  width: 25,
                                  height: 25,
                                  child: Image.asset('assets/icons/like_icon.png')),
                              Container(
                                  width: 25,
                                  height: 25,
                                  child: Image.asset(
                                      'assets/icons/celebrate_icon.png')),
                              if (index == 0 || index == 4 || index == 6)
                                Container(
                                    width: 25,
                                    height: 25,
                                    child:
                                    Image.asset('assets/icons/love_icon.png')),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                _post[index].likes,
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(_post[index].comments),
                              Text(" comments")
                            ],
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 0.50,
                      color: Colors.black26,
                    ),
                    _rowButton(),
                  ],
                ),
              );
            },
          ),
        ));
  }

  void _hideAppNavBar() {
    setState(() {
      _showAppNavBar = false;
    });
  }

  void _showAppNvBar() {
    setState(() {
      _showAppNavBar = true;
    });
  }

  Widget _rowButton() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: rowSingleButton(
                color: Colors.black,
                name: "Like",
                iconImage: "assets/icons/like_icon_white.png",
                isHover: false),
          ),
          InkWell(
            onTap: () {},
            child: rowSingleButton(
                color: Colors.black,
                name: "Comment",
                iconImage: "assets/icons/comment_icon.png",
                isHover: false),
          ),
          InkWell(
            onTap: () {},
            child: rowSingleButton(
                color: Colors.black,
                name: "Share",
                iconImage: "assets/icons/share_icon.png",
                isHover: false),
          ),
        ],
      ),
    );
  }
}
