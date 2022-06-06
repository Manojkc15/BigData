import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:recommendation_system/widgets/empty_card.dart';
import 'package:recommendation_system/widgets/size_helpers.dart';
import 'package:http/http.dart';
import '../widgets/autorefresh.dart';

List<String> movies = ['movie1', 'movie2', 'movie3', 'movie4', 'movie5'];

class Hotstar extends StatelessWidget {
  const Hotstar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hotstar Recommendation system",
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
                      rebuild = true;
                      print(rebuild);
                      // List<String> movies_list = getMovies();
                      // print('icon pressed');
                      var url =
                          "https://reccomndsys.herokuapp.com/recommend/${myController.text}";
                      final response = await get(Uri.parse(url));
                      String response_str = response.body;
                      List<String> movies_list = response_str
                          .substring(1, response_str.length - 1)
                          .split(',');

                      for (int i = 0; i < movies_list.length; i++) {
                        movies_list[i] = movies_list[i]
                            .substring(1, movies_list[i].length - 1);
                      }

                      setState(() {
                        movies = List.from(movies_list);
                      });
                      // print(response.body.runtimeType);
                      // print(movies_list);
                      // movies = List.from(movies_list);
                    },
                  ),
                  filled: true,
                  fillColor: const Color(0xffEDF9FE),
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
                height: (465 / height) * height,
                decoration: const BoxDecoration(
                  color: Color(0xffEDF9FE),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
                child: SafeArea(
                  child: AutoRefresh(
                    duration: myController.text.isNotEmpty
                        ? Duration(milliseconds: 1000)
                        : Duration(days: 3),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
