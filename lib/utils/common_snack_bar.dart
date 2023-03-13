import 'package:flutter/material.dart';

enum SnackBarType {
  SUCCESS,
  ERROR,
  WARNING,
  INFO,
}

class GlobalSnackBar {
  final String message;

  const GlobalSnackBar({
    required this.message,
  });

  static show({
    required BuildContext context,
    required String message,
    SnackBarType type = SnackBarType.INFO,
  }) {
    Widget snackBarWidget = Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          type == SnackBarType.ERROR
              ? Icon(
                  Icons.info_outline,
                  color: Colors.red,
                )
              : type == SnackBarType.SUCCESS
                  ? Icon(
                      Icons.check_circle_outline,
                      color: Colors.white,
                    )
                  : type == SnackBarType.WARNING
                      ? Icon(
                          Icons.warning,
                          color: Colors.black,
                        )
                      : Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
          SizedBox(
            width: 10.0,
          ),
          Text(message,maxLines: 2,overflow: TextOverflow.ellipsis,),
        ],
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: snackBarWidget,
          duration: new Duration(seconds: 3),
          backgroundColor: type == SnackBarType.ERROR
              ? Colors.redAccent
              : type == SnackBarType.SUCCESS
                  ? Colors.green
                  : type == SnackBarType.WARNING
                      ? Colors.orangeAccent
                      : Colors.blueAccent,
          //backgroundColor: Colors.redAccent,
        ),
      );
  }
}
