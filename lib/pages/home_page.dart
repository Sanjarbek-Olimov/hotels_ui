import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;


  List<String> images = [
    "assets/images/ic_header.jpg",
    "assets/images/ic_hotel0.jpg",
    "assets/images/ic_hotel1.jpg",
    "assets/images/ic_hotel2.jpg",
    "assets/images/ic_hotel3.jpg",
    "assets/images/ic_hotel4.jpg",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: isLoading?_shimmer(_mainBody(context),):_mainBody(context)
      ),
    );
  }

  Column _mainBody(BuildContext context) {
    return Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.31,
            child: Stack(
              children: [
                CarouselSlider.builder(
                    itemCount: images.length,
                    itemBuilder: (context, int index, int pageIndex){
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.31,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(images.elementAt(index)), fit: BoxFit.cover)),
                      );
                    },
                    options: CarouselOptions(
                        autoPlayCurve: Curves.easeOutSine,
                        autoPlay: true,
                        viewportFraction: 1,
                        aspectRatio: 2.9/2
                    )),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(.2),
                            Colors.black.withOpacity(.1),
                          ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "What kind of hotel you need?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: const TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              hintText: "Search for hotels...",
                              hintStyle: TextStyle(fontSize: 18),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: isLoading?Container(
                height: MediaQuery.of(context).size.height*0.02,
                color: Colors.grey,
              ):Text(
                "Business Hotels",
                style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          // #best_hotels_list
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: MediaQuery.of(context).size.height * 0.22,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _bestHotels(index);
                }),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: isLoading?Container(
                height: MediaQuery.of(context).size.height*0.02,
                color: Colors.grey,
              ):Text(
                "Luxury Hotels",
                style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          // #luxury_hotels_list
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: MediaQuery.of(context).size.height * 0.22,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _luxuryHotels(index);
                }),
          ),
        ],
      );
  }

  Widget _bestHotels(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage("assets/images/ic_hotel${index % 5}.jpg"),
              fit: BoxFit.cover)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(.2),
                  Colors.black.withOpacity(.1),
                ])),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text(
          "Hotel ${index + 1}",
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget _luxuryHotels(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage(
                  "assets/images/ic_hotel${(index * 2 + 4) % 5}.jpg"),
              fit: BoxFit.cover)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(.2),
                  Colors.black.withOpacity(.1),
                ])),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text(
          "Hotel ${index + 1}",
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget _shimmer(child) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade100,
      child: child,
    );
  }
}
