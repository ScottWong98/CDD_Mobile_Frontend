import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetWeightChart extends StatefulWidget {
  PetWeightChart({Key key, @required this.type}) : super(key: key);
  var type;
  @override
  _PextWeightChartState createState() => _PextWeightChartState();
}

class _PextWeightChartState extends State<PetWeightChart>{
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  var date = DateTime.now();
  //var start_date = DateTime.now().subtract(new Duration(days: 7));
  bool showAvg = false;
  int minx, maxx, miny, maxy;

  @override
  Widget build(BuildContext context) {
    if(widget.type == 'week'){
      minx = 0;
      maxx = 12;
    }else if(widget.type == 'month'){
      minx = 0;
      maxx = 30;
    }else{
      minx = 0;
      maxx = 365;
    }
    miny = 0;
    maxy = 10;
    //print(date);
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.30,    //宽高比
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(18),
                ),
                color: const Color(0xff232d37)),
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: showAvg ? AverageLineChart(minx: minx,maxx: maxx,miny: miny,maxy: maxy) : MainLineChart(minx: minx,maxx: maxx,miny: miny,maxy: maxy),
            ),
          ),
        ),
        SizedBox(
          width: 50,
          height: 34,
          child: FlatButton(
            shape: new StadiumBorder(side: new BorderSide(
              style: BorderStyle.solid,
              color: Colors.grey[400],
            )),
            color: Colors.grey[700],
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                  fontSize: 10, color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class MainLineChart extends StatelessWidget {
  MainLineChart({@required this.minx, @required this.maxx, @required this.miny, @required this.maxy});
  int minx, maxx, miny, maxy;
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  @override
  Widget build(BuildContext context) {
    return LineChart(
        LineChartData(
          gridData: FlGridData(       //网格
            show: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (value) {
              return const FlLine(
                color: Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return const FlLine(
                color: Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(         //横纵坐标的文字部分
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              textStyle:
              TextStyle(color: const Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
              getTitles: (value) {
                switch (value.toInt()) {
                  case 0:
                    return 'Mon';
                  case 2:
                    return 'Tues';
                  case 4:
                    return 'Wed';
                  case 6:
                    return 'Thur';
                  case 8:
                    return 'Fri';
                  case 10:
                    return 'Sat';
                  case 12:
                    return 'Sun';
                }
                return '';
              },
              margin: 8,
            ),
            leftTitles: SideTitles(
              showTitles: true,
              textStyle: TextStyle(
                color: const Color(0xff67727d),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              getTitles: (value) {
                switch (value.toInt()) {
                  case 1:
                    return '10k';
                  case 3:
                    return '30k';
                  case 5:
                    return '50k';
                }
                return '';
              },
              reservedSize: 28,
              margin: 12,
            ),
          ),
          borderData:
          FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
          minX: 0,        //决定横纵坐标多少格
          maxX: 12,
          minY: 0,
          maxY: 10,
          lineBarsData: [
            LineChartBarData(      //表格内的点位置
              spots: const [
                FlSpot(1, 3),
                FlSpot(2.6, 5),
                FlSpot(3, 5),
                FlSpot(4, 3.1),
                FlSpot(5, 4),
                FlSpot(6, 3),
                FlSpot(7, 4),
              ],
              isCurved: true,   //折线还是曲线
              colors: gradientColors,
              barWidth: 5,      //线条宽度
              isStrokeCapRound: true,
              dotData: const FlDotData(
                show: true,     //是否坐标点位置显示点
              ),
              belowBarData: BarAreaData(   //阴影区域
                show: true,
                colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
              ),
            ),
          ],
        ),
    );
  }
}

class AverageLineChart extends StatelessWidget {
  AverageLineChart({@required this.minx, @required this.maxx, @required this.miny, @required this.maxy});
  int minx, maxx, miny, maxy;
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  @override
  Widget build(BuildContext context) {
    return LineChart(
        LineChartData(
          lineTouchData: const LineTouchData(enabled: false),
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return const FlLine(
                color: Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            getDrawingHorizontalLine: (value) {
              return const FlLine(
                color: Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              textStyle:
              TextStyle(color: const Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
              getTitles: (value) {
                switch (value.toInt()) {
                  case 2:
                    return 'MAR';
                  case 5:
                    return 'JUN';
                  case 8:
                    return 'SEP';
                }
                return '';
              },
              margin: 8,
            ),
            leftTitles: SideTitles(
              showTitles: true,
              textStyle: TextStyle(
                color: const Color(0xff67727d),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              getTitles: (value) {
                switch (value.toInt()) {
                  case 1:
                    return '10k';
                  case 3:
                    return '30k';
                  case 5:
                    return '50k';
                }
                return '';
              },
              reservedSize: 28,
              margin: 12,
            ),
          ),
          borderData:
          FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
          minX: 0,
          maxX: 10,
          minY: 0,
          maxY: 10,
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 3.44),
                FlSpot(2.6, 3.44),
                FlSpot(4.9, 3.44),
                FlSpot(6.8, 3.44),
                FlSpot(8, 3.44),
                FlSpot(9.5, 3.44),
                FlSpot(11, 3.44),
              ],
              isCurved: true,
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
                ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
              ],
              barWidth: 5,
              isStrokeCapRound: true,
              dotData: const FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(show: true, colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2).withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2).withOpacity(0.1),
              ]),
            ),
          ],
        ),
    );
  }
}