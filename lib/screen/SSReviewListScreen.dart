import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/model/review_model.dart';
import 'package:sneaker_shopping_prokit/providers/initial_provider.dart';
import 'package:sneaker_shopping_prokit/providers/review_provider.dart';

import '../main.dart';

class ReviewListScreen extends StatelessWidget {
  final ReviewData reviewData;
  final String productId;
  const ReviewListScreen(
      {Key? key, required this.reviewData, required this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ReviewProvider()..getReviews(productId),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              finish(context);
            },
            child:
                Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
          ),
          backgroundColor: appStore.appBarColor,
          title: Text(
            'Reviews',
            style: TextStyle(
              color: appStore.textPrimaryColor,
            ),
          ),
        ),
        body: Consumer<ReviewProvider>(builder: (context, reviewData, child) {
          if (reviewData.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
                itemCount: (reviewData.reviewItems.length),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final review = reviewData.reviewItems[index];

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0x4d9e9e9e))),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              initialRating: double.parse("${review.rating}"),
                              glow: false,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemSize: 20,
                              ignoreGestures: true,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.green,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            Row(
                              children: [
                                Text("${review.reviewer?.name}",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: boldTextStyle(
                                        size: 12, color: Colors.grey)),
                                if (context
                                        .read<InitialProvider>()
                                        .currentUser
                                        ?.userId ==
                                    review.userId)
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: PopupMenuButton(
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (popupContext) {
                                          return [
                                            PopupMenuItem(
                                              onTap: () async {
                                                Future.delayed(
                                                    Duration(seconds: 0),
                                                    () async {
                                                  await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              "Delete Review"),
                                                          content: Text(
                                                              "Are you sure you want to delete this review?"),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      dialogContext);
                                                                },
                                                                child: Text(
                                                                    "Cancel")),
                                                            TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  await reviewData
                                                                      .deleteReview(
                                                                          review
                                                                              .id!);
                                                                  Navigator.pop(
                                                                      dialogContext);
                                                                },
                                                                child: Text(
                                                                    "Delete")),
                                                          ],
                                                        );
                                                      });
                                                });
                                              },
                                              child: Text("Delete"),
                                            )
                                          ];
                                        }),
                                  ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("${review?.comment}",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style:
                                boldTextStyle(size: 12, color: Colors.black)),
                        SizedBox(
                          height: 5,
                        ),
                        if (review.images?.first != "")
                          SizedBox(
                              height: 100,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: review.images?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${review.images?[index]}"),
                                              fit: BoxFit.fill)),
                                    );
                                  }))
                      ],
                    ),
                  );
                }),
          );
        }),
      ),
    );
  }
}
