import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:widgets_setion/main.dart';

class ImageSlider extends StatefulWidget {
  static String ImageSliderID = "SliderID";
  final String pageTitle;
  ImageSlider(this.pageTitle);
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex;

  List imageList = [
    "assets/images/image_0ne.jpg",
    "assets/images/image_Two.jpg",
    "assets/images/image_Three.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff363636),
      appBar: customAppBar(),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(widget.pageTitle,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildContainer(0),
                buildContainer(1),
                buildContainer(2),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            // vertical image slider
            CarouselSlider(
                items: imageList.map((imageUrl) {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 250,
                  initialPage: 0,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  scrollDirection: Axis.vertical,
                  enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: 1),
                )),
            SizedBox(
              height: 15,
            ),
            // horizontal image slider
            CarouselSlider.builder(
                itemCount: imageList.length,
                itemBuilder: (BuildContext context, int index, _) {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        imageList[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 250,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 1),
                )),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(index) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex == index ? Colors.red : Colors.lightBlue),
    );
  }

  Widget customAppBar() {
    return AppBar(
      title: const Text("ImageSlider"),
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 5),
        child: Row(
          children: [
            Expanded(
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (_) {
                        return MyApp();
                      }));
                    },
                    icon: Icon(Icons.arrow_back)))
          ],
        ),
      ),
      actions: [
        Row(children: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu))
        ]),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.pink, Colors.deepPurpleAccent])),
      ),
    );
  }
}
