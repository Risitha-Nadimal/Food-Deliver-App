// // ignore_for_file: use_build_context_synchronously

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/widgets.dart';
// import 'package:food_deliver_app/Scrren/main_screen/mainscreen.dart';
// import 'package:food_deliver_app/component/custom_dialog_box.dart';
// import 'package:food_deliver_app/controller/db_controller.dart';
// import 'package:food_deliver_app/util/app_function.dart';

// class AuthController {
//   //Firebased auth instanse created
//   FirebaseAuth auth = FirebaseAuth.instance;

//   //user registation function
//   Future<void> registerUser(BuildContext context, String email, String password,
//       String name, String phoneNO) async {
//     try {
//       final credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       if (credential.user!.uid.isEmpty) {
//         DataBaseControoler()
//             .saveUserInformation(name, email, phoneNO, credential.user!.uid);
//       }

//       DialogBox().dialogbox(
//         context,
//         DialogType.success,
//         'User account Created.',
//         'Congratulation,now you can Login.',
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         DialogBox().dialogbox(context, DialogType.error,
//             'The password provided is too weak.', 'Enter strong password.');

//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         DialogBox().dialogbox(
//             context,
//             DialogType.error,
//             'The account already exists for that email.',
//             'Enter the another email.');

//         print('The account already exists for that email.');
//       } else {}
//     } catch (e) {
//       print(e);
//     }
//   }

//   //user login function
//   Future<void> loginUser(
//       BuildContext context, String email, String password) async {
//     try {
//       final credential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       if (credential.user != null) {
//         utilFunction.navigatorto(context, const Mainscreen());
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         DialogBox().dialogbox(
//           context,
//           DialogType.error,
//           'No user found for that email.',
//           'Please Enter valid email',
//         );
//       } else if (e.code == 'wrong-password') {
//         DialogBox().dialogbox(
//           context,
//           DialogType.error,
//           'Wrong password provided for that user.',
//           'Please Enter valid passord',
//         );
//       }
//     }
//   }

// //send password resert email function
//   Future<void>? sendPasswordResertEmail(
//       BuildContext context, String email) async {
//     try {
//       await auth.sendPasswordResetEmail(email: email);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'invalid-email') {
//         DialogBox().dialogbox(
//           context,
//           DialogType.error,
//           'Invalid email.',
//           'Please Enter valid email',
//         );
//       } else {
//         DialogBox().dialogbox(
//           context,
//           DialogType.error,
//           'Error.',
//           e.toString(),
//         );
//       }
//     }

//     return;
//   }
// }

// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:food_deliver_app/Scrren/main_screen/mainscreen.dart';
import 'package:food_deliver_app/component/custom_dialog_box.dart';
import 'package:food_deliver_app/controller/db_controller.dart';
import 'package:food_deliver_app/util/app_function.dart';

class AuthController {
  // Firebase auth instance created
  FirebaseAuth auth = FirebaseAuth.instance;

  // User registration function
  Future<void> registerUser(BuildContext context, String email, String password,
      String name, String phoneNO) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null && credential.user!.uid.isNotEmpty) {
        // Corrected: Save user information if uid is not empty
        await DataBaseControoler()
            .saveUserInformation(name, email, phoneNO, credential.user!.uid);
      }

      DialogBox().dialogbox(
        context,
        DialogType.success,
        'User account Created.',
        'Congratulations, now you can Login.',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DialogBox().dialogbox(context, DialogType.error,
            'The password provided is too weak.', 'Enter a stronger password.');

        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        DialogBox().dialogbox(
            context,
            DialogType.error,
            'The account already exists for that email.',
            'Enter another email.');

        print('The account already exists for that email.');
      } else {
        // Handle other potential errors
        DialogBox().dialogbox(context, DialogType.error, 'Registration failed.',
            e.message ?? 'An unknown error occurred.');
      }
    } catch (e) {
      print(e);
      DialogBox().dialogbox(context, DialogType.error, 'An error occurred.',
          'Please try again later.');
    }
  }

  // User login function
  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        utilFunction.navigatorto(context, const Mainscreen());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        DialogBox().dialogbox(
          context,
          DialogType.error,
          'No user found for that email.',
          'Please enter a valid email',
        );
      } else if (e.code == 'wrong-password') {
        DialogBox().dialogbox(
          context,
          DialogType.error,
          'Wrong password provided for that user.',
          'Please enter the correct password',
        );
      } else {
        // Handle other potential errors
        DialogBox().dialogbox(context, DialogType.error, 'Login failed.',
            e.message ?? 'An unknown error occurred.');
      }
    }
  }

  // Send password reset email function
  Future<void>? sendPasswordResetEmail(
      BuildContext context, String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        DialogBox().dialogbox(
          context,
          DialogType.error,
          'Invalid email.',
          'Please enter a valid email',
        );
      } else {
        DialogBox().dialogbox(
          context,
          DialogType.error,
          'Error.',
          e.toString(),
        );
      }
    }
    return;
  }
}
