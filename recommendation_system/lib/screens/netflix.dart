import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:recommendation_system/widgets/empty_card.dart';
import 'package:recommendation_system/widgets/size_helpers.dart';
import 'package:http/http.dart';
import "../widgets/netflix_IMDb_images.dart";

List<String> movies = ['movie1', 'movie2', 'movie3', 'movie4', 'movie5'];

class Netflix extends StatelessWidget {
  const Netflix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE50914),
        title: const Text(
          "Netflix Recommendation system",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      body: const RecommendationWidget(),
    );
  }
}

class RecommendationWidget extends StatefulWidget {
  const RecommendationWidget({Key? key}) : super(key: key);

  @override
  State<RecommendationWidget> createState() => _RecommendationWidgetState();
}

class _RecommendationWidgetState extends State<RecommendationWidget> {
  Future<void> _showMyDialog(
      {required String title, required String description}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(description),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Future<List<String>> getMovies() async {
  // var url = "https://reccomndsys.herokuapp.com/recommend/PK";
  // final response = await get(Uri.parse(url));
  // String response_str = response.body;
  // List<String> movies_list =
  //     response_str.substring(1, response_str.length - 1).split(',');

  // // print(response.body.runtimeType);
  // print(movies_list);
  // // movies = List.from(movies_list);
  // return movies_list;
  // }

  @override
  Widget build(BuildContext context) {
    bool rebuild = false;
    final myController = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myController.dispose();
      super.dispose();
    }

    double height = getHeight(context);
    return Transform.scale(
      scale: 0.80,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    iconSize: 35.0,
                    onPressed: () async {
                      if (myController.text.length > 1) {
                        rebuild = true;
                        // print(rebuild);
                        // List<String> movies_list = getMovies();
                        // print('icon pressed');
                        var url =
                            "https://reccomndsys.herokuapp.com/recommend/${myController.text}";
                        final response = await get(Uri.parse(url));
                        // print("status ${response.statusCode}");
                        String responseStr = response.body;
                        List<String> moviesList = responseStr
                            .substring(1, responseStr.length - 1)
                            .split(',');
                        // print(movies_list.length);
                        if (moviesList.length > 1) {
                          for (int i = 0; i < moviesList.length; i++) {
                            moviesList[i] = moviesList[i]
                                .substring(1, moviesList[i].length - 1);
                          }

                          setState(() {
                            movies = List.from(moviesList);
                          });
                          // print(response.body.runtimeType);
                          // print(movies_list);
                          // movies = List.from(movies_list);
                        } else {
                          // print("no moives");
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Movie not found'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: const <Widget>[
                                      Text('Please enter a valid movie name'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      } else {
                        _showMyDialog(
                            title: 'Search field cannot be empty',
                            description: 'Please enter a movie name');
                      }
                    },
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 250, 215, 216),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffEDF9FE), width: 0.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(34.0),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffEDF9FE), width: 0.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(34.0),
                    ),
                  ),
                  // labelText: 'Enter Name',
                  hintText: 'Enter a movie',
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                height: (475 / height) * height,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 250, 215, 216),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
                child: SafeArea(
                  child: AnimationLimiter(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 44.0,
                            child: FadeInAnimation(
                              child: EmptyCard(
                                tileColor: const Color(0xffE50914),
                                textColor: Colors.white,
                                moviename: movies[index],
                                width: MediaQuery.of(context).size.width,
                                height: 75.0,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 40.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffE50914),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const NetflixIMDbImages();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Images",
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
