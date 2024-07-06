import 'package:flutter/material.dart';

import '../../models/movie_model.dart';

class MoviesGridView extends StatefulWidget {
  final List<Movie> movies;

  const MoviesGridView({super.key, required this.movies});

  @override
  State<MoviesGridView> createState() => _MoviesGridViewState();
}

class _MoviesGridViewState extends State<MoviesGridView> {
  int? _hoverIndex;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: 0.8),
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          final movie = widget.movies[index];
          return MouseRegion(
            onEnter: (_) {
              setState(() {
                _hoverIndex = index;
              });
            },
            onExit: (_) {
              setState(() {
                _hoverIndex = null;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform: _hoverIndex == index
                  ? (Matrix4.identity()
                    ..scale(1.05, 1.05)
                    ..translate(0, -10))
                  : Matrix4.identity(),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    elevation: _hoverIndex == index ? 20 : 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 200,
                            ),
                          ),
                        ),
                        Expanded(
                            child: ListView(
                          padding: const EdgeInsets.all(8),
                          children: [
                            Text(
                              movie.title,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text('Votes: ${movie.voteCount}'),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0XFFE2B216),
                                ),
                                Text(
                                  movie.voteAverage.toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text('Release Date: ${movie.releaseDate}'),
                            SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text('Language: ${movie.originalLanguage}'),
                            SizedBox(
                              height: 4,
                            ),
                            Text('Adult Movie ${movie.adult ? 'Yes' : 'No'}'),
                            SizedBox(
                              height: 4,
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
