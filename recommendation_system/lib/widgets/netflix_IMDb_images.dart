// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NetflixIMDbImages extends StatefulWidget {
  const NetflixIMDbImages({Key? key}) : super(key: key);

  @override
  State<NetflixIMDbImages> createState() => _ImagesState();
}

class _ImagesState extends State<NetflixIMDbImages> {
  List<String> images = [
    'Analyses_By_Age.svg',
    'Contents_Form_India.svg',
    'Distribution_according_to_countries.svg',
    'Rating_Analysis.svg',
    'Stories_From_books_Or_Not.svg',
    'TV_Show_vs_Movies.svg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE50914),
        title: const Text(
          "Netflix IMDb Images",
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
                "assets/netflix_IMDb_images/${images[index]}",
                // height: 340.0,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            );
          }),
    );
  }
}
