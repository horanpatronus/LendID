import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class BaseViewModel<T extends ChangeNotifier?> extends ChangeNotifier {
  T? state;

  void setState(T? newState) {
    state = newState;
    notifyListeners();
  }
}

class Transaction {
  final String jenis;
  final String date;
  final String amount;

  Transaction(this.jenis, this.date, this.amount);
}

class RiwayatTopUpViewModel extends BaseViewModel<ChangeNotifier?> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  CollectionReference riwayatTopupCollection =
      FirebaseFirestore.instance.collection('riwayat_topup');

  List<Transaction> transactions = [];

  Future<void> getRiwayatTopUp() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot = await usersCollection.doc(user.uid).get();
      if (snapshot.exists) {
        String userId = user.uid;
        QuerySnapshot riwayatSnapshot =
            await riwayatTopupCollection.where('uid', isEqualTo: userId).get();

        print(userId);
        print(
            'Query executed successfully. Results: ${riwayatSnapshot.docs.length} documents');

        if (riwayatSnapshot.docs.isNotEmpty) {
          List<DocumentSnapshot> riwayatDocuments = riwayatSnapshot.docs;
          transactions = [];

          for (var riwayatDoc in riwayatDocuments) {
            Map<String, dynamic> riwayatData =
                riwayatDoc.data() as Map<String, dynamic>;

            String jenis = riwayatData['jenis'];
            String date = riwayatData['date'].toDate().toString();
            String amount = riwayatData['amount'].toString();
            transactions.add(Transaction(jenis, date, amount));
          }

          notifyListeners();
        } else {
          if (kDebugMode) {
            print('No riwayat_topup data found for the user');
          }
        }
      } else {
        if (kDebugMode) {
          print('User document does not exist');
        }
      }
    } else {
      if (kDebugMode) {
        print('Failed to get user');
      }
    }
  }
}
