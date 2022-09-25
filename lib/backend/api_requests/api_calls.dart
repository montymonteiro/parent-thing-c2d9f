import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SendEmailCall {
  static Future<ApiCallResponse> call({
    String? toEmail = 'toemail',
    String? subject = 'subject',
    String? content = 'content',
  }) {
    final body = '''
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${toEmail}"
        }
      ],
      "subject": "${subject}"
    }
  ],
  "${content}": [
    {
      "type": "text/plain",
      "value": "<enter_content>"
    }
  ],
  "from": {
    "email": "<team@flutterflow.io>",
    "name": "<FlutterFlow>"
  },
  "reply_to": {
    "email": "<team@flutterflow.io>",
    "name": "<FlutterFlow>"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendEmail',
      apiUrl: 'https://api.sendgrid.com/v3/mail/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer 2UTBnMXSQoWSMlr1bv8oDw',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}
