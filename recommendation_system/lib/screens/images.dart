import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Images extends StatefulWidget {
  const Images({Key? key}) : super(key: key);

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  List<String> images = [
    'bar_pie_plots_20_countries.svg',
    'heatmap_movie_genre.svg',
    'heatmap_top_20_countries.svg',
    'heatmap_tv_show_genre.svg',
    'Netflix_Contents_Count_Soared.svg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Images",
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
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10.0,
                    // spreadRadius: 1.0,
                    offset: const Offset(0, .5),
                  )
                ],
              ),
              child: SvgPicture.asset(
                "assets/story-telling-images/${images[index]}",
                // height: 340.0,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            );
          }),
    );
  }
}
