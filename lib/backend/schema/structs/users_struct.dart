import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_struct.g.dart';

abstract class UsersStruct implements Built<UsersStruct, UsersStructBuilder> {
  static Serializer<UsersStruct> get serializer => _$usersStructSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(UsersStructBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..uid = ''
    ..phoneNumber = ''
    ..photoUrl = ''
    ..firestoreUtilData = FirestoreUtilData();

  UsersStruct._();
  factory UsersStruct([void Function(UsersStructBuilder) updates]) =
      _$UsersStruct;
}

UsersStruct createUsersStruct({
  String? email,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? photoUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UsersStruct(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..photoUrl = photoUrl
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

UsersStruct? updateUsersStruct(
  UsersStruct? users, {
  bool clearUnsetFields = true,
}) =>
    users != null
        ? (users.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addUsersStructData(
  Map<String, dynamic> firestoreData,
  UsersStruct? users,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (users == null) {
    return;
  }
  if (users.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && users.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final usersData = getUsersFirestoreData(users, forFieldValue);
  final nestedData = usersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = users.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getUsersFirestoreData(
  UsersStruct? users, [
  bool forFieldValue = false,
]) {
  if (users == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(UsersStruct.serializer, users);

  // Add any Firestore field values
  users.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUsersListFirestoreData(
  List<UsersStruct>? userss,
) =>
    userss?.map((u) => getUsersFirestoreData(u, true)).toList() ?? [];
