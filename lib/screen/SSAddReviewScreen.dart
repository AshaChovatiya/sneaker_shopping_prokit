import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/providers/review_provider.dart';

import '../main.dart';
import '../utils/SSWidgets.dart';

class AddReviewScreen extends StatelessWidget {
  AddReviewScreen({Key? key, required this.productId}) : super(key: key);

  final String productId;
  int rattingValue = 0;
  final titleController = TextEditingController();
  final commentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ReviewProvider(),
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
            'Add Review',
            style: TextStyle(
              color: appStore.textPrimaryColor,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                      textEditingController: titleController),
                  SizedBox(height: 12),
                  Text(
                    'Comment *',
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: secondaryTextStyle(),
                  ),
                  TextFormField(
                    controller: commentController,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    validator:
                        RequiredValidator(errorText: 'Please Enter Comment'),
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: Color(0xff000000), width: 1),
                      ),
                      hintText: 'This is a best Product.....',
                      hintStyle: boldTextStyle(
                          size: 14, color: Colors.grey.withOpacity(0.5)),
                      filled: true,
                      fillColor: Color(0x00f2f2f3),
                      isDense: false,
                      contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                    ),
                  ),
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
                      rattingValue = int.parse(rating.toString());
                    },
                  ),
                  SizedBox(height: 20),
                  Consumer<ReviewProvider>(
                      builder: (context, reviewProvider, _) => InkWell(
                            onTap: () {
                              reviewProvider.pickImage();
                            },
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Color(0x4d9e9e9e))),
                              height: 100,
                              width: 100,
                              child: reviewProvider.image != null
                                  ? Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.file(
                                                File(
                                                    reviewProvider.image!.path),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            reviewProvider.deleteImage();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Color(0x4d9e9e9e))),
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : Icon(Icons.add,
                                      color: Colors.grey, size: 30),
                            ),
                          ))
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Consumer<ReviewProvider>(
            builder: (context, reviewProvider, _) => reviewProvider.isLoading
                ? Center(
                  child: Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: appStore.isDarkModeOn
                            ? context.cardColor
                            : Color(0xff010101),
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                      ),
                      child: Center(
                          child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )),
                    ),
                )
                : Padding(
                    padding: EdgeInsets.all(16),
                    child: sSAppButton(
                      context: context,
                      title: 'Submit',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          reviewProvider.createReview(
                              comment: commentController.text,
                              title: titleController.text,
                              productId: productId,
                              rating: rattingValue);
                        }
                      },
                    ),
                  )),
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
        TextFormField(
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
