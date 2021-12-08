class AuthRepository {
  Future<void> login() async {
    print('attempting login');
    Future.delayed(const Duration(seconds: 3));
    print('logged in');
  }
}