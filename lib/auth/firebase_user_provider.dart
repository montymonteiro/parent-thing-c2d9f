import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ParentThingFirebaseUser {
  ParentThingFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ParentThingFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ParentThingFirebaseUser> parentThingFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<ParentThingFirebaseUser>(
        (user) => currentUser = ParentThingFirebaseUser(user));
