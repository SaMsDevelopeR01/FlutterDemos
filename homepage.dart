import 'package:flutter/material.dart';
import 'package:food_delivery_owner/src/helpers/helper.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(image: AssetImage("assets/img/profile.png")),
        ),
      ),
      body: ListView(
        children: [
          RawChipHeader(),
          SearchBar(),
          Slider(),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text("Top Restaurant",
                  style: TextStyle(
                    color: Color(0xFF191E2F),
                    fontSize: 20,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w700,
                  )),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: TextStyle(
                    color: Color(0xFF191E2F),
                    fontSize: 14,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          TopRestaurant(),
        ],
      ),
    );
  }

  Widget RawChipHeader() {
    return Container(
      height: 90,
      child: ListView(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(10, (index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(start: 20),
            child: RawChip(
              elevation: 0,
              label: Text("$index"),
              labelStyle: isSelected
                  ? Theme.of(context)
                      .textTheme
                      .bodyText2
                      .merge(TextStyle(color: Theme.of(context).primaryColor))
                  : Theme.of(context).textTheme.bodyText2,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              backgroundColor: Theme.of(context).focusColor.withOpacity(0.1),
              selectedColor: Theme.of(context).accentColor,
              selected: isSelected,
              showCheckmark: false,
              onPressed: () {
                setState(() {
                  isSelected = isSelected ? false : true;
                });
              },
              // onSelected: (bool value) {
              //   setState(() {
              //isSelected = true;
              //   });
              // },
            ),
          );
        }),
      ),
    );
  }

  Widget SearchBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(55))),
        child: Row(
          children: <Widget>[
            IconButton(
              splashColor: Colors.grey,
              icon: Icon(
                Icons.search,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {},
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    hintText: "Restaurant Name,Food"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Slider() {
    return Container(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: Theme.of(context).accentColor.withOpacity(0.8),
            highlightColor: Colors.transparent,
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).accentColor.withOpacity(0.1),
                      blurRadius: 15,
                      offset: Offset(0, 5)),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Image(
                  image: AssetImage("assets/img/onbording_background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget TopRestaurant() {
    return Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: 292,
              margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).focusColor.withOpacity(0.1),
                      blurRadius: 15,
                      offset: Offset(0, 5)),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: Image(
                      height: 150,
                      image: AssetImage("assets/img/onbording_background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                             "Chuck’s Donut Int",
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              Helper.skipHtml("Donuts, Dessert, Breakfast, Takeo....."),
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: Theme.of(context).textTheme.caption,
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: Helper.getStarsList(double.parse(4.8.toString())),
                            ),
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
