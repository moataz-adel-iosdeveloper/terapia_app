class RequestModel {
  int id;
  String username;
  String mobile;
  String image;
  String email;
  String birthDate;
  String nationalId;
  String deviceToken;
  String city;

  RequestModel(
      {this.id,
        this.username,
        this.mobile,
        this.image,
        this.email,
        this.birthDate,
        this.nationalId,
        this.deviceToken,
        this.city
      });

  RequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    mobile = json['mobile'];
    image = json['image'];
    email = json['email'];
    birthDate = json['birthDate'];
    nationalId = json['nationalId'];
    deviceToken = json['deviceToken'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['mobile'] = this.mobile;
    data['image'] = this.image;
    data['email'] = this.email;
    data['birthDate'] = this.birthDate;
    data['nationalId'] = this.nationalId;
    data['deviceToken'] = this.deviceToken;
    data['city'] = this.city;
    return data;
  }
}