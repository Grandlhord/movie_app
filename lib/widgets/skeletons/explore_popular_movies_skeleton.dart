import 'package:flutter/material.dart';

class ExploreMoviesSkeleton extends StatelessWidget {
  const ExploreMoviesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: 0.7),
        itemCount: 12,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
