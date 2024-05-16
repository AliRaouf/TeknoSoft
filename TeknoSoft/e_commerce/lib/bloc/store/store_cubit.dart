import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());
  static StoreCubit get(context) => BlocProvider.of(context);
  Stream? itemStream;
  Stream? cartStream;
  Stream? deliveryStream;
  int total = 0;
  getItemStream() {
    itemStream = FirebaseFirestore.instance
        .collection('items')
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.map((doc) => doc.data()).toList());
  }
  Stream<List<Map<String, dynamic>>> getCartStream(){
    return FirebaseFirestore.instance
        .collection('cart')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('userTest')
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.map((doc) => doc.data()).toList());
  }
  Stream<List<Map<String, dynamic>>> getDeliveryStream(){
    return FirebaseFirestore.instance
        .collection('purchase')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('userPurchase')
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.map((doc) => doc.data()).toList());
  }
  Future<void> addItemToCart(String docId, Map<String, dynamic> item) async {
    try {
      await FirebaseFirestore.instance
          .collection('cart')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('userTest')
          .doc(docId)
          .set(item);
      print('Success');
      emit(ItemAddedToCart());
    } on Exception catch (e) {
      print(e);
    }
  }
  Future<void> changeCount(String docID,int num)async{
    final documentRef = FirebaseFirestore.instance
        .collection('cart')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('userTest')
        .doc(docID);
    await documentRef.update({
      'count': FieldValue.increment(num),
    });
  }
  Future<void> addItemToPurchase(Map<String, dynamic> item) async {
    try {
      await FirebaseFirestore.instance
          .collection('purchase')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('userPurchase')
          .add(item);
      print('Success');
      emit(ItemAddedToCart());
    } on Exception catch (e) {
      print(e);
    }
  }
  }
