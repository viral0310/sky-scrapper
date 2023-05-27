class UserData {
  final String? gender;
  final String? name_title;
  final String? name_first;
  final String? name_last;
  final int? location_number;
  final String? location_name;
  final String? city;
  final String? state;
  final String? country;
  final int? postcode;
  final String? email;
  final String? dob;
  final int? age;
  final String? phone;
  final String? lrg_image;

  UserData(
      {required this.gender,
      required this.location_name,
      required this.location_number,
      required this.age,
      required this.city,
      required this.country,
      required this.dob,
      required this.email,
      required this.lrg_image,
      required this.name_first,
      required this.name_last,
      required this.name_title,
      required this.phone,
      required this.postcode,
      required this.state});
  factory UserData.fromJson({required Map<String, dynamic>? json}) {
    return UserData(
      gender: json!['results'][0]['gender'],
      location_name: json['results'][0]['location']['street']['name'],
      location_number: json['results'][0]['location']['street']['number'],
      age: json['results'][0]['dob']['age'],
      city: json['results'][0]['location']['city'],
      country: json['results'][0]['location']['country'],
      dob: json['results'][0]['dob']['date'],
      email: json['results'][0]['email'],
      lrg_image: json['results'][0]['picture']['large'],
      name_last: json['results'][0]['name']['last'],
      name_first: json['results'][0]['name']['first'],
      name_title: json['results'][0]['name']['title'],
      phone: json['results'][0]['phone'],
      postcode: json['results'][0]['location']['postcode'],
      state: json['results'][0]['location']['state'],
    );
  }
}
