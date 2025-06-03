import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/event_model/event_model.dart';

class FireBaseFireStoreService {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference<EventModel> getCollection() {
    return firestore
        .collection('events')
        .withConverter<EventModel>(
          fromFirestore: (snapshot, _) => EventModel.fromJson(snapshot.data()!),
          toFirestore: (event, _) => event.toJson(),
        );
    /*
    static FirebaseFirestore firestore = FirebaseFirestore.instance;
  final eventModel = firestore.collection('events').withConverter<EventModel>(
    fromFirestore: (snapshot, _) => EventModel.fromJson(snapshot.data()!),
    toFirestore: (event, _) => event.toJson(),
  );
     */
  }

  static Future<void> addEvent(EventModel event) async {
    var collection = getCollection();
    var doc = collection.doc();
    event.id = doc.id;
    doc.set(event);
  }

  static Future<List<QueryDocumentSnapshot<EventModel>>> getEvent(
      String id
      )async{
    var ref = getCollection();
    var data = await ref.where("categoryId" ,isEqualTo: id).get();
    return data.docs;
  }
  static Future<List<QueryDocumentSnapshot<EventModel>>> getAllEvents() async {
    var ref = getCollection();
    var data = await ref.get();
    return data.docs;
  }

}
