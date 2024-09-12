// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'signup_state.dart';

// class SignupCubit extends Cubit<SignupState> {
//   SignupCubit() : super(SignupInitial());
// }
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping/view_block/signup/signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password, String confirmPassword) async {
  emit(SignUpLoading());

  // تحقق من تطابق كلمة المرور مع تأكيد كلمة المرور
  if (password != confirmPassword) {
    emit(SignUpFailure('كلمة المرور وتأكيد كلمة المرور غير متطابقتين'));
    return;
  }

  try {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    emit(SignUpSuccess());
  } catch (e) {
    emit(SignUpFailure(e.toString()));
  }
}

}
