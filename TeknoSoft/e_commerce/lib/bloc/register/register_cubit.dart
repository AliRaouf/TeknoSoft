import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
 Future registerUser(emailAddress, password) async {
    emit(RegisterUserLoading());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      emit(RegisterUserSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        emit(RegisterUserError());
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        emit(RegisterUserError());
      }
    } catch (e) {
      emit(RegisterUserError());
    }
  }
  saveUser(email, password, name,address,gender) async {
    emit(SaveUserLoadingState());
    try {
      FirebaseFirestore.instance
          .collection("users")
          .add({
        "username": name,
        "email": email,
        "password": password,
        "gender": gender,
        "address" : address
      });
      emit(SaveUserSuccessState());
    } on Exception catch (e) {
      emit(SaveUserErrorState());
    }
  }
}
