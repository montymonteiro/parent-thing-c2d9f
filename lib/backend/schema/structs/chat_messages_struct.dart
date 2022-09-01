import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'chat_messages_struct.g.dart';

abstract class ChatMessagesStruct
    implements Built<ChatMessagesStruct, ChatMessagesStructBuilder> {
  static Serializer<ChatMessagesStruct> get serializer =>
      _$chatMessagesStructSerializer;

  DocumentReference? get user;

  DocumentReference? get chat;

  String? get text;

  String? get image;

  DateTime? get timestamp;

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

  static void _initializeBuilder(ChatMessagesStructBuilder builder) => builder
    ..text = ''
    ..image = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..firestoreUtilData = FirestoreUtilData();

  ChatMessagesStruct._();
  factory ChatMessagesStruct(
          [void Function(ChatMessagesStructBuilder) updates]) =
      _$ChatMessagesStruct;
}

ChatMessagesStruct createChatMessagesStruct({
  DocumentReference? user,
  DocumentReference? chat,
  String? text,
  String? image,
  DateTime? timestamp,
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
    ChatMessagesStruct(
      (c) => c
        ..user = user
        ..chat = chat
        ..text = text
        ..image = image
        ..timestamp = timestamp
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

ChatMessagesStruct? updateChatMessagesStruct(
  ChatMessagesStruct? chatMessages, {
  bool clearUnsetFields = true,
}) =>
    chatMessages != null
        ? (chatMessages.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addChatMessagesStructData(
  Map<String, dynamic> firestoreData,
  ChatMessagesStruct? chatMessages,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatMessages == null) {
    return;
  }
  if (chatMessages.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && chatMessages.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatMessagesData =
      getChatMessagesFirestoreData(chatMessages, forFieldValue);
  final nestedData =
      chatMessagesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = chatMessages.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getChatMessagesFirestoreData(
  ChatMessagesStruct? chatMessages, [
  bool forFieldValue = false,
]) {
  if (chatMessages == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(ChatMessagesStruct.serializer, chatMessages);

  // Add any Firestore field values
  chatMessages.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatMessagesListFirestoreData(
  List<ChatMessagesStruct>? chatMessagess,
) =>
    chatMessagess?.map((c) => getChatMessagesFirestoreData(c, true)).toList() ??
    [];
