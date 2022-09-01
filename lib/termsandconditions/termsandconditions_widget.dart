import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsandconditionsWidget extends StatefulWidget {
  const TermsandconditionsWidget({Key? key}) : super(key: key);

  @override
  _TermsandconditionsWidgetState createState() =>
      _TermsandconditionsWidgetState();
}

class _TermsandconditionsWidgetState extends State<TermsandconditionsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFB3E5FC),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          child: Text(
            'terms and conditions',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Open Sans Condensed',
                  color: Color(0xFF040000),
                  fontSize: 24,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 0),
                    child: Text(
                      'The following Terms & Conditions apply to your use of this mobile application.\nPLEASE READ THESE TERMS & CONDITIONS CAREFULLY BEFORE DOWNLOADING THIS MOBILE APPLICATION (“THE APP”) OR REGISTERING FOR AN ACCOUNT. IF YOU DO NOT ACCEPT THESE TERMS, DO NOT DOWNLOAD, USE, OR ACCESS ANY PORTION OF THE APP.\nLicense\nSubject to these Terms & Conditions, we hereby grant, and you hereby accept, a limited, non-exclusive, non-transferable, revocable licence to download and use the APP.\nAs a condition of your use of the APP, you warrant that you will not use the APP for any purpose that is unlawful or prohibited by these Terms & Conditions and that you will not use the APP in any manner that could damage, disable, overburden, or impair the APP, or interfere with any other party\'s use and enjoyment of the APP.\nAccount Registration\n \nAccess to certain functionalities of the APP is only possible after you become a Registered User.\nDuring the registration process, you will be required to provide certain information. You agree to provide accurate, current and complete information and to update such information to keep it accurate, current and complete. We reserve the right to suspend or terminate your Registered Account if any information provided during the registration process or thereafter proves to be inaccurate, not current or incomplete.\n\nYou are permitted to give access to your account to the co-parent, the grandparents, the child(ren) for whom the account was created and any other related party of your choice. You will be responsible for all access to your account given to any third-party and any minor person.\nRights and Access to User Content\nThe documents, files, text, data, graphics, images, photos, video or audiovisual content and any other content uploaded, transmitted or submitted by you and other Registered Users is regarded as “User Content”.\nYou retain full ownership to User Content that you have uploaded, transmitted and submitted. However, you hereby grant to us and other users of the APP that have been given access to your User Content a limited, non-exclusive, license, to access, use, view, download and print, where applicable, the User Content.\n\nYou may not upload or transmit User Content that is harmful, hateful, threatening, abusive, harassing, defamatory, sexually explicit, vulgar, lewd, obscene, pornographic, or otherwise objectionable, offensive or inflammatory; or anything that violates any applicable local or international law.\nWe do not control or monitor User Content. We however reserve the right to review and remove any offensive User Content at our sole discretion.\nConfidential Personal Information\nThe APP allows you to transmit, store, and receive confidential personal information regarding you and your family. You represent and warrant that you will, at all times, comply with all laws directly or indirectly applicable to you that may now or hereafter govern the gathering, use, transmission, processing, receipt, reporting, disclosure, maintenance, and storage of the confidential personal information.\nYou further represent and warrant that you will use your best efforts to cause all persons or entities under your direction or control to comply with such laws.\nWe cannot and do not assume any responsibility for your use or misuse of confidential personal information or other information transmitted, stored or received while using the APP.\nAccount Security\nYou are solely responsible for maintaining the strict confidentiality of any password or other Authentication Method assigned to or created by you and for any charges, damages, or losses that may be incurred or suffered as a result of your failure to maintain the strict confidentiality of the Authentication Method,  \nWe are not liable for any harm related to authorization, disclosure or theft of your Authentication Method. You agree to immediately notify us in writing of any unauthorized use of your Authentication Method or any need to deactivate an Authentication Method due to security concerns.\nIndemnity\nYou agree to defend, indemnify and hold us harmless from any claims, losses, expenses, costs or damages (including reasonable attorneys’ fees, expert fees; and other costs of litigation) arising from, incurred as a result of, or in any manner related to (1) your breach of these Terms & Conditions, (2) use of the APP and any services offered thereon by you or any other person using your Authentication Method or (3) the unauthorized or unlawful use of the APP by you or any other person using your Authentication Method.\nTerm and Termination\nThese Terms & Conditions remain in force for the duration of your Registration Period, including renewal Registration Periods, or until terminated by any party. Upon termination, your access to the APP will cease and your account will be deleted.\nYour right to access and use the APP immediately terminates without further notice upon your breach of these Terms & Conditions.\nYou may at any time request cancellation of your registration.\nRevision of the Terms & Conditions\nWe may from time-to-time revise and update these Terms & Conditions, and will post any updates on the System. Your continued use of the APP, after updates are posted, means that you accept and agree to the modified Terms & Conditions.\nAssignment Waiver and Governing Law\nWe may assign these Terms, in whole or in part, in our sole discretion. You may not assign your rights under these Terms without our prior written permission. Any attempt by you to assign your rights under these Terms without our permission shall be void.\nIf any provision of these Terms is held by a court of competent jurisdiction to be contrary to law, the remaining provisions of these Terms shall remain in full force and effect.\nThese Terms are governed by the laws of St. Kitts & Nevis.\nContact Information\nFor questions or inquiries about these Terms & Conditions, please contact us at: (869) 763-2233.',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Open Sans Condensed',
                            fontSize: 7,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'profile',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 3),
                            ),
                          },
                        );
                      },
                      text: 'back ',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Color(0xFFB3E5F6),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Open Sans Condensed',
                                  color: Color(0xFF2B1A0B),
                                  fontSize: 14,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
