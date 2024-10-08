// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../text/aligned_text.dart';

class TermsOfService extends StatelessWidget {
  const TermsOfService({super.key});
  static const String _welcomeText =
      'THESE TERMS FORM A LEGALLY BINDING AGREEMENT BETWEEN YOU AND US. PLEASE '
      'TAKE THE TIME TO READ THEM CAREFULLY. IF YOU DO NOT AGREE TO THESE '
      'TERMS,  DO NOT PLAY THE GAME OR ACCESS THE SERVICE.PLEASE NOTE THAT '
      'DIFFERENT TERMS MAY APPLY TO YOU BASED ON WHERE YOU LIVE. MAKE SURE YOU '
      'READ THE JURISDICTION-SPECIFIC TERMS FOR YOUR JURISDICTION OF RESIDENCE '
      'BOTTOM OF THESE TERMS). THESE SPECIFIC TERMS CONCERN IMPORTANT ASPECTS '
      '(AT THE OF OUR AGREEMENT, INCLUDING, WITHOUT LIMITATION, HOW YOU '
      'CONSENT TO THESE TERMS, YOUR CONSUMER RIGHTS (INCLUDING YOUR '
      'CANCELLATION RIGHT, IF APPLICABLE), OUR RIGHTS TO TERMINATE YOUR '
      'ACCOUNT, YOUR RIGHT TO RECEIVE REFUNDS IN CERTAIN CASES, OUR WARRANTIES '
      'AND LIABILITY, AND THE LAW APPLICABLE TO THESE TERMS. THERE ARE '
      'CURRENTLY JURISDICTION-SPECIFIC TERMS FOR THE EUROPEAN '
      'UNION IN GENERAL AS WELL AS GERMANY, THE UK, '
      'AUSTRALIA, CANADA, NEW ZEALAND, US AND JARBITRATION NOTICE FOR USERS: '
      'THESE TERMS CONTAIN A MUTUAL AGREEMENT TO ARBITRATION AND A WAIVER OF '
      'CLASS ACTION RIGHTS. EXCEPT FOR CERTAIN TYPES OF DISPUTES MENTIONED IN '
      'THAT ARBITRATION AGREEMENT, YOU AND NUVERSE AGREE THAT DISPUTES BETWEEN '
      'US WILL BE RESOLVED BY BINDING ARBITRATION, AND YOU AND NUVERSE WAIVE '
      'ANY RIGHT TO PARTICIPATE IN A CLASS-ACTION LAWSUIT OR CLASS-WIDE '
      'ARBITRATIO1.Your Relationship with Welcome to [MARVEL SNAP] '
      '(the "Game"), which is provided by Nuverse (Hong Kong) Limited or one '
      'of its affiliates ("Nuverse", "we" or "us"You are reading the terms of '
      'service (the "Terms"), which govern the relationship and serve as a '
      'legally binding agreement between you and us and set forth the terms '
      'and conditions by which you may access and use the Game, the mobile '
      'application, the software imbedded therein, the features and functions '
      'thereof and our related websites, services, applications, products and '
      'content (collectively, the "Services"). Any reference to the "Services" '
      'includes a reference to any part of the Services. For purposes of these '
      'Terms, "you" and "your" means you as the user of the Services. Our '
      'Services are provided to you only for private, non-commercial use.';
  static const String _title1 = '1.Your Relationship with Us: ';
  static const String _text1 =
      'Welcome to [MARVEL SNAP] (the "Game"), which is provided by Nuverse '
      '(Hong Kong) Limited or one of its affiliates '
      '("Nuverse", "we" or "us")ou are reading the terms of service '
      '(the "Terms"), which govern the relationship and serve as a legally '
      'binding agreement between you and us and set forth the terms and '
      'conditions by which you may access and use the Game, the mobile '
      'application, the software imbedded therein, the features and functions '
      'thereof and our related websites, services, applications, products and '
      'content (collectively, the "Services"). Any reference to the "Services" '
      'includes a reference to any part of the Services. For purposes of '
      'these Terms, "you" and "your" means you as the user of the Services. '
      'Our Services are provided to you only for private, non-commercial use.';
  static const String _title2 = '2.Age and Accepting the Terms: ';
  static const String _text2 =
      'Access to certain Services or features of the Services may be subject '
      'to age restrictions and not available to all users of the Services. '
      'The Services are only for users 13 years old and over (with additional '
      'limits that may be set forth in the Supplemental Terms – '
      'Jurisdiction-Specific). By accessing or using our Services, you confirm '
      'that you are over 13 and can form a binding contract with Nuverse, '
      'that you accept these Terms and that you agree to comply with them. '
      'You understand and agree that we will treat your access or use of the '
      'Services as acceptance of the Terms from that point onwards. If you are '
      'over 13 but under the legal age to enter into a contract in your '
      'jurisdiction, your parents or legal guardian must read and agree to '
      'these Terms. If you do not have consent from your parents or legal '
      'guardians, you must cease accessing or using the Services. If we learn '
      'that someone under the relevant age is using the Services, we will '
      'terminate access to the Service for such user.You should print off or '
      'save a local copy of the Terms for your records.';
  static const String _title3 =
      '3.Supplemental Terms for Specific Jurisdictions: ';
  static const String _text3 =
      'If you access or use the Services from within a jurisdiction for which '
      'there are separate supplemental terms, you also agree to the '
      'supplemental terms applicable to you in the applicable jurisdiction as '
      'outlined below. If there is a conflict between the provisions of the '
      'Supplemental Terms – Jurisdiction-Specific that are applicable to you, '
      'and the rest of these Terms, the relevant jurisdictions’ Supplemental '
      'Terms – Jurisdiction-Specific will supersede and control. ';
  static const String _title4 = '4.Changes to the Terms: ';
  static const String _text4 =
      'We amend these Terms from time to time, to reflect changes to the '
      'Services, our users needs, our business priorities or to reflect '
      'changes in law. We will notify all users of any changes to these Terms, '
      'such as through a notice in our Game. However, you should also look at '
      'the Terms regularly to check for such changes. We will also update the '
      '"Last Updated" date at the top of these Terms, which reflect the '
      'effective date of such Terms. Your continued access or use of the '
      'Services after the date of the new Terms constitutes your acceptance '
      'of the new Terms. If you do not agree to the new Terms, you must stop '
      'accessing or using the Services.';
  static const String _title5 = '5.Your Account with Us: ';
  static const String _text5 =
      'You may access the Services without an account with us as a guest, '
      'in which case you may have limited access to certain features of the '
      'Services. Please note that if you are using a guest or visitor '
      'account, you will be unable to transfer/keep your progress or other '
      'information and data in the Game or restore any in-app purchases you '
      'have made if you need to re-install the Game, e.g., if you switch your '
      'device.  All information and data in connection with your use of the '
      'Game and Service will be removed and will not be retrievable or '
      'recoverable, if you delete the Game from your device.In some cases, '
      'you may use a third party account (e.g., Apple, Facebook, Google, as '
      'applicable) ("Third Party Account") to access additional features and '
      'functions of the Services. You agree that you are solely responsible '
      '(to us and to others) for your access and use of the Services and the '
      'activity that occurs under your accouIt is important that you keep your '
      'account password confidential and that you do not disclose it to any '
      'third party. You acknowledge and agree that we have no obligations '
      'related to your Third Party Account, and all matters relating to any '
      'Third Party Account of yours shall be resolved exclusively by you and '
      'the relevant third partWe reserve the right to suspend or terminate '
      'your access to the Services at any time, without any notice to you, '
      'including if you have failed to comply with any of the provisions of '
      'these Terms, or if activities occur on your account which would or '
      'might cause damage to or impair the Services or infringe or violate '
      'any third party rights (including intellectual property rights), or '
      'violate any applicable laws or regulations. Termination of your '
      'account also entails the termination of the license to use the Service, '
      'or any part thereof.';
  static const String _title6 = '6.Virtual Items/Additional Content: ';
  static const String _text6 =
      'During your use of the Service, you may acquire, by purchasing with '
      'real-world currency or otherwise, virtual currency, points, coins, '
      'tokens, virtual in-Game items (including without limitation '
      'downloadable content), achievements, progressions, or access to '
      'additional features, level, characters, maps or other content '
      '(collectively, "Virtual Items"). Such Virtual can only be used for your '
      'own benefit within the Game, are of no monetary value and cannot be '
      'redeemed for cash or in-kind, sold or otherwise transferred. All '
      'Virtual Items are licensed to you rather than sold to you. You do not '
      'own or otherwise have proprietary rights of such Virtual Items. We will '
      'provide you the access to the Virtual Items for a period of at least '
      'one (1) month from the date of purchase, after which, we may, in our '
      'sole direction at anytime, terminate the Services under the Terms. All '
      'Virtual Items will be deleted or removed from your account when your '
      'account is terminated, and will not be retrievable, recoverable or '
      'refundable.';
  static const String _title7 = '7.Fees and Refund: ';
  static const String _text7 =
      'In some cases, certain portions of the Game may be accessed for free, '
      'but in other cases you may be required to pay a fee to access certain '
      'features of the Game. If you purchase any paid Virtual Items, you '
      'shall make a purchase through the Apple App Store or the Google Play '
      'store or official platforms we recognize in our sole discretion. You '
      'agree to provide accurate and complete payment information to Apple or '
      'Google. You further agree to pay all fees and taxes incurred by your '
      'account. We reserve the right to change the pricing of any paid Virtual '
      'Items from time to time as we may determine in our sole discretion. Any '
      'change will not affect Virtual Items you have already purchased at the '
      'time the change comes into effect.Sales are final and we will not '
      'provide a refund unless otherwise required by applicable law. You must '
      'follow the applicable refund policy of Apple or Google. Your purchase '
      'will be subject to the applicable payment policy of Apple or Google. '
      'We may, but is not obligated to assist you with your refund '
      'application to Apple or Google.';
  static const String _title8 = '8.Limited License: ';
  static const String _text8 =
      'As between you and Nuverse, Nuverse owns any and all rights, title and '
      'interest in and to the Services and any and all data and content made '
      'available in and through the Services, including without limitation '
      'all software, computer code, tools, patches, updates, images, text, '
      'graphics, illustrations, logos, photographs, images, pictures, audio, '
      'sound effect, sound recording, videos, visual effect, music, music '
      'composition, user account, characters, character name, character '
      'profile, character likeness, artifacts, objects, inventories, weapons, '
      'map, location, location name, architecture, landscape design, story, '
      'storyline, theme, game play, catch phrase, dialogue, chat log, '
      'recording and broadcasts of game, matches, battles, duels, in-game '
      'items, in-game activities, the selection and arrangement thereof and '
      '"look and feel" of the Services, and all intellectual property rights '
      'related thereto (the "Nuverse Content").You acknowledge that your use '
      'of the Nuverse Content for any purpose not expressly permitted by '
      'these Terms is strictly prohibited. Nuverse Content may not be '
      'downloaded, copied, reproduced, distributed, transmitted, broadcast, '
      'displayed, sold, licensed or otherwise exploited for any purpose '
      'whatsoever without our or, where applicable, our licensors’ prior '
      'written consent. You cannot create any work of authorship or '
      'proprietary right based on the Services (including Nuverse Content). '
      'You shall only use the Services as may be expressly provided in the '
      'Terms or to the extent permitted by law or (if applicable) relevant '
      'open source licenses. We and our licensors reserve all rights not '
      'expressly granted in and to their conteSubject to these Terms, you are '
      'hereby granted a non-exclusive, personal, non-transferable, '
      'non-sublicensable, revocable limited license to access and use the '
      'Services, including to download the Game on a permitted device, and to '
      'access the Nuverse Content solely for your personal, non-commercial '
      'use through your use of the Services and solely in compliance with '
      'these Terms. Nuverse reserves all rights not expressly granted herein '
      'in the Services (including Nuverse Content). You acknowledge and agree '
      'that Nuverse may terminate this license at any time for convenience '
      'subject to applicable lWhere our Services may contain links to other '
      'sites and resources provided by third parties, these links are provided '
      'for your information only. We have no control over the contents of '
      'those sites or resources. Such links should not be interpreted as '
      'approval or endorsement by us of those linked websites or information '
      'you may obtain from thYou acknowledge and agree that Nuverse Content '
      'may include designs, graphics, characters, indicia of origin or other '
      'content owned by Marvel Brands LLC or its affiliates '
      '(“Marvel Content”).  To the extent that you make or purport to make '
      'any contribution or improvement to Marvel Content, such contribution '
      'or improvement shall be deemed a “Work Made for Hire” to the extent '
      'permitted by the United States Copyright Act. To the extent that any '
      'such work of authorship may be deemed not to be a Work Made for Hire, '
      'you hereby irrevocably assign all right, title and interest in such '
      'contribution or improvement to Marvel Brands L';
  static const String _title9 = '9.Feedback: ';
  static const String _text9 =
      'While we are continually working to develop and evaluate our own '
      'product ideas and features, we pride ourselves on paying close '
      'attention to the interests, feedback, comments, and suggestions we '
      'receive from the user community. If you choose to contribute by '
      'sending us any ideas for products, services, features, modifications, '
      'enhancements, content, refinements, technologies, content offerings '
      '(such as audio, visual or other types of content), promotions, '
      'strategies, or product/feature names, or any related documentation, '
      'artwork, computer code, diagrams, or other materials '
      '(collectively "Feedback"), then regardless of what your accompanying '
      'communication may say, the following terms will apply, so that future '
      'misunderstandings can be avoided. Accordingly, by sending Feedback to '
      'us, you agree that:Nuverse has no obligation to review, consider, or '
      'implement your Feedback, or to return to you all or part of any '
      'Feedback for any reason;Feedback is provided on a non-confidential '
      'basis, and we are not under any obligation to keep any Feedback you '
      'send confidential or to refrain from using or disclosing it in any way; '
      'andYou irrevocably grant us perpetual and unlimited permission to '
      'reproduce, distribute, create derivative works of, modify, publicly '
      'perform (including on a through-to-the-audience basis), communicate to '
      'the public, make available, publicly display, and otherwise use and '
      'exploit the Feedback and derivatives thereof for any purpose and '
      'without restriction, free of charge and without attribution of any '
      'kind, including by making, using, selling, offering for sale, '
      'importing, and promoting commercial products and services that '
      'incorporate or embody Feedback, whether in whole or in part, and '
      'whether as provided or as modified.';
  static const String _title10 = '10.Equipment Requirement: ';
  static const String _text10 =
      'To use the Services, you may need certain hardware, software, '
      'capabilities and other resources (including a suitable connection to '
      'the Internet). You are solely responsible for procuring and '
      'maintaining such resources at your own cost. ';
  static const String _title11 =
      '11.Beta Version, Updates, Interruption and Termination of the Game: ';
  static const String _text11 =
      'We may make available a beta version of the Game ("Beta Game") prior '
      'to an official release of the Game. To the maximum extent permitted by '
      'applicable law, the Beta Game is provided for testing on an "as is" '
      'and "as available" basis and we make no warranty, expressly or by '
      'implication, to you of any kind. You understand and agree that the '
      'Beta Game may not operate correctly, the Beta Game may contain '
      'defects, and playing the Beta Game is at your own risk. '
      'We have no obligations to you with respect to Beta Game, including '
      'without limitation any obligation to provide an official version of the '
      'Game in the future. We may reset the Beta Game, including any in-Game '
      'setting (e.g., game character, achievements and inventory items) at '
      'anytime during the testing period of the Beta Game. You acknowledge '
      'that the change or modification of the Beta Game may cause a loss of '
      'data, function or utility related to the Beta Game. You agree that we '
      'are not liable to you for such loss to the maximum extent permitted by '
      'applicable law. All Virtual Items (including downloadable content) you '
      'obtained during your use of the Beta Game will be removed from your '
      'account when the Beta Game is reset. We may collect additional personal data through the Beta Game that may not be collected in the official release. This personal data may include information about your device and network, account information and user-generated content, your use of the Beta Game, feedback you provide to us, and other data described in our Privacy Notice. This personal data may be used for improving the Beta Game or any other purpose described in our Privacy Notice. From time to time, we have the right (but not obligation) to provide updates (patches, new features, etc.) to the Game for free or for a fee. We may require you to download and install the updates or the updated version of the Game to continue to use the Services. You understand that your access to certain features of the Services might be affected by such updates. You also agree that we may use background patching to automatically update our Game and software with or without notice to you. You also understand that such updates may affect the necessary system specification required to play the Game. In such case, you are responsible for any necessary equipment to continue to access the Services.You acknowledge that the Service or any part thereof may be interrupted for maintenance or reasons beyond our control, and we cannot guarantee that the Services will not be interrupted. We shall not be liable for any interruption of the Services, delay or failure to perform resulting from any causes whatsoever. Additionally, the Service may be unavailable depending on geographic location.To the maximum extent permitted by applicable law, we reserve the right to discontinue the Service at any time in our sole discretion, for any reason, or for no reason, with or without notice; provided, however, that in the event that we terminate your access to the Game because we no longer have the right to provide it in connection with the Services, we will work in good faith to promptly transition your account and rights to a third-party provider of services that succeeds to the rights in the Game held by us.';
  static const String _title12 = '12.Code of Conduct: ';
  static const String _text12 =
      'Your access to and use of the Services is subject to these Terms and '
      'all applicable laws and regulations. You may not:access or use the '
      'Services if you are not fully able and legally competent to agree to '
      'these Termsexcept as expressly permitted by these Terms or applicable '
      'law, make unauthorized copies, modify, adapt, translate, reverse '
      'engineer, disassemble, decompile or create any derivative works of the '
      'Services or any content included therein, including any software, '
      'Virtual Items (or any portion thereof) or determine or attempt to '
      'determine any source code, algorithms, methods or techniques embodied by the Services or any derivative works thereofdistribute, license, transfer, or sell, in whole or in part, any of the Services or any derivative works thereofmarket, rent or lease the Services for a fee or charge, or use the Services to advertise or perform any commercial solicitationuse the Services, without our express written consent, for any commercial, political or unauthorized purpose, including communicating or facilitating any commercial advertisement or solicitation or spamminginterfere with or attempt to interfere with the proper working of the Services, disrupt our website (if any) or any networks connected to the Services, or bypass any measures we may use to prevent or restrict access to the Servicesincorporate the Services or any portion thereof into any other program or productuse automated scripts, software, code or systems to collect information from or otherwise interact with the Servicesimpersonate any person or entity, or falsely state or otherwise misrepresent you or your affiliation with any person or entity, including giving the impression that any content you upload, post, transmit, distribute or otherwise make available emanates from the Servicesintimidate or harass another, or promote sexually explicit material, violence or discrimination based on race, sex, religion, nationality, disability, sexual orientation or ageuse or attempt to use another’s account, service or system without authorization from Nuverseuse the Services in a manner that may create a conflict of interest or undermine the purposes of the Servicesuse or exploit any cheats, bots, hacks, bugs, errors, or design flaws to obtain unauthorized access to the Service or to gain an unfair advantage in game playtrade, sell, duplicate Virtual Items in or outside the Game unless otherwise expressly permitted by Nuversehost, provide or develop matchmaking services for the Game, unless otherwise expressly authorized by Nuverseuse the Services to upload, transmit, distribute, store or otherwise make available in any way: files that contain viruses, trojans, worms, logic bombs or other material that is malicious or technologically harmful; any unsolicited or unauthorized advertising, solicitations, promotional materials, "junk mail," "spam," "chain letters," "pyramid schemes," or any other prohibited form of solicitation; any private information of any third party, including addresses, phone numbers, email addresses, number and feature in the personal identity document (e.g., National Insurance, social security numbers, passport numbers) or credit card numbers; any material which does or may infringe any copyright, trade mark or other intellectual property or privacy rights of any other person; any material which is defamatory of any person, obscene, offensive, pornographic, hateful or inflammatory; any material that would constitute, encourage or provide instructions for a criminal offence, dangerous activities or self-harm; any material that is deliberately designed to provoke or antagonize people, especially trolling and bullying, or is intended to harass, harm, hurt, scare, distress, embarrass or upset people; any material that contains a threat of any kind, including threats of physical violence; any material that is racist or discriminatory, including discrimination on the basis of someone’s race, religion, age, gender, disability or sexuality	any answers, responses, comments, opinions, analysis or recommendations that you are not properly licensed or otherwise qualified to provide; omaterial that restricts or inhibits any other person from using the Services, or which may expose Nuverse, the Services or its users to any harm or liability of any typeWe reserve the right, at any time and without prior notice, to remove or disable your access to the Services, including the Game, Nuverse Content and Virtual Items, at our discretion for any reason or no reason. Some of the reasons for which we may remove or disable your access to the Services may include finding that you have violated these Terms, or that your actions are harmful to the Services or our users. Notwithstanding the foregoing, in the event that we terminate your access to the Game because we no longer have the right to provide it in connection with the Services, we will work in good faith to promptly transition your account to a third-party provider of services that succeeds to the rights in the Game';
  static const String _title13 = '13.Indemnity: ';
  static const String _text13 =
      'You agree to, at your sole cost, defend, indemnify, and hold harmless '
      'Nuverse, its parents, subsidiaries, and affiliates, and each of their '
      'respective officers, directors, employees, agents, suppliers and '
      'advisors from and against any and all claims, liabilities, costs, fines, penalties and expenses, including, but not limited to, attorneys’ fees and expenses, arising out of or in any way connected with any of the following: (i) a breach by you or any user of your account of any applicable obligation, representation or warranty under these Terms;  (ii) our use, non-use or publication of your Feedback infringes any third party intellectual property rights; (iii) your access to or use of, activities in connection with, or the actual or threatened termination of your access to the Services; (iv) your violation of any applicable laws, rules, regulations or contracts; or (v) any misrepresentation made by you (all of the foregoing, "Claims and Losses"). You will cooperate as fully required by us in the defense of any Claims and Losses. Notwithstanding the foregoing, we retain the exclusive right to settle, compromise, and pay any and all Claims and Losses. We reserve the right to assume the exclusive defense and control of any Claims and Losses at our own cost. You will not settle any Claims and Losses without, in each instance, the prior written consent of an officer of the indemnified party.';
  static const String _title14 = '14.EXCLUSION OF WARRANTIES: ';
  static const String _text14 =
      'CERTAIN JURISDICTIONS DO NOT ALLOW LIMITATIONS ON IMPLIED WARRANTIES '
      'OR THE EXCLUSION OR LIMITATION OF CERTAIN DAMAGES.NOTHING IN THESE '
      'TERMS SHALL AFFECT ANY STATUTORY RIGHTS THAT YOU CAN NOT CONTRACTUALLY AGREE TO ALTER OR WAIVE AND ARE LEGALLY ALWAYS ENTITLED TO AS A CONSUMER. THE SERVICES ARE PROVIDED "AS IS" AND WE MAKE NO WARRANTY OR REPRESENTATION TO YOU WITH RESPECT TO THEM. IN PARTICULAR WE DO NOT REPRESENT OR WARRANT TO YOU THYOUR USE OF THE SERVICES WILL MEET YOUR REQUIREMENYOUR USE OF THE SERVICES WILL BE UNINTERRUPTED, TIMELY, SECURE OR FREE FROM ERRANY INFORMATION OBTAINED BY YOU AS A RESULT OF YOUR USE OF THE SERVICES WILL BE ACCURATE OR RELIABLE;DEFECTS IN THE OPERATION OR FUNCTIONALITY OF ANY SOFTWARE PROVIDED TO YOU AS PART OF THE SERVICES WILL BE CORRECTNO CONDITIONS, WARRANTIES OR OTHER TERMS (INCLUDING ANY IMPLIED TERMS AS TO SATISFACTORY QUALITY, FITNESS FOR PURPOSE OR CONFORMANCE WITH DESCRIPTION) APPLY TO THE SERVICES EXCEPT TO THE EXTENT THAT THEY ARE EXPRESSLY SET OUT IN THE TERMS. WE MAY CHANGE, SUSPEND, WITHDRAW OR RESTRICT THE AVAILABILITY OF ALL OR ANY PART OF OUR GAME FOR BUSINESS AND OPERATIONAL REASONS AT ANY TIME WITHOUT NOTIYOUR USE OF THE SERVICE MAY DEPEND ON THE INTERNET, INCLUDING NETWORKS, CABLING, FACILITIES AND EQUIPMENT THAT IS NOT IN OUR CONTROL; ACCORDINGLY (I) WE CAN NOT GUARANTEE ANY MINIMUM LEVEL REGARDING SUCH PERFORMANCE, SPEED, RELIABILITY, AVAILABILITY, USE OR CONSISTENCY, AND (II) DATA, MESSAGES, INFORMATION OR MATERIALS SENT OVER THE INTERNET MAY NOT BE COMPLETELY PRIVATE, AND YOUR ANONYMITY IS NOT GUARANTEED.';
  static const String _title15 = '15.LIMITATION OF LIABILITY: ';
  static const String _text15 =
      'NOTHING IN THESE TERMS SHALL EXCLUDE OR LIMIT OUR LIABILITY FOR LOSSES '
      'WHICH MAY NOT BE LAWFULLY EXCLUDED OR LIMITED BY APPLICABLE LAW. THIS '
      'INCLUDES LIABILITY FOR DEATH OR PERSONAL INJURY CAUSED BY OUR '
      'NEGLIGENCE OR THE NEGLIGENCE OF OUR EMPLOYEES, AGENTS OR SUBCONTRACTORS AND FOR FRAUD OR FRAUDULENT MISREPRESENTATION.SUBJECT TO THE PARAGRAPH ABOVE, WE SHALL NOT BE LIABLE TO YOU FOR: (I) ANY LOSS OF PROFIT (WHETHER INCURRED DIRECTLY OR INDIRECTLY); (II) ANY LOSS OF GOODWILL; (III) ANY LOSS OF OPPORTUNITY; (IV) ANY LOSS OF DATA SUFFERED BY YOU; OR (V) ANY INDIRECT OR CONSEQUENTIAL LOSSES WHICH MAY BE INCURRED BY YOU. ANY OTHER LOSS WILL BE LIMITED TO THE AMOUNT PAID BY YOU TO NUVERSE WITHIN THE LAST 12 MONTHS.WE WILL ALSO NOT BE LIABLE TO YOU FOR ANY LOSS OR DAMAGE WHICH MAY BE INCURRED BY YOU AS A RESULT OF:ANY RELIANCE PLACED BY YOU ON THE COMPLETENESS, ACCURACY OR EXISTENCE OF ANY ADVERTISING, OR ANY RELATIONSHIP OR TRANSACTION BETWEEN YOU AND ANY ADVERTISER OR SPONSOR WHOSE ADVERTISING APPEARS ON THE SERVICE;ANY CHANGES WHICH WE MAY MAKE TO THE SERVICES, OR FOR ANY PERMANENT OR TEMPORARY CESSATION IN THE PROVISION OF THE SERVICES (OR ANY FEATURES WITHIN THE SERVICES);THE DELETION OF, CORRUPTION OF, OR FAILURE TO STORE, ANY CONTENT AND OTHER COMMUNICATIONS DATA MAINTAINED OR TRANSMITTED BY OR THROUGH YOUR USE OF THE SERVICES;YOUR FAILURE TO PROVIDE US WITH ACCURATE ACCOUNT INFORMATION;OR YOUR FAILURE TO KEEP YOUR PASSWORD OR ACCOUNT DETAILS SECURE AND CONFIDENTIAL.PLEASE NOTE THAT WE ONLY PROVIDE OUR SERVICES FOR PERSONAL AND PRIVATE USE. YOU AGREE NOT TO USE OUR SERVICES FOR ANY COMMERCIAL OR BUSINESS PURPOSES, AND WE HAVE NO LIABILITY TO YOU FOR ANY LOSS OF PROFIT, LOSS OF BUSINESS, LOSS OF GOODWILL OR BUSINESS REPUTATION, BUSINESS INTERRUPTION, OR LOSS OF BUSINESS OPPORTUNITY.THESE LIMITATIONS ON OUR LIABILITY TO YOU SHALL APPLY WHETHER OR NOT WE HAVE BEEN ADVISED OF OR SHOULD HAVE BEEN AWARE OF THE POSSIBILITY OF ANY SUCH LOSSES ARISING.YOU ARE RESPONSIBLE FOR ANY MOBILE CHARGES THAT MAY APPLY TO YOUR USE OF OUR SERVICE, INCLUDING TEXT-MESSAGING AND DATA CHARGES. IF YOU’RE UNSURE WHAT THOSE CHARGES MAY BE, YOU SHOULD ASK YOUR SERVICE PROVIDER BEFORE USING THE SERVICE.TO THE FULLEST EXTENT PERMITTED BY LAW, ANY DISPUTE YOU HAVE WITH ANY THIRD PARTY ARISING OUT OF YOUR USE OF THE SERVICES, INCLUDING, BY WAY OF EXAMPLE AND NOT LIMITATION, ANY CARRIER, COPYRIGHT OWNER OR OTHER USER, IS DIRECTLY BETWEEN YOU AND SUCH THIRD PARTY, AND YOU IRREVOCABLY RELEASE US AND OUR AFFILIATES FROM ANY AND ALL CLAIMS, DEMANDS AND DAMAGES (ACTUAL AND CONSEQUENTIAL) OF EVERY KIND AND NATURE, KNOWN AND UNKNOWN, ARISING OUT OF OR IN ANY WAY CONNECTED WITH SUCH DISPUTES.';
  static const String _title16 = '16.Privacy Notice: ';
  static const String _text16 =
      'You also acknowledge and agree to our Privacy Notice, which also '
      'applies to your use of our Services. For information on how we may use '
      'your personal data when you use the Services, please refer to our '
      'Privacy Notice. Our Privacy Notice can be found directly on the '
      'Services, or where the Game is made available for download, on your '
      'mobile device’s applicable app store, and are incorporated herein by reference.  By accepting these Terms or accessing the Services or Game, you hereby consent to our Privacy Notice.';
  static const String _title17 = '17.Copyright Claims: ';
  static const String _text17 =
      'If you believe that anything on the Service infringes upon any '
      'copyright which you own or control, you may file a notification of '
      'such infringement to the contact information set below:legal '
      '@marvelsnap.com';
  static const String _title18 = '18. Your Access to and Use of Our Services: ';
  static const String _text18 =
      'Your access to and use of the Services is subject to these Terms and '
      'all applicable laws and regulations. You may not:access or use the '
      'Services in a manner that violates applicable laws and regulations, '
      'including anti-money laundering and counter terrorist financing laws and export control and economic sanctions laws. Consistent with and in furtherance of this requirement, you agree that you will not export or re-export, directly or indirectly the Services and/or other information or materials provided by Nuverse hereunder, to any country or territory for which any other relevant jurisdiction requires any export license or other governmental approval at the time of export or re-export without first obtaining such license or approval. You further agree not to export, re-export, or provide any of the Services in violation of applicable export controls or economic sanctions (a) into any country or territory against which comprehensive sanctions are imposed, administered, implemented and/or enforced by any relevant government authority or regulatory body, including Cuba, Crimea, Iran, North Korea, and Syria, or (b) to anyone listed on any list of prohibited or restricted parties issued and maintained by any relevant government authority or regulatory body, including but not limited to the United Nations Security Council Consolidated Sanctions List, the EU Consolidated Financial Sanctions List, and the U.S. Treasury Departments List of Specially Designated Nationals and Blocked Persons List. At our sole discretion, we reserve the right to immediately suspend a users use of the Services and/or terminate a users account if we suspect money laundering, terrorist financing, activities that violate economic sanctions or export control laws, or other illegal activity by the user. We will not be liable for any loss or damage incurred by a user as a result of such suspension of the users Services and-or termination of the users account.';
  static const String _title19 = '19.Other Terms: ';
  static const String _text19 =
      'Applicable Law and Jurisdiction. Subject to the Supplemental Terms – '
      'Jurisdiction-Specific, these Terms, their subject matter and their '
      'formation, are governed by the laws of Hong Kong. Any dispute arising '
      'out of or relating to these Terms or prior versions thereof, including '
      'any question regarding existence, breach, interpretation, validity, '
      'enforcement, or termination of these Terms; the Services; the Game; '
      'Nuverse Content; your relationship with us; the threatened or actual '
      'termination of your access to the Services or Game payments made to you '
      'or payments made or allegedly owed to you; or any other claims '
      '(collectively, "Covered Matters") shall be referred to and finally '
      'resolved by arbitration administered by the Hong Kong International '
      'Arbitration Centre ("HKIAC") in accordance with the Arbitration Rules '
      'of the HKIAC for the time being in force, which rules are deemed to be '
      'incorporated by reference in this clause. The seat of the arbitration '
      'shall be Hong Kong. The tribunal shall consist of three (3) '
      'arbitrators. The language of the arbitration shall be English. '
      'Notwithstanding the foregoing, we may institute a proceeding for '
      'equitable relief in any court of competent jurisdiction.Class Action '
      'Waiver. Subject to the Supplemental Terms –Jurisdiction-Specific, any '
      'action brought by you, including without limitation arbitration, will '
      'proceed solely on an individual basis without the right for any claim '
      'to be adjudicated on a class action basis or on any basis involving '
      'claims brought in a purported representative capacity on behalf of '
      'others.Entire Agreement. These Terms (including the Supplemental '
      'Terms below) constitute the whole legal agreement between you and '
      'Nuverse and govern your use of the Services and completely replace '
      'any prior agreements between you and Nuverse in relation to the '
      'Services.Links. You may link to our home page or page of the Game or '
      'Services, provided you do so in a way that is fair and legal and does '
      'not damage our reputation or take advantage of it. You must not '
      'establish a link in such a way as to suggest any form of association, '
      'approval or endorsement on our part where none exists. You must not '
      'establish a link to our Services in any website that is not owned by you. The website in which you are linking must comply in all respects with the content standards set out at "Code of Conduct" above. We reserve the right to withdraw linking permission without notice.No Waiver. Our failure to insist upon or enforce any provision of these Terms shall not be construed as a waiver of any provision or right.Security. We do not guarantee that our Services will be secure or free from bugs or viruses. You are responsible for configuring your information technology, computer programs and Game to access our Services. You should use your own virus protection software.Severability. If any court of law, having jurisdiction to decide on this matter, rules that any provision of these Terms is invalid, then that provision will be removed from the Terms without affecting the rest of the Terms, and the remaining provisions of the Terms will continue to be valid and enforceable.Open Source. This game may contain certain open source software. Each item of open source software is subject to its own applicable license terms.Translations. In the event of any conflict or inconsistency between the Terms in the English and any translation thereof in any other language, the English version shall prevail.Any Questions? Need help with the Game?  Get in touch at  info@marvelsnap.com.  Please note that neither Marvel Brands LLC nor its Affiliates provides or is obligated to provide maintenance or support services for the Game.';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height - 200,
      child: Padding(
        padding: SharedPaddings.all20,
        child: BaseColumn(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _mainTitleText(mainTitle: 'Terms of Service'),
            _lastUpdateDate(
              lastUpdateText: 'Last updated',
              lastUpdateDate: 'March 7, 2022',
            ),
            const Padding(
              padding: SharedPaddings.top12,
              child: Text(
                _welcomeText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const BottomSheetText(
              title: _title1,
              text: _text1,
            ),
            const BottomSheetText(
              title: _title2,
              text: _text2,
            ),
            const BottomSheetText(
              title: _title3,
              text: _text3,
            ),
            const BottomSheetText(
              title: _title4,
              text: _text4,
            ),
            const BottomSheetText(
              title: _title5,
              text: _text5,
            ),
            const BottomSheetText(
              title: _title6,
              text: _text6,
            ),
            const BottomSheetText(
              title: _title7,
              text: _text7,
            ),
            const BottomSheetText(
              title: _title8,
              text: _text8,
            ),
            const BottomSheetText(
              title: _title9,
              text: _text9,
            ),
            const BottomSheetText(
              title: _title10,
              text: _text10,
            ),
            const BottomSheetText(
              title: _title11,
              text: _text11,
            ),
            const BottomSheetText(
              title: _title12,
              text: _text12,
            ),
            const BottomSheetText(
              title: _title13,
              text: _text13,
            ),
            const BottomSheetText(
              title: _title14,
              text: _text14,
            ),
            const BottomSheetText(
              title: _title15,
              text: _text15,
            ),
            const BottomSheetText(
              title: _title16,
              text: _text16,
            ),
            const BottomSheetText(
              title: _title17,
              text: _text17,
            ),
            const BottomSheetText(
              title: _title18,
              text: _text18,
            ),
            const BottomSheetText(
              title: _title19,
              text: _text19,
            ),
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
}
