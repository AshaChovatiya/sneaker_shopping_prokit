import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/utils/common_snack_bar.dart';

class InterNet {
  static final InterNet instance = InterNet._();

  factory InterNet() => instance;

  InterNet._();

  StreamSubscription? streamSubscription;

  init() {
    streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        showDialog(
            context: navigatorKey.currentContext!,
            barrierDismissible: false,
            builder: (dialogContext) {
              return AlertDialog(
                title: Text('No Internet Connection'),
                content: Text('Please check your internet connection'),
                actions: [
                  TextButton(
                    onPressed: () async {
                      await Connectivity().checkConnectivity().then((value) {
                        if (value != ConnectivityResult.none) {
                          Navigator.of(dialogContext).pop();
                        } else {
                          GlobalSnackBar.show(
                              context: dialogContext,
                              message: 'Still No internet connection');
                        }
                      });
                    },
                    child: Text('OK'),
                  )
                ],
              );
            });
      }
    });
  }

  dispose() {
    streamSubscription?.cancel();
  }
}
