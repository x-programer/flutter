import 'package:chat_app/helper/helper.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Chat Us'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: mq.height * .25,
            width: 100,
            left: 180,
            child: Image.asset('images/user.png'),
          ),
          Positioned(
            bottom: mq.height * .45,
            left: 108,
            child: Container(
              width: 250,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    // handle login request
                    Future<void> googleLoginAndNavigate() async {
                      print("googleLogin method Called");
                      GoogleSignIn _googleSignIn = GoogleSignIn();
                      try {
                        var result = await _googleSignIn.signIn();
                        if (result == null) {
                          return;
                        }

                        final userData = await result.authentication;
                        final credential = GoogleAuthProvider.credential(
                            accessToken: userData.accessToken,
                            idToken: userData.idToken);
                        var userCredential = await FirebaseAuth.instance
                            .signInWithCredential(credential);
                        print("Result $result");
                        print(result.displayName);
                        print(result.email);
                        print(result.photoUrl);
                        print(
                            'Login k liye hai ye !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');

                        if (userCredential != null) {
                          print('User: ${userCredential.additionalUserInfo}');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        }
                      } catch (error) {
                        Dailogs.showSnapBar(context , 'Something Went Wrong!');
                        print(error);
                      }
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.login),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Login with Google! ',
                        style: TextStyle(fontSize: 23),
                      ),
                    ],
                  )),
            ),
          ),
          Positioned(
            bottom: mq.height * .15,
            left: 108,
            child: ElevatedButton(
                onPressed: () {
                  // signOut function
                  print(
                      'Logout k liye hai ye !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
                  Future<void> logout() async {
                    await GoogleSignIn().disconnect();
                    FirebaseAuth.instance.signOut();
                  }
                },
                child: Text('LogOut')),
          ),
        ],
      ),
    );
  }
}

// signOut function
// _signOut() async {
//   await FirebaseAuth.instance.signOut();
//   await GoogleSignIn().signOut();
// }

// // sing in method to  friebase ...
// Future<UserCredential?> _signInWithGoogle() async {
//   try {
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser?.authentication;

//     // create a new credentail
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );

//     // once signed in, return the UserCredentail
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   } catch (e) {
//     print('\n _signInWithGoogle : $e');
//     Dailogs.showSnapBar(context, 'Something went wrong check the Internet!');
//     return null;
//   }
// }
