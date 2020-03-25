# Google Auth
<!-- <p align="center">
<img src="" height="649" width="300">
</p> -->

### Dependencies

#### Pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^0.4.2
  firebase_analytics: ^5.0.6
  firebase_auth: ^0.15.0+1
  
### Main
```dart
class _MyHomePageState extends State<MyHomePage> {
  GoogleSignService _googleSignService = GoogleSignService();
  GoogleSignInAccount _googleSignInAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _googleSignService.handleSignIn().then((value) {
                  setState(() {
                    _googleSignInAccount = value;
                  });
                });
              },
              color: Colors.blue,
              child: Container(
                width: 190,
                height: 50,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'images/google_icon.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Text(
                      'Sign with Google',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[50]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: _googleSignInAccount == null
                  ? Container()
                  : Image.network(_googleSignInAccount.photoUrl),
            ),
          ],
        ),
      ),
    );
  }
}
```
### GoogleSignService
```dart
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignService {
  GoogleSignIn _googleSignIn;

  GoogleSignService()
      : _googleSignIn = GoogleSignIn(scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ]);

  Future<GoogleSignInAccount> handleSignIn() async {
    return await _googleSignIn.signIn();
  }

  Future<GoogleSignInAccount> logOut() async{
    return await _googleSignIn.signOut();
  }
}
```

