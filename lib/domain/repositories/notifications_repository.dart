import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/utils/logger.dart';
import '../../data/data_models /notification_model.dart';

class NotificationsRepository {



  Future<List<NotificationModel>> getNotifications(String userId) async {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;
      List<NotificationModel> notifications = [];
          // .where("userId", isEqualTo: userId)

      await db
          .collection("notifications")
          .get().then((value){
          for (final doc in value.docs) {
            notifications.add(NotificationModel.fromJson(doc.data()));
            Log.i(doc.data().toString());
        }
     }, onError: (e) {
        Log.e("Error fetching notifications: $e");
      });
      return notifications;
    } catch (e) {
      Log.e("Error fetching notifications: $e");
      return [];
    }
  }

  Future<void> clearNotifications(String userId) async {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;
      QuerySnapshot snapshot = await db
          .collection("notifications")
          // .where("userId", isEqualTo: userId)
          .get();

      for (QueryDocumentSnapshot doc in snapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      Log.e("Error clearing notifications: $e");
    }
  }
}