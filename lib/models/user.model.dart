// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class User {
    User({
        this.id,
        required this.name,
        required this.email,
        required this.years,
        required this.jobs,
    });

    String? id;
    String name;
    String email;
    int years;
    List<String> jobs;

    factory User.fromJson(String str) => User.fromMap(json.decode(str));


    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        years: json["years"],
        jobs: List<String>.from(json["jobs"].map((x) => x)),
    );


}
