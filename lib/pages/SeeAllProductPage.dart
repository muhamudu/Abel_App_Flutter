// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:live_clean/pages/CartPage.dart';
import 'package:live_clean/pages/SearchPage.dart';
import 'package:live_clean/utils/CustomTextStyle.dart';
import 'package:live_clean/utils/CustomUtils.dart';

class SeeAllProductPage extends StatefulWidget {
  @override
  _SeeAllProductPageState createState() => _SeeAllProductPageState();
}

class _SeeAllProductPageState extends State<SeeAllProductPage> {
  List<String> listImage = new List();
  List<Color> listItemColor = new List();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    addImage();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            child: filterSortListOption(),
            preferredSize: Size(double.infinity, 44)),
        title: Text(
          "All Products",
          style: CustomTextStyle.textFormFieldBold.copyWith(
              fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
        ),
        elevation: 1,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SearchPage())),
            icon: Icon(Icons.search),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => CartPage())),
            icon: Icon(Icons.shopping_cart),
            color: Colors.black,
          )
        ],
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Builder(
        builder: (context) {
          return Container(
            color: Colors.grey.shade100,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.68),
              itemBuilder: (context, position) {
                return gridItem(context, position);
              },
              itemCount: listImage.length,
            ),
            margin: EdgeInsets.only(bottom: 8, left: 4, right: 4, top: 8),
          );
        },
      ),
    );
  }

  filterSortListOption() {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: filterRow(Icons.filter_list, "Filter"),
            flex: 30,
          ),
          divider(),
          Expanded(
            child: filterRow(Icons.sort, "Sort"),
            flex: 30,
          ),
          divider(),
          Expanded(
            child: filterRow(Icons.list, "List"),
            flex: 30,
          ),
        ],
      ),
    );
  }

  divider() {
    return Container(
      width: 2,
      color: Colors.grey.shade400,
      height: 20,
    );
  }

  filterRow(IconData icon, String title) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.grey,
          ),
          Utils.getSizedBox(width: 4),
          Text(
            title,
            style: CustomTextStyle.textFormFieldBold
                .copyWith(color: Colors.black.withOpacity(0.8), fontSize: 12),
          )
        ],
      ),
    );
  }

  gridItem(BuildContext context, int position) {
    return GestureDetector(
      onTap: () {
        filterBottomSheet(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: Colors.grey.shade200)),
        padding: EdgeInsets.only(left: 10, top: 10),
        margin: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 12),
              alignment: Alignment.topRight,
              child: Container(
                alignment: Alignment.center,
                width: 24,
                height: 24,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.indigo),
                child: Text(
                  "30%",
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.textFormFieldBold
                      .copyWith(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
            Image(
              image: AssetImage(listImage[position]),
              height: 150,
              fit: BoxFit.fill,
            ),
            gridBottomView()
          ],
        ),
      ),
    );
  }

  gridBottomView() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              "Jacket",
              style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 12),
              textAlign: TextAlign.start,
            ),
            alignment: Alignment.topLeft,
          ),
          Utils.getSizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "\Rwf 4550.00",
                style: CustomTextStyle.textFormFieldBold
                    .copyWith(color: Colors.indigo.shade700, fontSize: 12),
              ),
              Utils.getSizedBox(width: 8),
              Text(
                "\Rwf 8880.00",
                style: CustomTextStyle.textFormFieldBold.copyWith(
                    color: Colors.grey,
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
          Utils.getSizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FlutterRatingBar(
                initialRating: 4,
                itemSize: 14,
                itemCount: 5,
                fillColor: Colors.amber,
                borderColor: Colors.amber.withAlpha(50),
                allowHalfRating: true,
                onRatingUpdate: (rating) {},
              ),
              Utils.getSizedBox(width: 4),
              Text(
                "4.5",
                style: CustomTextStyle.textFormFieldMedium
                    .copyWith(color: Colors.black, fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
  }

  void addImage() {
    listImage.add("images/capet.jpeg");
    listImage.add("images/CLOTHS.jpg");
    listImage.add("images/bag.jpeg");
    listImage.add("images/blanket.jpeg");
    listImage.add("images/shirt.jpeg");
    listImage.add("images/Jacket.jpeg");
    listImage.add("images/sofa.jpg");
    listImage.add("images/suit.jpg");
    listImage.add("images/dress.jpg");
    listImage.add("images/pant.jpg");
    listImage.add("images/Flat.jpeg");
    listImage.add("images/garden.jpeg");
  }

  filterBottomSheet(BuildContext context) {
    _scaffoldKey.currentState.showBottomSheet(
      (context) {
        return filterBottomSheetContent();
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
    );
  }

  filterBottomSheetContent() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200, width: 1),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(16), topLeft: Radius.circular(16)),
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Utils.getSizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SeeAllProductPage()),
                    );
                    Text(
                      "Filter",
                      style: CustomTextStyle.textFormFieldMedium.copyWith(
                          color: Colors.black.withOpacity(0.8), fontSize: 16),
                    );
                    Text(
                      "Reset",
                      style: CustomTextStyle.textFormFieldBold
                          .copyWith(color: Colors.indigo, fontSize: 16),
                    );
                  })
            ],
          ),
          Utils.getSizedBox(height: 28),
          Container(
            child: Text("Number of items",
                style: CustomTextStyle.textFormFieldMedium),
            margin: EdgeInsets.only(left: 4),
          ),
          Utils.getSizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter number of items",
                      hintStyle: CustomTextStyle.textFormFieldMedium
                          .copyWith(color: Colors.grey.shade800),
                      focusedBorder: border,
                      contentPadding: EdgeInsets.only(
                          right: 8, left: 8, top: 12, bottom: 12),
                      border: border,
                      enabledBorder: border,
                    ),
                  ),
                ),
                flex: 47,
              ),
            ],
          ),
          Utils.getSizedBox(height: 16),
          Container(
            child: Text("Item Filter",
                style:
                    CustomTextStyle.textFormFieldMedium.copyWith(fontSize: 16)),
            margin: EdgeInsets.only(left: 4),
          ),
          Utils.getSizedBox(height: 8),
          ListView.builder(
            primary: false,
            itemBuilder: (context, position) {
              return Container(
                margin: EdgeInsets.only(top: 4, bottom: 4, left: 4),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Discount",
                          style: CustomTextStyle.textFormFieldRegular
                              .copyWith(fontSize: 14, color: Colors.grey),
                        ),
                        Icon(
                          Icons.check,
                          color: Color.fromARGB(255, 0, 37, 199),
                        )
                      ],
                    ),
                    Utils.getSizedBox(height: 4),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey,
                    )
                  ],
                ),
              );
            },
            itemCount: 3,
            shrinkWrap: true,
          ),
          Utils.getSizedBox(height: 8),
          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Text(
                "Add to Cart",
                style: CustomTextStyle.textFormFieldMedium
                    .copyWith(color: Colors.white),
              ),
              color: Color.fromARGB(255, 0, 255, 255),
            ),
          )
        ],
      ),
    );
  }

  var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1));
}
