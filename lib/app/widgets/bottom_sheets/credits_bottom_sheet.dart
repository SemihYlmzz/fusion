import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../text/gradient_fusion_text.dart';

class CreditsBottomSheet extends StatelessWidget {
  const CreditsBottomSheet({super.key});
  static const String _createdByText = 'CREATED BY DEVANGS';
  static const String _title1 = 'Card Images';
  static const String _text1 = 'Midjourney AI';
  static const String _title2 = 'Icons';
  static const String _text2 = 'Icon Mania';
  static const String _text2_1 = 'max.icons';
  static const String _text2_2 = 'empty';
  static const String _title3 = 'Animations';
  static const String _text3 = 'Canvalisa';
  static const String _title4 = 'Background Musics';
  static const String _text4 = 'Alexander Nakarada';
  static const String _text4_1 = 'UNIVERSFIELD';
  static const String _title5 = 'Sound Effects';
  static const String _text5 = 'Pixabay';
  static const String _text5_1 = 'UNIVERSFIELD';
  static const String _title6 = 'Developers';
  static const String _text6 = 'Selahaddin Semih Yılmaz';
  static const String _text6_1 = 'Isco';
  static const String _title7 = 'UI/UX Designer';
  static const String _text7 = 'Halil İbrahim Kaya';
  static const String _title8 = 'Additional Thanks';
  static const String _text8 = 'FIGMA';
  static const String _text8_1 = 'FLUTTER';
  static const String _text8_2 = 'DART';
  static const String _text8_3 = 'FLAME';
  static const String _text8_4 = 'FLATICON';
  static const String _text8_5 = 'GITHUB';
  static const Map<int, dynamic> abc = {
    0: {
      'title': 'title1',
      'katkıda bulunanlar': ['ahmet', 'mehmet', 'mesut'],
    },
    1: {
      'title': 'title1',
      'katkıda bulunanlar': ['ahmet', 'mehmet', 'mesut'],
    },
    2: {
      'title': 'title1',
      'katkıda bulunanlar': ['ahmet', 'mehmet', 'mesut'],
    },
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade900,
      height: MediaQuery.sizeOf(context).height - 200,
      child: Padding(
        padding: SharedPaddings.all16,
        child: BaseColumn(
          children: [
            const GradientFusionText(),
            Padding(
              padding: SharedPaddings.vertical20 + SharedPaddings.bottom20,
              child: const Text(
                _createdByText,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            _createdBy(title: _title1, text: _text1),
            _createdBy(title: _title2, text: '$_text2\n$_text2_1\n$_text2_2'),
            _createdBy(title: _title3, text: _text3),
            _createdBy(title: _title4, text: '$_text4\n$_text4_1'),
            _createdBy(title: _title5, text: '$_text5\n$_text5_1'),
            _createdBy(title: _title6, text: '$_text6\n$_text6_1'),
            _createdBy(title: _title7, text: _text7),
            _createdBy(
              title: _title8,
              text: '$_text8\n'
                  '$_text8_1\n'
                  '$_text8_2\n'
                  '$_text8_3\n'
                  '$_text8_4\n'
                  '$_text8_5',
            ),
            _happinessText(),
          ],
        ),
      ),
    );
  }

  Widget _happinessText() {
    return Padding(
      padding: SharedPaddings.all20,
      child: Text(
        'We would like to express our special thanks to everyone who '
        'contributed to the development of the Fusion game.',
        style: GoogleFonts.bangers(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _textWidget({required String text}) {
    return Padding(
      padding: SharedPaddings.top4 + SharedPaddings.bottom32,
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _createdBy({
    required String title,
    required String text,
  }) {
    return Column(
      children: [
        GradientTextButton(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        _textWidget(text: text),
      ],
    );
  }
}
