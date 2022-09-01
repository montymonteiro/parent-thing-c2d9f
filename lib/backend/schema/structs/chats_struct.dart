import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'chats_struct.g.dart';

abstract class ChatsStruct implements Built<ChatsStruct, ChatsStructBuilder> {
  static Serializer<ChatsStruct> get serializer => _$chatsStructSerializer;

  DocumentReference? get users;

  @BuiltValueField(wireName: 'user_a')
  DocumentReference? get userA;

  @BuiltValueField(wireName: 'user_b')
  DocumentReference? get userB;

  @BuiltValueField(wireName: 'last_message')
  String? get lastMessage;

  @BuiltValueField(wireName: 'last_message_time')
  DateTime? get lastMessageTime;

  @BuiltValueField(wireName: 'last_message_sent_by')
  DocumentReference? get lastMessageSentBy;

  @BuiltValueField(wireName: 'last_mesage_seen_by')
  DocumentReference? get lastMesageSeenBy;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ChatsStructBuilder builder) => builder
    ..lastMessage = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..firestoreUtilData = FirestoreUtilData();

  ChatsStruct._();
  factory ChatsStruct([void Function(ChatsStructBuilder) updates]) =
      _$ChatsStruct;
}

ChatsStruct createChatsStruct({
  DocumentReference? users,
  DocumentReference? userA,
  DocumentReference? userB,
  String? lastMessage,
  DateTime? lastMessageTime,
  DocumentReference? lastMessageSentBy,
  DocumentReference? lastMesageSeenBy,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatsStruct(
      (c) => c
        ..users = users
        ..userA = userA
        ..userB = userB
        ..lastMessage = lastMessage
        ..lastMessageTime = lastMessageTime
        ..lastMessageSentBy = lastMessageSentBy
        ..lastMesageSeenBy = lastMesageSeenBy
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ChatsStruct? updateChatsStruct(
  ChatsStruct? chats, {
  bool clearUnsetFields = true,
}) =>
    chats != null
        ? (chats.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addChatsStructData(
  Map<String, dynamic> firestoreData,
  ChatsStruct? chats,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chats == null) {
    return;
  }
  if (chats.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && chats.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatsData = getChatsFirestoreData(chats, forFieldValue);
  final nestedData = chatsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = chats.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getChatsFirestoreData(
  ChatsStruct? chats, [
  bool forFieldValue = false,
]) {
  if (chats == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(ChatsStruct.serializer, chats);

  // Add any Firestore field values
  chats.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatsListFirestoreData(
  List<ChatsStruct>? chatss,
) =>
    chatss?.map((c) => getChatsFirestoreData(c, true)).toList() ?? [];
