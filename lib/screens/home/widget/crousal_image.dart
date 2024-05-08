// import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopping/constant/globle_variable.dart';

class CrouseImage extends StatelessWidget {
  const CrouseImage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Swiper(
    //   itemBuilder: (context, index) {
    //     return Image.network(
    //       GlobalVariables.carouselImages[index],
    //       fit: BoxFit.fill,
    //       height: 200,
    //     );
    //   },
    //   itemCount: GlobalVariables.carouselImages.length,
    //   autoplay: true,
    // );
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map((i) {
        return Builder(
          builder: (BuildContext context) => Image.network(
            i,
            fit: BoxFit.cover,
            height: 200,
          ),
        );
      }).toList(),
      options: CarouselOptions(
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        autoPlay: true,
        viewportFraction: 1,
        height: 200,
        disableCenter: true,
      ),
    );
  }
}
