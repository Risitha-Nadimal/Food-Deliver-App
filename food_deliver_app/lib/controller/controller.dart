import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:food_deliver_app/component/custom_dialog_box.dart';

class AuthController {
  //Firebased auth instanse created
  FirebaseAuth auth = FirebaseAuth.instance;

  //user registation function
  Future<void> registerUser(
      BuildContext context, String email, String Password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: Password,
      );
      DialogBox().dialogbox(
        context,
        DialogType.success,
        'User account Created.',
        'Congratulation,now you can Login.',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DialogBox().dialogbox(context, DialogType.error,
            'The password provided is too weak.', 'Enter strong password.');

        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        DialogBox().dialogbox(
            context,
            DialogType.error,
            'The account already exists for that email.',
            'Enter the another email.');

        print('The account already exists for that email.');
      } else {}
    } catch (e) {
      print(e);
    }
  }
}
