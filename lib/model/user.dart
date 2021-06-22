
class User {
  String? userid;
  String? userguid;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  String? name;
  String? status;
  String? useravatar;
  String? lastactive;
  String? dob;
  String? gender;
  String? role;
  String? favorite;
  Map<String, dynamic>? paymentaccountinfo;
  User({
    this.userid,
    this.userguid,
    this.firstname,
    this.lastactive,
    this.lastname,
    this.email,
    this.phone,
    this.name,
    this.status,
    this.useravatar,
    this.dob,
    this.gender,
    this.role,
    this.favorite,
    this.paymentaccountinfo,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userid: json['user_id'].toString(),
      userguid: json['user_guid'].toString(),
      firstname: json['first_name'],
      lastname: json['last_name'],
      email: json['email'],
      phone: json['phone'].toString(),
      name: json['name'],
      status: json['status'],
      useravatar: json['user_avatar'],
      dob: json['dob'],
      gender: json['gender'],
      favorite: json['favorite'].toString(),
      lastactive: json['last_active'],
      role: json['role'],
      paymentaccountinfo: json['payment_account_info'],
    );
  }
}
