import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:recommendation_system/widgets/empty_card.dart';

import '../widgets/autorefresh.dart';

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
    return Scaffold(
      body: SafeArea(
        child: AnimationLimiter(
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 44.0,
                  child: FadeInAnimation(
                    child: EmptyCard(
                      width: MediaQuery.of(context).size.width,
                      height: 88.0,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
