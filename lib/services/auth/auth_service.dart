import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty || name.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await _firestore.collection('users').doc(credential.user!.uid).set({
          'name': name,
          'email': email,
          'uid': credential.user!.uid,
        });
        res = "Success";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  Future<String> LoginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "Success";
      } else {
        res = "Please enter all the field";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

// class AuthService extends ChangeNotifier {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

//   Future<UserCredential> signInWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       UserCredential userCredential = await _firebaseAuth
//           .signInWithEmailAndPassword(email: email, password: password);
//       await _fireStore.collection('users').doc(userCredential.user!.uid).set({
//         'uid': userCredential.user!.uid,
//         'email': email,
//       }, SetOptions(merge: true));

//       Get.offAll(() => const HomeScreen());
//       return userCredential;
//     } on FirebaseAuthException catch (e) {
//       throw _handleAuthException(e);
//     } catch (e) {
//       throw Exception('An unexpected error occurred.Please try again.');
//     }
//   }

//   Future<UserCredential> createUsersWithEmailAndPasswor(
//       String email, String password, String username) async {
//     try {
//       UserCredential userCredential = await _firebaseAuth
//           .createUserWithEmailAndPassword(email: email, password: password);
//       await _fireStore.collection('users').doc(userCredential.user!.uid).set({
//         'uid': userCredential.user!.uid,
//         'email': email,
//         'name': username,
//       });
//       Get.offAll(() => HomeScreen());
//       return userCredential;
//     } on FirebaseAuthException catch (e) {
//       throw _handleAuthException(e);
//     } catch (e) {
//       throw Exception('an unexpected error occured.Please try again.');
//     }
//   }

//   Future<void> signOut() async {
//     try {
//       await _firebaseAuth.signOut();
//       Get.offAll(() => AuthGate());
//     } catch (e) {
//       throw Exception('An occurred while signing out.Please try again');
//     }
//   }

//   Exception _handleAuthException(FirebaseAuthException e) {
//     switch (e.code) {
//       case 'user-not-found':
//         return Exception("No user found for that email.");
//       case 'wrong-password':
//         return Exception("Incorrect password");
//       case 'email-already-in-use':
//         return Exception('The email is already in use by another account');
//       case 'invalid-email':
//         return Exception("The email address is invalid");
//       case 'weak-password':
//         return Exception("The password is too weak");
//       default:
//         return Exception("Authentication failed.Please try again");
//     }
//   }
// }
