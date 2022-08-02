class MinimalUser {
  String email;
  String password;
  
  MinimalUser({
    this.email = "",
    this.password = "",
  });

  @override
  String toString() => 'MinimalUser(email: $email, password: $password)';
}
