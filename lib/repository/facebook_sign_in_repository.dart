import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookSignInRepository {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  Future<String> logInWithFacebook() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        print("fb access token " + accessToken.token);
        return accessToken.token;
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        return "Login cancelled by the user";
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        return 'Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}';
        break;
    }
  }

  Future<Null> logOut() async {
    await facebookSignIn.logOut();
    print('Logged out.');
  }
}
