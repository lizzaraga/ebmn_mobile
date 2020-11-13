class AuthUser{
  String email, username, token;
  AuthUser.fromJson(Map<String, dynamic> data){
    email = data['email'];
    username = data['username'];
    token = data['token'];
  }
}