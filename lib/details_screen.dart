import 'package:covid_app/world_statistics.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class DetailsScreen extends StatefulWidget {
  String image;
  String name;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  DetailsScreen(
      {super.key, required this.name,
      required this.todayRecovered,
      required this.critical,
      required this.active,
      required this.image,
      required this.test,
      required this.totalCases,
      required this.totalDeaths,
      required this.totalRecovered});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}


class _DetailsScreenState extends State<DetailsScreen> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(duration:const Duration(seconds: 3),vsync: this)..repeat();

  @override

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorsList = <Color>[
    const Color(0xFF0092e8),
    const Color(0xFF00c300),
    const Color(0xFFff1507),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.white12.withOpacity(0),
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(widget.name,style: const TextStyle(color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PieChart(
              dataMap: {
                "Total": double.parse(widget.totalCases.toString()),
                "Recovered": double.parse(widget.totalRecovered.toString()),
                "Deaths": double.parse(widget.totalDeaths.toString()),
              },
              chartValuesOptions: const ChartValuesOptions(
                showChartValuesInPercentage: true,
              ),
              legendOptions: const LegendOptions(
                  legendPosition: LegendPosition.left,
                  showLegendsInRow: false,
                  legendTextStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              chartRadius: MediaQuery.of(context).size.width /3.2,
              chartType: ChartType.ring,
              colorList: colorsList,
            ),
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    color: Colors.white10,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * .06,),
                          ReusableRow(value: widget.totalCases.toString(), title: 'Cases'),
                          ReusableRow(value: widget.totalRecovered.toString(), title: 'Recovered'),
                          ReusableRow(value: widget.totalDeaths.toString(), title: 'Death'),
                          ReusableRow(value: widget.critical.toString(), title: 'Critical'),
                          ReusableRow(value: widget.totalRecovered.toString(), title: 'Total Recovered'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              CircleAvatar(radius: 50,backgroundImage: NetworkImage(widget.image),)
            ],
          ),
          SizedBox(height: 80,),
        ],
      ),
    );
  }
}
