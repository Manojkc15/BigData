import 'package:flutter/material.dart';

class DisneyHotstarImages extends StatefulWidget {
  const DisneyHotstarImages({Key? key}) : super(key: key);

  @override
  State<DisneyHotstarImages> createState() => _ImagesState();
}

class _ImagesState extends State<DisneyHotstarImages> {
  final List<String> images = [
    'Cumulative_IMDB_Ratings_grouped_by_runtimes.png',
    'Distribution_of_IMBD_Ratings.png',
    'Distribution_of_movie_show_runtimes.png',
    'Distribution_of_show_types.png',
    'Distribution_of_show_years.png',
    'Sum_of_IMDB_Ratings_grouped_by_Age_Ratings.png',
    'Sum_of_IMDB_Ratings_per_show_types.png',
    'Sum_of_Imdb_ratings_per_year.png',
    'Top_10_Directors.png',
    'Top_10_Episodes_with_highest_IMDB_Rating.png',
    'Top_10_Episodes_with_the_Highest_IMDB_Ratings.png',
    'Top_10_Genres.png',
    'Top_10_Genres_with_the_highest_sum_of_IMDB_ratings.png',
    'Top_10_Languages.png',
    'Top_10_movies_shows_with_the_most_runtimes.png',
    'Top_10_Movies_with_highest_IMDB_Rating.png',
    'Top_10_Movies_with_the_Highest_IMDB_Ratings.png',
    'Top_10_Runtimes_with_the_highest_sum_of_IMDB_Ratings.png',
    'Top_10_Series_with_highest_IMDB_Rating.png',
    'Top_10_Series_with_the_Highest_IMDB_Ratings.png',
    'Top_10_shows_movies_episodes_with_the_Highest_IMDB_Ratings.png',
    'Top_10_Writers.png',
    'Top_10_years_with_the_highest_Cumulative_IMDB_ratings.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4a62d8),
        title: const Text(
          "Disney+ Hotstar Images",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1.0),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    offset: const Offset(0, 1),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                child: Image.asset(
                  "assets/disney+images/${images[index]}",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              ),
            );
          }),
    );
  }
}
