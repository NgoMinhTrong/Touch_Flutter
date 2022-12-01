class LoginModel {
  String? id;
  String? Id;
  String? Name;
  String? Email;
  String? Token;
  LoginModel({
    this.id,
    this.Id,
    this.Name,
    this.Email,
    this.Token,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json['id'],
        Id: json['id'],
        Name: json['Name'],
        Email: json['Email'],
        Token: json['Token'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'Id': Id,
        'Name': Name,
        'Email': Email,
        'Token': Token,
      };
}
// class LoginModel {
//   String? status;
//   double? code;
//   String? message;
//   Data? data;
//   LoginModel({
//     this.status,
//     this.code,
//     this.message,
//     this.data,
//   });
//   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//       status: json['status'],
//       code: json['code'],
//       message: json['message'],
//       data: Data.fromJson(json['data']));

//   Map<String, dynamic> toJson() => {
//         'status': status,
//         'code': code,
//         'message': message,
//         'data': data?.toJson(),
//       };
// }

// class Data {
//   String? id;
//   String? username;
//   String? fullName;
//   String? accessToken;
//   String? accessTokenExpiry;
//   String? refreshToken;
//   String? refreshTokenExpiry;

//   Data({
//     this.id,
//     this.username,
//     this.fullName,
//     this.accessToken,
//     this.accessTokenExpiry,
//     this.refreshToken,
//     this.refreshTokenExpiry,
//   });
//   factory Data.fromJson(dynamic json) {
//     if (json == null) return Data();
//     return Data(
//       id: json['id'],
//       username: json['username'],
//       fullName: json['fullName'],
//       accessToken: json['accessToken'],
//       accessTokenExpiry: json['accessTokenExpiry'],
//       refreshToken: json['refreshToken'],
//       refreshTokenExpiry: json['refreshTokenExpiry'],
//     );
//   }
//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'username': username,
//         'fullName': fullName,
//         'accessToken': accessToken,
//         'accessTokenExpiry': accessTokenExpiry,
//         'refreshToken': refreshToken,
//         'refreshTokenExpiry': refreshTokenExpiry,
//       };
// }
