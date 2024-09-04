// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final DateTime? birthDate;
  final Login? login;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  User({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.birthDate,
    this.login,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        birthDate: json["birthDate"] == null
            ? null
            : DateTime.parse(json["birthDate"]),
        login: json["login"] == null ? null : Login.fromJson(json["login"]),
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company:
            json["company"] == null ? null : Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "birthDate":
            "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "login": login?.toJson(),
        "address": address?.toJson(),
        "phone": phone,
        "website": website,
        "company": company?.toJson(),
      };
}

class Address {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: json["geo"] == null ? null : Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo?.toJson(),
      };
}

class Geo {
  final String? lat;
  final String? lng;

  Geo({
    this.lat,
    this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Company {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}

class Login {
  final String? uuid;
  final String? username;
  final String? password;
  final String? md5;
  final String? sha1;
  final DateTime? registered;

  Login({
    this.uuid,
    this.username,
    this.password,
    this.md5,
    this.sha1,
    this.registered,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        uuid: json["uuid"],
        username: json["username"],
        password: json["password"],
        md5: json["md5"],
        sha1: json["sha1"],
        registered: json["registered"] == null
            ? null
            : DateTime.parse(json["registered"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "username": username,
        "password": password,
        "md5": md5,
        "sha1": sha1,
        "registered": registered?.toIso8601String(),
      };
}
