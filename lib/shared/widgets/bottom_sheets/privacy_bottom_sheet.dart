import 'package:flutter/material.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

class PrivacyBottomSheet extends StatelessWidget {
  const PrivacyBottomSheet({super.key});
  static const String _title1 =
      '1.The types of personal data we collect and use:';
  static const String _text1 =
      'Registration data. You give us your personal data, including your phone number and legal@marvelsnap.com when you register for the Website or reserve the game(s) and when you use the Website.Third party platform. If you choose to link your account with a third party platform (e.g., Facebook, Line, Google or Apple) to the Website, you will provide us or allow such third party to provide us with your user name and public profile. To manage the data we receive about you from third party platforms, you will need to follow the instructions of the platform for updating your data and changing your privacy settings. Once we receive your data from a third party platform, that data is stored and used by us in accordance with this Privacy Policy.Technical and behavioural data. We automatically collect certain information from you when you access the Website, including internet or other network activity information such as your IP address, unique device identifiers, and browsing history (including content you have viewed in the Website), and Cookies (as defined below).Cookies. We use cookies and other similar technologies (e.g. web beacons, flash cookies, etc.) (“Cookies”) to automatically collect information, to enhance your experience using the Website and improve the Website. Cookies are small files which, when placed on your device, enable the Website to provide certain features and functionality.You may be able to refuse or disable Cookies by adjusting your browser settings. Because each browser is different, please consult the instructions provided by your browser. If you choose to refuse, disable, or delete Cookies, some of the functionality of the Website may no longer be available to you. Without this information, we are not able to provide you with all the requested services, and any differences in services are related to your information.Feedbacks. We collect data and content of messages you provide to us through your feedback such as reviews you write, or questions and data you provide for customer support. In this case, we may collect and store your contact data (e.g., your name and email address) and any information provided by you in the feedback.';
  static const String _title2 =
      '2.How and for what purpose we use your personal data:';
  static const String _text2 =
      'verify your identity;inform you of updates relating to game launch and events;enable you to participate in the reward program and activities on the Website and send you relevant notices and results;provide you with user support and improve our products and services based on your feedback;notify you of changes to our services;administer the Website including troubleshooting;enforce and notify you of changes to our terms of service, conditions and policies; andcommunicate with you.In order to comply with our legal obligations and as necessary to perform tasks in the public interest or to protect the vital interests of our users and other people, we use your data to help us prevent and respond to abuse, fraud, illegal activity and other potentially harmful content relating to the Website.In accordance with our legitimate interests to provide an enjoyable and safe experience, we may use your data to:ensure your safety and security including identifying or enforcing against breach of our terms of service and other inappropriate behaviours;allow you to engage in social and interactive features of the Website;provide you with advertising and promotional updates (with your consent, if this is required by law), namely by sending electronic direct marketing messages regarding new games, features, enhancements, special offers, upgrade opportunities, contests and events of interest; andcomply with legal and regulatory requirements under applicable laws and regulations or as required by authorities.';
  static const String _title3 =
      '3.Who else will access your personal data and how we share your data:';
  static const String _text3 =
      'We may share and transfer your personal data with third parties (both inside and outside of your jurisdiction) as described in this section. We may share your information with the following types of third parties:Third Party PlatformsWhen you invite your friends to use the Website or you share content or data about your usage of the Website (e.g., your rewards obtained in lottery program) with others via third party platforms, the operators of such platform may be able to collect data about you, including data about your activity on the Website, and they may notify your connections on such platform about your use of the Website, in accordance with their privacy policies.Service ProvidersWe provide data and content to service providers who support our business, including but not limited to cloud service and data storage providers, maintenance service providers, customer service providers, and technical support providers who enhance game operations, improve the Website user experience, conduct debugging, and provide general support services. We contractually require these third party service providers to maintain the security and confidentiality of the data we share with them, and we require them not to use your data for anything other than to provide services on our behalf.Our Corporate GroupWe may also share your data with other members, subsidiaries, or affiliates of our corporate group, to operate the Website including improving and optimizing the Website, preventing illegal use, and supporting users.Law EnforcementWe may share your data with law enforcement agencies, public authorities or other third parties if we consider that we are legally required to do so or if such use is reasonably necessary to:comply with a legal obligation, process or request;enforce our terms of service and other agreements, policies and standards, including investigation of any potential violation thereof;detect, prevent or otherwise address security, fraud or technical issues; orprotect and defend the rights, property or safety of us, our users, a third party or the public as required or permitted by law (including exchanging data with other companies and organizations for the purposes of fraud protection and credit risk reduction).Sale or MergerWe will also disclose your data to third parties:in the event that we sell or buy any business or assets (whether as a result of liquidation, bankruptcy or otherwise), in which case we will disclose your data to the prospective seller or buyer of such business or assets; oif we sell, buy, merge, are acquired by, or partner with other companies or businesses, or sell some or all of our assets. In such transactions, user data may be among the transferred assets.';
  static const String _title4 = '4.International data transfers:';
  static const String _text4 =
      'The personal data that we collect from you may be transferred to, and stored at, or otherwise processed in a destination outside of your jurisdiction of residence.';
  static const String _title5 = '5.Your rights:';
  static const String _text5 =
      'You may have the following rights under applicable laws:the right to request free of charge (i) confirmation of whether we process your personal data and (ii) access to a copy of the personal data we process about youthe right to request rectification or removal of your personal data or restriction of the processing of your personal data; anthe right to object to processing your personal data for the purposes of sending you electronic direct marketing messagesBefore we can respond to a request to exercise one or more of the rights listed above, you may be required to verify your identity or your account detailsDepending on your jurisdiction, you may have additional rights. Please see the jurisdiction-specific section at the end of this Privacy PolicyPlease send an e-mail to legal@marvelsnap.com if you would like to exercise any of your rights. We will respond to your request in line with applicable law and subject to proper verification.';
  static const String _title6 = '6.The security of your personal data:';
  static const String _text6 =
      'We take steps to ensure that your data is treated securely and in accordance with this Privacy Policy. Unfortunately, the transmission of data via the internet is not completely secure. Although we will do our best to protect your personal data, for example, by encryption, we cannot guarantee the security of your data transmitted via the Website; any transmission is at your own risk.We will, from time to time, include links to and from the websites of our partner networks and affiliates. If you follow a link to any of these websites, please note that these websites have their own privacy policies and that we do not accept any responsibility or liability for these policies. Because we cannot control the activities of third parties, we do not accept any responsibility for any use of your personal data by such third parties, and we cannot guarantee that such third parties will adhere to the same privacy and security practices as us. Please check these policies before you submit any data to these websites.';
  static const String _title7 = '7.How long do we keep your personal data:';
  static const String _text7 =
      'We retain your data for as long as it is necessary to provide you with the service so that we can fulfil our contractual obligations and rights in relation to the data involved. However, there are occasions where we are likely to keep this data for longer in accordance with our legal obligations or where it is necessary for the establishment, exercise or defence of legal claims.';
  static const String _title8 = '8.Children';
  static const String _text8 =
      'The Website is not directed at children under the age of 13 and we do not knowingly collect or solicit personal data from children under 13. If you believe that we have personal data about or collected from a child under the relevant age, please contact us at legal@marvelsnap.com and we will ensure that it is deleted.';
  static const String _title9 = '9.Feedback';
  static const String _text9 =
      'In the event that you wish to provide us with feedback or make a request about how we process your personal data, please contact us in the first instance at legal@marvelsnap.com and we will endeavour to deal with your request as soon as possible. This is without prejudice to your right to lodge a claim or complaint with the relevant data protection authority.';
  static const String _title10 = '10.Changes';
  static const String _text10 =
      'We will generally notify all users of any material changes to this Privacy Notice, through a notice provided via the Website and providing any other notice required by applicable law. We will also update the “Last Updated” date at the top of this Privacy Notice, which reflects the effective date of such updated version of the policy.';
  static const String _title11 = '11.Languages';
  static const String _text11 =
      'In the event of any conflict or inconsistency between this policy in the English and any translation thereof in any other language, the English version shall prevail.';
  static const String _title12 = '12.Contact';
  static const String _text12 =
      'Questions, comments and requests regarding this policy should be addressed to legal@marvelsnap.com.';

  static const String _mainTitle = 'Privacy Policy';
  static const String _lastUpdateText = 'Last Update';
  static const String _lastUpdateDateString = '26/08/23';
  static const String _welcomeToAppText =
      'Welcome to MARVEL SNAP (the “Game”)!The Game is provided, operated and managed by Nuverse (Hong Kong) Limited ("Nuverse") and Second Dinner Studio, Inc ("SecondDinner"). Each Nuverse and Second Dinner collects and processes your personal data independently.You are reading this Privacy Notice, which explains how we collect, use and disclose your personal data when you visit, access, or use http://marvelsnap.com/ and its sub-domains (the “Website”), and the rights you may have under applicable data protection laws. The Website is provided, operated and controlled by Nuverse (Hong Kong) Limited, whose registered address is at Unit 1003, 10/F., Tower 2, Silvercord, 30 Canton Road, Tsim Sha Tsui, Kowloon, Hong Kong (“Operator”, “we” or “us”).For information regarding how SecondDinner collects, uses, discloses and otherwise processes your personal data, please refer to SecondDinner Privacy Notice .If you do not agree with the processing of your personal data as described in this Privacy Notice, you should not use the Website or provide your data to us.If you have any questions about how we use your personal data, please contact us via legal@marvelsnap.com.';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Padding(
        padding: SharedPaddings.all20,
        child: BaseColumn(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _mainTitleText(mainTitle: _mainTitle),
            _lastUpdateDate(
              lastUpdateText: _lastUpdateText,
              lastUpdateDate: _lastUpdateDateString,
            ),
            const Padding(
              padding: SharedPaddings.top12,
              child: Text(
                _welcomeToAppText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            _myTextWidget(title: _title1, text: _text1),
            _myTextWidget(title: _title2, text: _text2),
            _myTextWidget(title: _title3, text: _text3),
            _myTextWidget(title: _title4, text: _text4),
            _myTextWidget(title: _title5, text: _text5),
            _myTextWidget(title: _title6, text: _text6),
            _myTextWidget(title: _title7, text: _text7),
            _myTextWidget(title: _title8, text: _text8),
            _myTextWidget(title: _title9, text: _text9),
            _myTextWidget(title: _title10, text: _text10),
            _myTextWidget(title: _title11, text: _text11),
            _myTextWidget(title: _title12, text: _text12),
          ],
        ),
      ),
    );
  }

  Text _mainTitleText({
    required String mainTitle,
  }) =>
      Text(
        mainTitle,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w800,
        ),
      );

  Text _lastUpdateDate({
    required String lastUpdateText,
    required String lastUpdateDate,
  }) =>
      Text(
        '$lastUpdateText: [$lastUpdateDate]',
        style: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.w800,
        ),
      );

  Column _myTextWidget({
    required String title,
    required String text,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 2),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );
}
