// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class User {
    User({
        required this.id,
        required this.name,
        required this.email,
        required this.years,
        required this.jobs,
    });

    copyWith({
        String? id,
        String? name,
        String? email,
        int? years,
        List<String>? jobs,
    }) {

      return User(
        id: id ?? this.id, 
        name: name ?? this.name, 
        email: email ?? this.email, 
        years: years ?? this.years, 
        jobs: jobs ?? this.jobs
      );

    }

    String id;
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
