import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);
  String? userName;
  String? gender;
  String? email;
  String? address;
  Future receiverUserData() async {
    emit(ReceiveUserNameLoadingState());
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection("users")
              .where("email",
                  isEqualTo: FirebaseAuth.instance.currentUser!.email)
              .get();
      if (querySnapshot.docs.isNotEmpty) {
        userName = querySnapshot.docs.first.get("username");
        email = querySnapshot.docs.first.get("email");
        gender = querySnapshot.docs.first.get("gender");
        address = querySnapshot.docs.first.get("address");
        emit(ReceiveUserNameSuccessState());
      } else {
        emit(ReceiveUserNameErrorState());
      }
    } catch (e) {
      emit(ReceiveUserNameErrorState());
    }
  }

  updateUserData(String userName, String gender, String address) {
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      var doc = querySnapshot.docs.first;
      doc.reference
          .update({'username': userName, 'gender': gender, "address": address})
          .then((value) => emit(UpdateUserDataSuccess()))
          .catchError((error) => emit(UpdateUserDataFailure()));
    });
  }
}
