import 'package:flutter/cupertino.dart';


final String tableUsers = 'tbl_user';

class Constants{


  final String SERVER_ERROR="Something went wrong...!Please try again later";

}




class UserFields {
  static final List<String> values = [
    /// Add all fields
    id, name, username, email, profile_image, address,phone,website,company
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String username = 'username';
  static final String email = 'email';
  static final String profile_image = 'profile_image';
  static final String address = 'address';
  static final String phone = 'phone';
  static final String website = 'website';
  static final String company = 'company';

}

class UsersList {
  final int id;
  final String name;
  final String username;
  final String email;
  final String profile_image;
  final String address;
  final String phone;
  final String website;
  final String company;

  const UsersList({
    this.id,
    this.name,
    this.username,
    this.email,
    this.profile_image,
    this.address,
    this.phone,
    this.website,
    this.company,

  });

  UsersList copy({
    int id,
    String name,
    String username,
    String email,
    String profile_image,
    String address,
    String phone,
    String website,
    String company,
  }) =>
      UsersList(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        email: email ?? this.email,
        profile_image: profile_image ?? this.profile_image,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        website: website ?? this.website,
        company: company ?? this.company,

      );

  static UsersList fromJson(Map<String, Object> json) => UsersList(
    id: json[UserFields.id] as int,
    name: json[UserFields.name] as String,
    username: json[UserFields.username] as String,
    email: json[UserFields.email] as String,
    profile_image: json[UserFields.profile_image] as String,
    address: json[UserFields.address] as String,
    phone: json[UserFields.phone] as String,
    website: json[UserFields.website] as String,
    company: json[UserFields.company] as String,

  );

  Map<String, Object> toJson() => {
    UserFields.id: id,
    UserFields.name: name,
    UserFields.username: username,
    UserFields.email: email,
    UserFields.profile_image: profile_image,
    UserFields.address: address,
    UserFields.phone: phone,
    UserFields.website: website,
    UserFields.company: company,

  };
}
