//
// import 'package:firebase_auth/firebase_auth.dart';
// class User{
//   final  String uid;
//   User({required this.uid});
// }
// class AuthService {
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   // create user object based on FirebasdeUSer
//   User? _userFromFirebaseUSer(User user){
//     return user !=null?user:null;
//   }
//
//   // auth change user stream
//
//   Stream<User> get user{
//     return _auth.userChanges()
//         .map(_userFromFirebaseUSer);
//   }
//
//   userId(){
//     return user;
//   }
//
//
//
//   //sign anonymously
//   Future signInAnonym() async {
//     try{
//       UserCredential result = await _auth.signInAnonymously();
//       User user = result.user;
//       return _userFromFirebaseUSer(user);
//     } catch(e){
//       print(e.toString());
//       return null;
//     }
//   }
// // Sign in with email and password
//   Future signInEmailPassword(String email, String password) async{
//     try{
//       UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
//       User user = result.user;
//       return _userFromFirebaseUSer(user);
//     }catch(e){
//       print(e.toString());
//       return null;
//     }
//   }
//
//
// // Register with email and password
//   Future registerEmailPassword(String email, String password) async{
//     try{
//       UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       User user = result.user;
//       //await DatabaseService(uid: user.uid).UserInfo('New User', 'no define','no define','no define','no define',
//       //'no define','no define','no define','no define');
//       return _userFromFirebaseUSer(user);
//     }catch(e){
//       print(e.toString());
//       return null;
//     }
//   }
//
//
// // Sign out
//
//   Future signOut()async{
//     try{
//       return await _auth.signOut();
//     } catch(e){
//       print(e.toString());
//       return null;
//     }
//   }
//
// }}