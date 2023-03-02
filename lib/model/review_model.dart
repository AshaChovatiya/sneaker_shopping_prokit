class ReviewData {
  ListReviews? listReviews;

  ReviewData({this.listReviews});

  ReviewData.fromJson(Map<String, dynamic> json) {
    listReviews = json['listReviews'] != null
        ? new ListReviews.fromJson(json['listReviews'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listReviews != null) {
      data['listReviews'] = this.listReviews!.toJson();
    }
    return data;
  }
}

class ListReviews {
  List<ReviewItems>? reviewItems;

  ListReviews({this.reviewItems});

  ListReviews.fromJson(Map<String, dynamic> json) {
    try {
      if (json['items'] != null) {
        reviewItems = <ReviewItems>[];
        json['items'].forEach((v) {
          reviewItems!.add(new ReviewItems.fromJson(v));
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reviewItems != null) {
      data['items'] = this.reviewItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReviewItems {
  List<String>? images;
  String? comment;
  int? rating;
  Reviewer? reviewer;
  String? id;
  String? userId;
  String? time;

  ReviewItems(
      {this.images,
      this.comment,
      this.rating,
      this.reviewer,
      this.id,
      this.userId,
      this.time});

  ReviewItems.fromJson(Map<String, dynamic> json) {
    if (json['images'] != null) {
      images = <String>[];
      json['images'].forEach((v) {
        images!.add(v);
      });
    }
    comment = json['comment'];
    rating = json['rating'];
    id = json.containsKey('id') ? json['id'] : null;
    userId = json.containsKey('userId') ? json['userId'] : null;
    time = json.containsKey('updatedAt') ? json['updatedAt'] : null;
    reviewer = json['reviewer'] != null
        ? new Reviewer.fromJson(json['reviewer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    data['comment'] = this.comment;
    data['rating'] = this.rating;
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['updatedAt'] = this.time;
    if (this.reviewer != null) {
      data['reviewer'] = this.reviewer!.toJson();
    }
    return data;
  }
}

class Reviewer {
  String? name;

  Reviewer({this.name});

  Reviewer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
