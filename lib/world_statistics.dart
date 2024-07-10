import 'package:covid_app/Services/Models/world_stats_model.dart';
import 'package:covid_app/Services/Utilities/stats_services.dart';
import 'package:covid_app/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatistics extends StatefulWidget {
  const WorldStatistics({super.key});

  @override
  State<WorldStatistics> createState() => _WorldStatisticsState();
}

class _WorldStatisticsState extends State<WorldStatistics> with TickerProviderStateMixin{


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
    StatsServices statsServices = StatsServices();
    return Scaffold(
      backgroundColor: Colors.white12,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
             FutureBuilder(future: statsServices.fetchWorldStatsRecords(), builder: (context,AsyncSnapshot<WorldStatsModel> snapshot){

               if(!snapshot.hasData){
                 return Expanded(child: SpinKitWave(
                   color: Colors.white,
                   size: 50,
                   controller: _controller,
                 ));
               }else{
                 return Column(
                   children: [
                     PieChart(
                       dataMap: {
                         "Total": double.parse(snapshot.data!.cases.toString()),
                         "Recovered": double.parse(snapshot.data!.recovered.toString()),
                         "Deaths": double.parse(snapshot.data!.deaths.toString()),
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
                     Padding(
                       padding: const EdgeInsets.symmetric(vertical: 20),
                       child: Card(
                         color: Colors.white10,
                         child: Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                           child: Column(
                             children: [
                               ReusableRow(title: 'Total',value: snapshot.data!.cases.toString(),),
                               ReusableRow(title: 'Recovered',value: snapshot.data!.recovered.toString(),),
                               ReusableRow(title: 'Deaths',value: snapshot.data!.deaths.toString(),),
                               ReusableRow(title: 'Tests',value: snapshot.data!.tests.toString(),),
                               ReusableRow(title: 'Active',value: snapshot.data!.active.toString(),),
                               ReusableRow(title: 'Critical',value: snapshot.data!.critical.toString(),),
                               ReusableRow(title: 'Cases Today',value: snapshot.data!.todayCases.toString(),),
                               ReusableRow(title: 'Recovered Today',value: snapshot.data!.todayRecovered.toString(),),
                               ReusableRow(title: 'Deaths Today',value: snapshot.data!.todayDeaths.toString(),),
                             ],
                           ),
                         ),
                       ),
                     ),
                     GestureDetector(
                       onTap:(){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> const CountriesList()));
                       },
                       child: Container(
                         height: 50,
                         width: double.infinity,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(24),
                           color: Colors.green,
                         ),
                         child: const Center(
                           child: Text('Track Countries'),
                         ),
                       ),
                     ),
                   ],
                 );
               }

             }),

          ],
        ),
      )),
    );
  }
}
class ReusableRow extends StatelessWidget {
  final String title,value;
  const ReusableRow({super.key , required this.value,required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: const TextStyle(color: Colors.white),),
            Text(value,style: const TextStyle(color: Colors.white),),
          ],
        ),
        const SizedBox(height: 5,),
        const Divider(),
      ],
    );
  }
}

