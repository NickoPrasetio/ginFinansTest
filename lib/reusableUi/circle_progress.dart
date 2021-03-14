import 'package:flutter/material.dart';
import 'package:ginFinans/util/palette.dart';

class CircleProgress extends StatelessWidget {
  final int total;
  final int step;
  const CircleProgress({this.total, this.step});
  
  @override
  Widget build(BuildContext context) {
    final double lineWidth = _calculateWidthBasedOnTotal(context, total);
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: total,
                itemBuilder: (BuildContext context, int index) {
                  Color circleColor = Palette.softGrey;
                  if (index < step){
                    circleColor = Palette.stepGreen;
                  }
                  return Row(children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: circleColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Palette.black,
                          width: 2.5,
                        ),
                      ),
                      child: Center(
                        child: Text((index + 1).toString()),
                      ),
                    ),
                    if (!(index == total - 1))
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.0),
                          child: Container(
                              height: 2.5,
                              width: lineWidth,
                              color: Palette.black))
                  ]);
                })));
  }

  double _calculateWidthBasedOnTotal(context, int total) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double lineWidth = ((screenWidth - 40) / total) - 40;
    return lineWidth;
  }
}
