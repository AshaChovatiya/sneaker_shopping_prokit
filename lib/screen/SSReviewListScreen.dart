import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class ReviewListScreen extends StatelessWidget {
  const ReviewListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
        backgroundColor: appStore.appBarColor,
        title: Text(
          'Reviews',
          style: TextStyle(
            color: appStore.textPrimaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
              margin:
              EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(10),
                  border: Border.all(
                      color: Color(0x4d9e9e9e))),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.start,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text("Available Sizes",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: boldTextStyle(size: 14)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Available Sizes",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: boldTextStyle(
                          size: 12,
                          color: Colors.grey)),
                  SizedBox(
                    height: 5,
                  ),
                  RatingBar.builder(
                    initialRating: 4,
                    glow: false,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 20,
                    ignoreGestures: true,
                    itemPadding: EdgeInsets.symmetric(
                        horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.green,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
