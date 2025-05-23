import 'package:flutter/material.dart';

import '../../models/movie_model.dart';

class MoviesFilter extends StatefulWidget {
  final List<Movie> topRatedMovies;
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> upcomingMovies;
  final List<Movie> currentMovies;
  final Function callback;
  int selectedFilterIndex = 0;

  MoviesFilter({
    super.key,
    required this.topRatedMovies,
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.upcomingMovies,
    required this.currentMovies,
    this.selectedFilterIndex = 0,
    required this.callback,
  });

  @override
  State<MoviesFilter> createState() => _MoviesFilterState();
}

class _MoviesFilterState extends State<MoviesFilter> {
  List<Movie> movies = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                widget.callback(0, widget.popularMovies);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade800),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Popular',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: widget.selectedFilterIndex == 0
                        ? const Color(0xffe2b616)
                        : Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.callback(1, widget.nowPlayingMovies);
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade800),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Now PLaying',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: widget.selectedFilterIndex == 1
                        ? const Color(0xffe2b616)
                        : Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.callback(2, widget.upcomingMovies);
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade800),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'UpComing Movies',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: widget.selectedFilterIndex == 2
                        ? const Color(0xffe2b616)
                        : Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.callback(3, widget.topRatedMovies);
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade800),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Top Rated',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: widget.selectedFilterIndex == 3
                        ? const Color(0xffe2b616)
                        : Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
