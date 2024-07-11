import 'package:flutter/material.dart';
import 'package:movie_app/services/movie_services.dart';

import '../models/movie_model.dart';

class SearchPage extends StatefulWidget {
  final String query;
  const SearchPage({super.key, required this.query});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Movie> movies =[];
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async{
    movies = await MovieServices().searchMovies(widget.query);
    setState(() {
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('data'),);
  }
}
