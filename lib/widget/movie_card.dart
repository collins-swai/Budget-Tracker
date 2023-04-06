import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../presentation/bloc/movie_cubit/movie_state.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget(
      {super.key, required this.movieFetched, required this.onClick});
  final Function(int id) onClick;
  final MovieFetched movieFetched;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double size = 18.0;

    return GridView.builder(
      shrinkWrap: true,
      itemCount: movieFetched.moviesCard.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (1 / 1.6),
      ),
      itemBuilder: (context, index) {
        final movie = movieFetched.moviesCard[index];
        return GestureDetector(
          onTap: () => onClick(movie.id),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // height: 400,
              // width: 180.00,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 8, 8, 8),
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                      "https://image.tmdb.org/t/p/w300${movie.posterPath}",
                      height: 150,
                      fit: BoxFit.fitWidth,
                      width: width * 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          '(${movie.releaseDate.year})',
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: size,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: size,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: size,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: size,
                            ),
                            Icon(
                              Icons.star_half,
                              color: Colors.amber,
                              size: size,
                            )
                          ],
                        ),
                        Text(
                          "${movie.overview.substring(0, 30)}.......",
                          // maxLines: null,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}