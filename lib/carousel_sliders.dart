import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CarouselSliders(),
  ));
}

class CarouselSliders extends StatefulWidget {
  const CarouselSliders({super.key});

  @override
  State<CarouselSliders> createState() => _CarouselSlidersState();
}

class _CarouselSlidersState extends State<CarouselSliders> {
  int i=0;
  CarouselController Conrtoler = CarouselController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CarouselSlider.builder(
              carouselController: Conrtoler,
              itemCount: 5,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  color: Colors.purple,
                );
              },
              options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  enableInfiniteScroll: false,
                  height: 180,
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.linear,
                  viewportFraction: 0.5,
                  aspectRatio: 0)),
          ElevatedButton(onPressed: () {
            if(i<4){
            i++;
            Conrtoler.animateToPage(i,duration: Duration(seconds: 2));
            }
            print("${i}");
            setState(() {

            });
          }, child: Text(">")),
          ElevatedButton(onPressed: () {
            if(i>0){
            i--;
              Conrtoler.animateToPage(i,duration: Duration(seconds: 2));
            }
            print("${i}");

            setState(() {

            });
          }, child: Text("<"))

        ],
      ),
    );
  }
}
