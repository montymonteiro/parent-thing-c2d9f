import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

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
      params: {
        'toEmail': toEmail,
        'subject': subject,
        'content': content,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
