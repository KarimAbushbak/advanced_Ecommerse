class DetailsBrandResponse {
  int? id;
  String? name;
  String? logo;

  DetailsBrandResponse({this.id, this.name, this.logo});

  DetailsBrandResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    return data;
  }
}
