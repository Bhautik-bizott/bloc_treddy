
import 'dart:convert';

List<EntryFeeModel> entryFeeModelFromJson(String str) => List<EntryFeeModel>.from(json.decode(str).map((x) => EntryFeeModel.fromJson(x)));

String entryFeeModelToJson(List<EntryFeeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EntryFeeModel {
  int id;
  String displayText;
  int from;
  dynamic to;

  EntryFeeModel({
    required this.id,
    required this.displayText,
    required this.from,
    required this.to,
  });

  factory EntryFeeModel.fromJson(Map<String, dynamic> json) => EntryFeeModel(
    id: json["id"],
    displayText: json["displayText"],
    from: json["from"],
    to: json["to"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "displayText": displayText,
    "from": from,
    "to": to,
  };
}




// To parse this JSON data, do
//
//     final jwtModel = jwtModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final jwtModel = jwtModelFromJson(jsonString);


JwtModel jwtModelFromJson(String str) => JwtModel.fromJson(json.decode(str));

String jwtModelToJson(JwtModel data) => json.encode(data.toJson());

class JwtModel {
  String sub;
  JwtModelClass data;
  int exp;
  int iat;

  JwtModel({
    required this.sub,
    required this.data,
    required this.exp,
    required this.iat,
  });

  factory JwtModel.fromJson(Map<String, dynamic> json) => JwtModel(
    sub: json["sub"],
    data: JwtModelClass.fromJson(json["data"]),
    exp: json["exp"],
    iat: json["iat"],
  );

  Map<String, dynamic> toJson() => {
    "sub": sub,
    "data": data.toJson(),
    "exp": exp,
    "iat": iat,
  };
}

class JwtModelClass {
  dynamic customerId;
  dynamic memberId;
  dynamic type;

  JwtModelClass({
    required this.customerId,
    required this.memberId,
    required this.type,
  });

  factory JwtModelClass.fromJson(Map<String, dynamic> json) => JwtModelClass(
    customerId: json["customerId"],
    memberId: json["memberId"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "customerId": customerId,
    "memberId": memberId,
    "type": type,
  };
}


