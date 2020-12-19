class AuthUser{
  String email, username, token;
  String id;
  AuthUser.fromJson(Map<String, dynamic> data){
    email = data['email'];
    username = data['username'];
    token = data['token'];
    id = data['id'];
  }
}