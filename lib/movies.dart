import 'package:flutter/material.dart';
import 'package:movie_app/services/movie_services.dart';
import 'package:movie_app/widgets/drawer.dart';
import 'package:movie_app/widgets/footer.dart';
import 'package:movie_app/widgets/home_widgets/popular_movies_gridview.dart';
import 'package:movie_app/widgets/movies_widgets/movies_filter.dart';
import 'package:movie_app/widgets/navbar.dart';
import 'package:movie_app/widgets/skeletons/explore_popular_movies_skeleton.dart';

import 'models/movie_model.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<Movie> _topRatedMovies = [];
  List<Movie> _nowPlayingMovies = [];
  List<Movie> _popularMovies = [];
  List<Movie> _upcomingMovies = [];
  List<Movie> _currentMovies = [];
  int _selectedFilterIndex = 0;
  bool _isLoading = true;

  void callback(int index, List<Movie> movies) {
    setState(() {
      _selectedFilterIndex = index;
      _currentMovies = movies;
    });
  }

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
    _upcomingMovies = await movieServices.fetchUpcomingMovies();
    _currentMovies = _popularMovies;
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text(
                  'Explore Movies',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              MoviesFilter(
                topRatedMovies: _topRatedMovies,
                nowPlayingMovies: _nowPlayingMovies,
                popularMovies: _popularMovies,
                upcomingMovies: _upcomingMovies,
                currentMovies: _currentMovies,
                callback: callback,
                selectedFilterIndex: _selectedFilterIndex,
              ),
              _isLoading
                  ? LayoutBuilder(
                      builder: (context, constraints) {
                        double gridHeight =
                            (constraints.maxWidth / 5) * 1.25 * 3;
                        return SizedBox(
                          height: gridHeight,
                          child: const ExploreMoviesSkeleton(),
                        );
                      },
                    )
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        double gridHeight = (constraints.maxWidth / 5) *
                            1.25 *
                            (_popularMovies.length / 5);
                        return SizedBox(
                          height: gridHeight,
                          child: MoviesGridView(movies: _currentMovies),
                        );
                      },
                    ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
