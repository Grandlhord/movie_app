import 'package:flutter/material.dart';
import '../../models/movie_model.dart';

class NowPlaying extends StatelessWidget {
  final List<Movie> nowPlayingMovies;
  const NowPlaying({super.key, required this.nowPlayingMovies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: nowPlayingMovies.length-1,
        itemBuilder: (context, index) {
      final movie = nowPlayingMovies[index];
     return ListTile(
        onTap: () {},
        title: Text(
          movie.title,
          style: const TextStyle(
            color: Color(0xffe2b626),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          movie.overview,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        leading: Image.network(
          'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
          width: 80,
          height: 120,
          fit: BoxFit.cover,
        ),
      );
    });
  }
}
