import 'package:sneaker_shopping_prokit/utils/SSConstants.dart';

class Images {
  List<ImageItems>? items;

  Images({this.items});

  Images.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <ImageItems>[];
      json['items'].forEach((v) {
        items!.add(new ImageItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImageItems {
  int? height;
  String? id;
  String? imageKey;
  String? productId;
  dynamic position;
  bool? isThumb;

  ImageItems(
      {this.height,
      this.id,
      this.imageKey,
      this.productId,
      this.position,
      this.isThumb});

  ImageItems.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    id = json['id'];
    imageKey = json.containsKey('imageKey') ? json['imageKey'] : null;
    productId = json['productId'];
    position = json['position'];
    isThumb = json['isThumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['id'] = this.id;
    data['imageKey'] = this.imageKey;
    data['productId'] = this.productId;
    data['position'] = this.position;
    data['isThumb'] = this.isThumb;
    return data;
  }
}
