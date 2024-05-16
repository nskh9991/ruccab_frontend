class InfoModel {
  Info? info;

  InfoModel({this.info});

  InfoModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    return data;
  }
}

class Info {
  String? fname;
  String? lname;
  String? useremail;
  int? wallet;
  String? university;
  String? faculty;
  String? gender;

  Info(
      {this.fname,
      this.lname,
      this.useremail,
      this.faculty,
      this.university,
      this.gender,
      this.wallet});

  Info.fromJson(Map<String, dynamic> json) {
    fname = json['fname'];
    lname = json['lname'];
    useremail = json['useremail'];
    wallet = json['wallet'];
    university = json['university'];
    faculty = json['faculty'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fname'] = fname;
    data['lname'] = lname;
    data['useremail'] = useremail;
    data['wallet'] = wallet;
    data['university'] = university;
    data['faculty'] = faculty;
    data['gender'] = gender;
    return data;
  }
}
