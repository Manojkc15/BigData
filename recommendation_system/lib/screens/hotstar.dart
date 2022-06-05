import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:recommendation_system/widgets/empty_card.dart';
import 'package:recommendation_system/widgets/size_helpers.dart';

import '../widgets/autorefresh.dart';

final movies = ['movie1', 'movie2', 'movie3', 'movie4', 'movie5'];

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
  @override
  Widget build(BuildContext context) {
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
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    iconSize: 35.0,
                    onPressed: () {
                      // print('icon pressed');
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
            ],
          ),
        ),
      ),
    );
  }
}
