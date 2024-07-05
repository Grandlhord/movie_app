import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/movie_model.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List<Movie> topRatedMovie;
  const CustomCarouselSlider({super.key, required this.topRatedMovie});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: topRatedMovie.map((movie) {
          return Builder(builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            );
          });
        }).toList(),
        options: CarouselOptions(
          height: 500,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
          enableInfiniteScroll: true,
          pageSnapping: true,
          enlargeCenterPage: true,
          viewportFraction: 1.0,
        ));
  }
}
