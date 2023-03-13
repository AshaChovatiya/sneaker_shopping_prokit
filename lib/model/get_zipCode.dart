class GetZipCodeModel {
  GetZipCode? getZipCode;

  GetZipCodeModel({this.getZipCode});

  GetZipCodeModel.fromJson(Map<String, dynamic> json) {
    getZipCode = json['getZipCode'] != null
        ? new GetZipCode.fromJson(json['getZipCode'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getZipCode != null) {
      data['getZipCode'] = this.getZipCode!.toJson();
    }
    return data;
  }
}

class GetZipCode {
  bool? prepaid;
  double? codMaxAmount;
  bool? cod;
  String? id;

  GetZipCode({this.prepaid, this.codMaxAmount, this.cod, this.id});

  GetZipCode.fromJson(Map<String, dynamic> json) {
    prepaid = json['prepaid'];
    codMaxAmount = json['codMaxAmount'];
    cod = json['cod'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prepaid'] = this.prepaid;
    data['codMaxAmount'] = this.codMaxAmount;
    data['cod'] = this.cod;
    data['id'] = this.id;
    return data;
  }
}
