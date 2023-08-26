import 'package:flutter/material.dart';
import 'package:shared_widgets/shared_widgets.dart';

class PrivacyBottomSheet extends StatelessWidget {
  PrivacyBottomSheet({super.key});
  final String title1 = '1.The types of personal data we collect and use:';
  final String text1 =
      'Registration data. You give us your personal data, including your phone number and legal@marvelsnap.com when you register for the Website or reserve the game(s) and when you use the Website.Third party platform. If you choose to link your account with a third party platform (e.g., Facebook, Line, Google or Apple) to the Website, you will provide us or allow such third party to provide us with your user name and public profile. To manage the data we receive about you from third party platforms, you will need to follow the instructions of the platform for updating your data and changing your privacy settings. Once we receive your data from a third party platform, that data is stored and used by us in accordance with this Privacy Policy.Technical and behavioural data. We automatically collect certain information from you when you access the Website, including internet or other network activity information such as your IP address, unique device identifiers, and browsing history (including content you have viewed in the Website), and Cookies (as defined below).Cookies. We use cookies and other similar technologies (e.g. web beacons, flash cookies, etc.) (“Cookies”) to automatically collect information, to enhance your experience using the Website and improve the Website. Cookies are small files which, when placed on your device, enable the Website to provide certain features and functionality.You may be able to refuse or disable Cookies by adjusting your browser settings. Because each browser is different, please consult the instructions provided by your browser. If you choose to refuse, disable, or delete Cookies, some of the functionality of the Website may no longer be available to you. Without this information, we are not able to provide you with all the requested services, and any differences in services are related to your information.Feedbacks. We collect data and content of messages you provide to us through your feedback such as reviews you write, or questions and data you provide for customer support. In this case, we may collect and store your contact data (e.g., your name and email address) and any information provided by you in the feedback.';
  final String title2 = '2.How and for what purpose we use your personal data:';
  final String text2 =
      'verify your identity;inform you of updates relating to game launch and events;enable you to participate in the reward program and activities on the Website and send you relevant notices and results;provide you with user support and improve our products and services based on your feedback;notify you of changes to our services;administer the Website including troubleshooting;enforce and notify you of changes to our terms of service, conditions and policies; andcommunicate with you.In order to comply with our legal obligations and as necessary to perform tasks in the public interest or to protect the vital interests of our users and other people, we use your data to help us prevent and respond to abuse, fraud, illegal activity and other potentially harmful content relating to the Website.In accordance with our legitimate interests to provide an enjoyable and safe experience, we may use your data to:ensure your safety and security including identifying or enforcing against breach of our terms of service and other inappropriate behaviours;allow you to engage in social and interactive features of the Website;provide you with advertising and promotional updates (with your consent, if this is required by law), namely by sending electronic direct marketing messages regarding new games, features, enhancements, special offers, upgrade opportunities, contests and events of interest; andcomply with legal and regulatory requirements under applicable laws and regulations or as required by authorities.';
  final String title3 =
      '3.Who else will access your personal data and how we share your data:';
  final String text3 =
      'We may share and transfer your personal data with third parties (both inside and outside of your jurisdiction) as described in this section. We may share your information with the following types of third parties:Third Party PlatformsWhen you invite your friends to use the Website or you share content or data about your usage of the Website (e.g., your rewards obtained in lottery program) with others via third party platforms, the operators of such platform may be able to collect data about you, including data about your activity on the Website, and they may notify your connections on such platform about your use of the Website, in accordance with their privacy policies.Service ProvidersWe provide data and content to service providers who support our business, including but not limited to cloud service and data storage providers, maintenance service providers, customer service providers, and technical support providers who enhance game operations, improve the Website user experience, conduct debugging, and provide general support services. We contractually require these third party service providers to maintain the security and confidentiality of the data we share with them, and we require them not to use your data for anything other than to provide services on our behalf.Our Corporate GroupWe may also share your data with other members, subsidiaries, or affiliates of our corporate group, to operate the Website including improving and optimizing the Website, preventing illegal use, and supporting users.Law EnforcementWe may share your data with law enforcement agencies, public authorities or other third parties if we consider that we are legally required to do so or if such use is reasonably necessary to:comply with a legal obligation, process or request;enforce our terms of service and other agreements, policies and standards, including investigation of any potential violation thereof;detect, prevent or otherwise address security, fraud or technical issues; orprotect and defend the rights, property or safety of us, our users, a third party or the public as required or permitted by law (including exchanging data with other companies and organizations for the purposes of fraud protection and credit risk reduction).Sale or MergerWe will also disclose your data to third parties:in the event that we sell or buy any business or assets (whether as a result of liquidation, bankruptcy or otherwise), in which case we will disclose your data to the prospective seller or buyer of such business or assets; oif we sell, buy, merge, are acquired by, or partner with other companies or businesses, or sell some or all of our assets. In such transactions, user data may be among the transferred assets.';
  final String title4 = '4.International data transfers:';
  final String text4 =
      'The personal data that we collect from you may be transferred to, and stored at, or otherwise processed in a destination outside of your jurisdiction of residence.';
  final String title5 = '5.Your rights:';
  final String text5 =
      'You may have the following rights under applicable laws:the right to request free of charge (i) confirmation of whether we process your personal data and (ii) access to a copy of the personal data we process about youthe right to request rectification or removal of your personal data or restriction of the processing of your personal data; anthe right to object to processing your personal data for the purposes of sending you electronic direct marketing messagesBefore we can respond to a request to exercise one or more of the rights listed above, you may be required to verify your identity or your account detailsDepending on your jurisdiction, you may have additional rights. Please see the jurisdiction-specific section at the end of this Privacy PolicyPlease send an e-mail to legal@marvelsnap.com if you would like to exercise any of your rights. We will respond to your request in line with applicable law and subject to proper verification.';
  final String title6 = '6.The security of your personal data:';
  final String text6 =
      'We take steps to ensure that your data is treated securely and in accordance with this Privacy Policy. Unfortunately, the transmission of data via the internet is not completely secure. Although we will do our best to protect your personal data, for example, by encryption, we cannot guarantee the security of your data transmitted via the Website; any transmission is at your own risk.We will, from time to time, include links to and from the websites of our partner networks and affiliates. If you follow a link to any of these websites, please note that these websites have their own privacy policies and that we do not accept any responsibility or liability for these policies. Because we cannot control the activities of third parties, we do not accept any responsibility for any use of your personal data by such third parties, and we cannot guarantee that such third parties will adhere to the same privacy and security practices as us. Please check these policies before you submit any data to these websites.';
  final String title7 = '7.How long do we keep your personal data:';
  final String text7 =
      'We retain your data for as long as it is necessary to provide you with the service so that we can fulfil our contractual obligations and rights in relation to the data involved. However, there are occasions where we are likely to keep this data for longer in accordance with our legal obligations or where it is necessary for the establishment, exercise or defence of legal claims.';
  final String title8 = '8.Children';
  final String text8 =
      'The Website is not directed at children under the age of 13 and we do not knowingly collect or solicit personal data from children under 13. If you believe that we have personal data about or collected from a child under the relevant age, please contact us at legal@marvelsnap.com and we will ensure that it is deleted.';
  final String title9 = '9.Feedback';
  final String text9 =
      'In the event that you wish to provide us with feedback or make a request about how we process your personal data, please contact us in the first instance at legal@marvelsnap.com and we will endeavour to deal with your request as soon as possible. This is without prejudice to your right to lodge a claim or complaint with the relevant data protection authority.';
  final String title10 = '10.Changes';
  final String text10 =
      'We will generally notify all users of any material changes to this Privacy Notice, through a notice provided via the Website and providing any other notice required by applicable law. We will also update the “Last Updated” date at the top of this Privacy Notice, which reflects the effective date of such updated version of the policy.';
  final String title11 = '11.Languages';
  final String text11 =
      'In the event of any conflict or inconsistency between this policy in the English and any translation thereof in any other language, the English version shall prevail.';
  final String title12 = '12.Contact';
  final String text12 =
      'Questions, comments and requests regarding this policy should be addressed to legal@marvelsnap.com.';

  final String mainTitle = 'Privacy Policy';
  final String lastUpdateText = 'Last Update';
  final String LastUpdateDate = '26/08/23';
  final String welcomeToAppText =
      'Welcome to MARVEL SNAP (the “Game”)!The Game is provided, operated and managed by Nuverse (Hong Kong) Limited ("Nuverse") and Second Dinner Studio, Inc ("SecondDinner"). Each Nuverse and Second Dinner collects and processes your personal data independently.You are reading this Privacy Notice, which explains how we collect, use and disclose your personal data when you visit, access, or use http://marvelsnap.com/ and its sub-domains (the “Website”), and the rights you may have under applicable data protection laws. The Website is provided, operated and controlled by Nuverse (Hong Kong) Limited, whose registered address is at Unit 1003, 10/F., Tower 2, Silvercord, 30 Canton Road, Tsim Sha Tsui, Kowloon, Hong Kong (“Operator”, “we” or “us”).For information regarding how SecondDinner collects, uses, discloses and otherwise processes your personal data, please refer to SecondDinner Privacy Notice .If you do not agree with the processing of your personal data as described in this Privacy Notice, you should not use the Website or provide your data to us.If you have any questions about how we use your personal data, please contact us via legal@marvelsnap.com.';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 568,
      child: Padding(
        padding: EdgeInsets.only(top: 60.0, left: 10.0, right: 2),
        child: BaseColumn(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _mainTitleTextWidget(mainTitle: mainTitle),
            _lastUpdateDateWidget(
                lastUpdateText: lastUpdateText, LastUpdateDate: LastUpdateDate),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                welcomeToAppText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            MyTextWidget(title: title1, text: text1),
            MyTextWidget(title: title2, text: text2),
            MyTextWidget(title: title3, text: text3),
            MyTextWidget(title: title4, text: text4),
            MyTextWidget(title: title5, text: text5),
            MyTextWidget(title: title6, text: text6),
            MyTextWidget(title: title7, text: text7),
            MyTextWidget(title: title8, text: text8),
            MyTextWidget(title: title9, text: text9),
            MyTextWidget(title: title10, text: text10),
            MyTextWidget(title: title11, text: text11),
            MyTextWidget(title: title12, text: text12),
          ],
        ),
      ),
    );
  }
}

class _lastUpdateDateWidget extends StatelessWidget {
  const _lastUpdateDateWidget({
    super.key,
    required this.lastUpdateText,
    required this.LastUpdateDate,
  });

  final String lastUpdateText;
  final String LastUpdateDate;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$lastUpdateText: [$LastUpdateDate]',
      style: TextStyle(
          fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.w800),
    );
  }
}

class _mainTitleTextWidget extends StatelessWidget {
  const _mainTitleTextWidget({
    super.key,
    required this.mainTitle,
  });

  final String mainTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      mainTitle,
      style: const TextStyle(
          fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.w800),
    );
  }
}

class MyTextWidget extends StatelessWidget {
  MyTextWidget({required this.title, required this.text, super.key});
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 2),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
