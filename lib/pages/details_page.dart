import 'package:flutter/material.dart';
import 'package:pok_mon/pages/my_title.dart';
import 'package:pok_mon/power_badge.dart';

import 'feature_tile_text.dart';
import 'feature_value_text.dart';

class DetailsPage extends StatelessWidget {
  final Map? data;
  const DetailsPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4ad0b0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyTitle(
                            text: "${data!["name"]}",
                            color: Colors.white,
                          ),
                          Row(
                            children: [
                              for (String item in data!["type"])
                                PowerBadge(text: "$item")
                            ],
                          ),
                          Container(
                            height: 150.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                      height: 600.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.0),
                            topLeft: Radius.circular(15.0)),
                      ),
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: EdgeInsets.only(top: 60.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FeatureTitleText(text: "Height"),
                                        FeatureTitleText(text: "Weight"),
                                        FeatureTitleText(text: "Candy"),
                                        FeatureTitleText(text: "Egg"),
                                        FeatureTitleText(text: "candy_count"),
                                        FeatureTitleText(text: "id"),
                                        FeatureTitleText(text: "num"),
                                        FeatureTitleText(text: "spawn_chance"),
                                        FeatureTitleText(text: "spawn_time"),
                                        FeatureTitleText(text: "avg_spawns"),
                                      ],
                                    ),
                                    height: 600.0,
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    padding: EdgeInsets.only(top: 60.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FeatureValueText(
                                            text: "${data!["height"]}"),
                                        FeatureValueText(
                                            text: "${data!["weight"]}"),
                                        FeatureValueText(
                                            text: "${data!["candy"]}"),
                                        FeatureValueText(
                                            text: "${data!["egg"]}"),
                                        FeatureValueText(
                                            text: "${data!["candy_count"]}"),
                                        FeatureValueText(
                                            text: "${data!["id"]}"),
                                        FeatureValueText(
                                            text: "${data!["num"]}"),
                                        FeatureValueText(
                                            text: "${data!["spawn_chance"]}"),
                                        FeatureValueText(
                                            text: "${data!["spawn_time"]}"),
                                        FeatureValueText(
                                            text: "${data!["avg_spawns"]}"),
                                      ],
                                    ),
                                    height: 600.0,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
            Positioned(
              top: 60.0,
              child: Container(
                child: Hero(
                  tag: "PokeCard-${data!["name"]}",
                  child: Image.network(
                    "${data!["img"]}",
                    fit: BoxFit.fill,
                  ),
                ),
                height: 240.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
