import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/services/movie_services.dart';
import 'package:movie_app/widgets/footer.dart';
import 'package:movie_app/widgets/home_widgets/custom_carousel_slider.dart';
import 'package:movie_app/widgets/home_widgets/now_playing_list.dart';
import 'package:movie_app/widgets/home_widgets/popular_movies_gridview.dart';
import 'package:movie_app/widgets/skeletons/carousel_skeleton.dart';
import 'package:movie_app/widgets/drawer.dart';
import 'package:movie_app/widgets/navbar.dart';
import 'package:movie_app/widgets/skeletons/explore_popular_movies_skeleton.dart';
import 'package:movie_app/widgets/skeletons/now_playing_skeleton.dart';

import 'models/movie_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> _topRatedMovies = [];
  List<Movie> _nowPlayingMovies = [];
  List<Movie> _popularMovies = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    MovieServices movieServices = MovieServices();
    _topRatedMovies = await movieServices.fetchTopRatedMovies();
    _nowPlayingMovies = await movieServices.fetchNowPlayingMovies();
    _popularMovies = await movieServices.fetchPopularMovies();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Top Rated Movies',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: _isLoading
                        ? const CarouselSkeleton()
                        : CustomCarouselSlider(
                            topRatedMovie: _topRatedMovies,
                          ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Now Playing',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 350,
                        height: 470,
                        child: _isLoading
                            ? const NowPlayingSkeleton()
                            : NowPlaying(nowPlayingMovies: _nowPlayingMovies),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Explore Popular Movies',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child:  _isLoading ?LayoutBuilder(builder: (context, constraints) {
                double gridHeight = (constraints.maxWidth / 4) * 1.4 * 3;
                return SizedBox(
                  height: gridHeight,
                  child: const ExploreMoviesSkeleton(),
                );
              }): LayoutBuilder(builder: (context, constraints) {
                double gridHeight = (constraints.maxWidth / 5) * 1.25 * (_popularMovies.length/5);
                return SizedBox(
                  height: gridHeight,
                  child:  MoviesGridView(movies: _popularMovies),
                );
              })
            ),
            const SizedBox(
              height: 8,
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
