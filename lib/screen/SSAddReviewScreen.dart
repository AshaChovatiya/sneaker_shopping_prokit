import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/SSWidgets.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({Key? key}) : super(key: key);

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
          'Add Review',
          style: TextStyle(
            color: appStore.textPrimaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Add product Review",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: boldTextStyle(),
              ),
              SizedBox(height: 12),
              commonTextField(
                  title: 'Title',
                  hintText: 'Good Product',
                  textEditingController: TextEditingController()),
              SizedBox(height: 12),
              commonTextField(
                  title: 'Comment *',
                  hintText: 'This is a best Product.....',
                  textEditingController: TextEditingController()),
              SizedBox(height: 20),
              Text(
                'Give a Ratting *',
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: secondaryTextStyle(),
              ),
              SizedBox(height: 8),
              RatingBar.builder(
                initialRating: 4,
                glow: false,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 35,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.green,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              )
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(16),
        child: sSAppButton(
          context: context,
          title: 'Submit',
          onPressed: () async {},
        ),
      ),
    );
  }

  Widget commonTextField(
      {required String title,
      required String hintText,
      required TextEditingController textEditingController}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
          style: secondaryTextStyle(),
        ),
        TextField(
          controller: textEditingController,
          obscureText: false,
          textAlign: TextAlign.start,
          maxLines: 1,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xff000000),
          ),
          decoration: InputDecoration(
            disabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: Color(0xff000000), width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: Color(0xff000000), width: 1),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: Color(0xff000000), width: 1),
            ),
            hintText: hintText,
            hintStyle:
                boldTextStyle(size: 14, color: Colors.grey.withOpacity(0.5)),
            filled: true,
            fillColor: Color(0x00f2f2f3),
            isDense: false,
            contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
          ),
        ),
      ],
    );
  }
}
