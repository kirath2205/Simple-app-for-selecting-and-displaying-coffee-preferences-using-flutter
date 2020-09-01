import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spike_exercise/Models/brew.dart';
import 'package:spike_exercise/Models/user.dart';

class DatabaseService
{
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference collection=Firestore.instance.collection('brews');
  Future updateUserData(String sugar,String name,int strength) async
  {
      return await collection.document(uid).setData({'sugar':sugar,'name':name,'strength':strength, });

  }
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.documents.map((doc){
      return Brew(
        name:doc.data['name'] ?? '',
      sugar:doc.data['sugar'] ?? '0',
      strength:doc.data['strength'] ?? 0,
      );

    }).toList();
  }


  //user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot)
  {
    return UserData(
      uid:uid,
      name:snapshot['name'],
      sugar:snapshot['sugar'],
      strength: snapshot['strength']
    );
  }

// get brew stream
Stream<List<Brew>> get brews
{
  return collection.snapshots().map(_brewListFromSnapshot);

}

Stream<UserData> get userData
{
  return collection.document(uid).snapshots().map(_userDataFromSnapshot);
}


// get user doc stream


}