class AccountModel {
  num? id;
  String? username;
  String? full_name;
  String? date_joined;
  String? email;
  String? avatar;
  int? account_type;
  List<dynamic>? groups;
  String? created_at;
  String? updated_at;
  AccountModel({
    this.id,
    this.username,
    this.full_name,
    this.date_joined,
    this.email,
    this.avatar,
    this.account_type,
    this.groups,
    this.created_at,
    this.updated_at,
  });
  factory AccountModel.fromMap(dynamic data) {
    if (data == null) return AccountModel();
    return AccountModel(
      id: data['id'],
      username: data['username'],
      full_name: data['full_name'],
      date_joined: data['date_joined'],
      email: data['email'],
      avatar: data['avatar'],
      account_type: data['account_type'],
      groups: data['groups'],
      created_at: data['created_at'],
      updated_at: data['updated_at'],
    );
  }
  toMap() => {
        'id': id,
        'username': username,
        'full_name': full_name,
        'date_joined': date_joined,
        'email': email,
        'avatar': avatar,
        'account_type': account_type,
        'groups': groups,
        'created_at': created_at,
        'updated_at': updated_at,
      };
}
