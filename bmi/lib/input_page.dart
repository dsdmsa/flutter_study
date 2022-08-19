import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const BOTTOM_CONTAINER_HEIGHT = 50.0;
const COLOR_BKG_CARD = Color(0xff1d1e33);
const COLOR_BKG_CARD_INACTIVE = Color(0xff131421);
const COLOR_BKG = Color(0xffeb1555);

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  // const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = COLOR_BKG_CARD_INACTIVE;
  Color femaleColor = COLOR_BKG_CARD_INACTIVE;

  void updateGenderCardColor(Gender gender) {
    setState(() {
      switch (gender) {
        case Gender.MALE:
          maleColor = COLOR_BKG_CARD;
          femaleColor = COLOR_BKG_CARD_INACTIVE;
          break;
        case Gender.FEMALE:
          maleColor = COLOR_BKG_CARD_INACTIVE;
          femaleColor = COLOR_BKG_CARD;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff313357),
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onCLick: () {
                      updateGenderCardColor(Gender.MALE);
                    },
                    bkgColor: maleColor,
                    cardChild:
                        getGederCardContent(FontAwesomeIcons.mars, "MALE"),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onCLick: () {
                      updateGenderCardColor(Gender.FEMALE);
                    },
                    bkgColor: femaleColor,
                    cardChild:
                        getGederCardContent(FontAwesomeIcons.venus, "FEMALE"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            bkgColor: COLOR_BKG_CARD,
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  bkgColor: COLOR_BKG_CARD,
                )),
                Expanded(
                    child: ReusableCard(
                  bkgColor: COLOR_BKG_CARD,
                )),
              ],
            ),
          ),
          Container(
            color: COLOR_BKG,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: BOTTOM_CONTAINER_HEIGHT,
          )
        ],
      ),
    );
  }

  Column getGederCardContent(IconData icon, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 18.0, color: Color(0xff8d8e98)),
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({
    this.bkgColor,
    this.cardChild,
    this.onCLick,
  });

  final Color? bkgColor;
  final Widget? cardChild;
  final VoidCallback? onCLick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCLick,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: bkgColor,
        ),
        child: cardChild,
      ),
    );
  }
}
