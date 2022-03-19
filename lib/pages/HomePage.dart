import 'package:flutter/material.dart';
import 'package:live_clean/utils/CustomBorder.dart';
import 'package:live_clean/utils/CustomTextStyle.dart';
import 'package:live_clean/utils/CustomUtils.dart';

import 'ProductDetailsPage.dart';
import 'SeeAllProductPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: deprecated_member_use
  List<String> listImage = new List();
  // ignore: deprecated_member_use
  List<String> listShoesImage = new List();
  int selectedSliderPosition = 0;

  @override
  void initState() {
    super.initState();
    sliderImage();
    shoesImage();
  }

  void sliderImage() {
    listImage.add("images/laundry.jpg");
    listImage.add("images/fumigation.jpg");
    listImage.add("images/cleaning.jpg");
    listImage.add("images/sho.jpg");
    listImage.add("images/capet.jpeg");
    listImage.add("images/move.jpg");
    listImage.add("images/garden.jpeg");
    listImage.add("images/tank.png");
  }

  void shoesImage() {
    listShoesImage.add("images/carpet.jpg");
    listShoesImage.add("images/CLOTHS.jpg");
    listShoesImage.add("images/bag.jpeg");
    listShoesImage.add("images/blanket.jpeg");
    listShoesImage.add("images/shirt.jpeg");
    listShoesImage.add("images/tank.png");
    listShoesImage.add("images/Jacket.jpeg");
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      color: Color.fromARGB(255, 0, 255, 255),
                      height: height / 4,
                    ),
                    /*Search Section*/
                    Container(
                      margin:
                          const EdgeInsets.only(top: 48, right: 24, left: 24),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: "Search ",
                          labelText: 'Search',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          enabledBorder: CustomBorder.enabledBorder.copyWith(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
                          contentPadding: EdgeInsets.only(
                              top: 16, left: 12, right: 12, bottom: 8),
                          border: CustomBorder.enabledBorder.copyWith(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          filled: true,
                        ),
                      ),
                    ),
                    /*Slider Section*/
                    Container(
                        height: (height / 4) + 75,
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: height / 5,
                          child: PageView.builder(
                            itemBuilder: (context, position) {
                              return createSlider(listImage[position]);
                            },
                            controller: PageController(viewportFraction: .8),
                            itemCount: listImage.length,
                            onPageChanged: (position) {
                              /*setState(() {
                              selectedSliderPosition = position;
                            });*/
                            },
                          ),
                        ))
                  ],
                ),
                Utils.getSizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => SeeAllProductPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16),
                        child: Text(
                          "Top Search",
                          style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Text("View All",
                                style: CustomTextStyle.textFormFieldSemiBold
                                    .copyWith(
                                        color:
                                            Color.fromARGB(255, 0, 255, 255))),
                            // Icon(Icons.arrow_forward),
                            // Utils.getSizedBox(width: 16),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Utils.getSizedBox(height: 10),
                /*Group By Product Listing*/
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 200),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return createGroupBuyListItem(
                          listShoesImage[index], index);
                    },
                    itemCount: listShoesImage.length,
                  ),
                ),

                /*Most Big Product Listing*/
                Utils.getSizedBox(height: 30),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => SeeAllProductPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 16, left: 16),
                          child: Text(
                            "Hot Deals",
                            style: CustomTextStyle.textFormFieldSemiBold
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: <Widget>[
                              Text("View All",
                                  style: CustomTextStyle.textFormFieldSemiBold
                                      .copyWith(
                                          color: Color.fromARGB(
                                              255, 0, 255, 255))),
                            ],
                          ),
                        )
                      ],
                    )),
                Utils.getSizedBox(height: 10),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 200),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return createMostBigListItem(
                          listShoesImage[index], index, context);
                    },
                    itemCount: listShoesImage.length,
                  ),
                ),
                Utils.getSizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }

  createSlider(String image) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14))),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
      ),
    );
  }

  createGroupBuyListItem(String image, int index) {
    double leftMargin = 0;
    double rightMargin = 0;
    if (index != listShoesImage.length - 1) {
      leftMargin = 10;
    } else {
      leftMargin = 10;
      rightMargin = 10;
    }
    return Container(
      margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill),
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
            ),
            flex: 75,
          ),
          Expanded(
            flex: 25,
            child: Container(
              padding: EdgeInsets.only(left: leftMargin, right: rightMargin),
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Utils.getSizedBox(height: 8),
                  Text(
                    "Carpet",
                    style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                        color: Colors.black.withOpacity(.7), fontSize: 12),
                  ),
                  Utils.getSizedBox(height: 4),
                  Text(
                    "Exquisite you need him",
                    style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                        color: Colors.black.withOpacity(.7), fontSize: 10),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
            ),
          )
        ],
      ),
    );
  }

  createMostBigListItem(String image, int index, BuildContext context) {
    double leftMargin = 0;
    double rightMargin = 0;
    double radius = 16;
    if (index != listShoesImage.length - 1) {
      leftMargin = 10;
    } else {
      leftMargin = 10;
      rightMargin = 10;
    }
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: "$image,$index",
                child: Container(
                  width: 160,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.fill),
                      color: Colors.teal.shade200,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(radius),
                          topRight: Radius.circular(radius))),
                ),
                transitionOnUserGestures: true,
              ),
              flex: 75,
            ),
            Expanded(
              flex: 25,
              child: Container(
                padding: EdgeInsets.only(left: leftMargin, right: rightMargin),
                width: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Utils.getSizedBox(height: 8),
                    Text(
                      "Carpet",
                      style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                          color: Colors.black.withOpacity(.7), fontSize: 12),
                    ),
                    Utils.getSizedBox(height: 4),
                    Text(
                      "Exquisite you need him",
                      style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                          color: Colors.black.withOpacity(.7), fontSize: 10),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(radius),
                        bottomRight: Radius.circular(radius))),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => ProductDetailsPage("$image,$index")));
      },
    );
  }
}
