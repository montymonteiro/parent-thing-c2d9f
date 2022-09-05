import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({Key? key}) : super(key: key);

  @override
  _ChatPageWidgetState createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  PagingController<DocumentSnapshot?, ChatsRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: FFButtonWidget(
          onPressed: () async {
            context.pop();
          },
          text: 'back',
          options: FFButtonOptions(
            width: 130,
            height: 40,
            color: FlutterFlowTheme.of(context).primaryColor,
            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Open Sans Condensed',
                  color: Color(0xFF2B1A0B),
                  fontSize: 12,
                ),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        title: Text(
          'All Chats',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
          child: PagedListView<DocumentSnapshot<Object?>?, ChatsRecord>(
            pagingController: () {
              final Query<Object?> Function(Query<Object?>) queryBuilder =
                  (chatsRecord) => chatsRecord;
              if (_pagingController != null) {
                final query = queryBuilder(ChatsRecord.collection);
                if (query != _pagingQuery) {
                  // The query has changed
                  _pagingQuery = query;
                  _streamSubscriptions.forEach((s) => s?.cancel());
                  _streamSubscriptions.clear();
                  _pagingController!.refresh();
                }
                return _pagingController!;
              }

              _pagingController = PagingController(firstPageKey: null);
              _pagingQuery = queryBuilder(ChatsRecord.collection);
              _pagingController!.addPageRequestListener((nextPageMarker) {
                queryChatsRecordPage(
                  queryBuilder: (chatsRecord) => chatsRecord,
                  nextPageMarker: nextPageMarker,
                  pageSize: 20,
                  isStream: true,
                ).then((page) {
                  _pagingController!.appendPage(
                    page.data,
                    page.nextPageMarker,
                  );
                  final streamSubscription = page.dataStream?.listen((data) {
                    final itemIndexes = _pagingController!.itemList!
                        .asMap()
                        .map((k, v) => MapEntry(v.reference.id, k));
                    data.forEach((item) {
                      final index = itemIndexes[item.reference.id];
                      final items = _pagingController!.itemList!;
                      if (index != null) {
                        items.replaceRange(index, index + 1, [item]);
                        _pagingController!.itemList = {
                          for (var item in items) item.reference: item
                        }.values.toList();
                      }
                    });
                    setState(() {});
                  });
                  _streamSubscriptions.add(streamSubscription);
                });
              });
              return _pagingController!;
            }(),
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            builderDelegate: PagedChildBuilderDelegate<ChatsRecord>(
              // Customize what your widget looks like when it's loading the first page.
              firstPageProgressIndicatorBuilder: (_) => Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: Color(0xFF81D4FA),
                  ),
                ),
              ),

              itemBuilder: (context, _, listViewIndex) {
                final listViewChatsRecord =
                    _pagingController!.itemList![listViewIndex];
                return StreamBuilder<FFChatInfo>(
                  stream: FFChatManager.instance
                      .getChatInfo(chatRecord: listViewChatsRecord),
                  builder: (context, snapshot) {
                    final chatInfo =
                        snapshot.data ?? FFChatInfo(listViewChatsRecord);
                    return FFChatPreview(
                      onTap: () => context.pushNamed(
                        'Chat',
                        queryParams: {
                          'chatUser': serializeParam(
                              chatInfo.otherUsers.length == 1
                                  ? chatInfo.otherUsersList.first
                                  : null,
                              ParamType.Document),
                          'chatRef': serializeParam(
                              chatInfo.chatRecord.reference,
                              ParamType.DocumentReference),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'chatUser': chatInfo.otherUsers.length == 1
                              ? chatInfo.otherUsersList.first
                              : null,
                        },
                      ),
                      lastChatText: chatInfo.chatPreviewMessage(),
                      lastChatTime: listViewChatsRecord.lastMessageTime,
                      seen: listViewChatsRecord.lastMessageSeenBy!
                          .contains(currentUserReference),
                      title: chatInfo.chatPreviewTitle(),
                      userProfilePic: chatInfo.chatPreviewPic(),
                      color: Color(0xFFEEF0F5),
                      unreadColor: Colors.blue,
                      titleTextStyle: GoogleFonts.getFont(
                        'DM Sans',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      dateTextStyle: GoogleFonts.getFont(
                        'DM Sans',
                        color: Color(0x73000000),
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      previewTextStyle: GoogleFonts.getFont(
                        'DM Sans',
                        color: Color(0x73000000),
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                      borderRadius: BorderRadius.circular(0),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
