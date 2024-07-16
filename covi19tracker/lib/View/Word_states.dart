

import 'package:covi19tracker/Model/WorldStatesModel.dart';
import 'package:covi19tracker/View/Countries_List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Services/states_services.dart';

class wordStatesScreen extends StatefulWidget{
  @override
  State<wordStatesScreen> createState() => _wordStatesScreenState();
}

class _wordStatesScreenState extends State<wordStatesScreen> with TickerProviderStateMixin {

  late final AnimationController _controller=AnimationController(
      duration: Duration(seconds: 3),
      vsync: this)..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorList= <Color>[
    Colors.blue,
    Colors.green,
    Colors.red,

  ];
  @override
  Widget build(BuildContext context) {
    StateServices stateServices= StateServices();
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                FutureBuilder(
                    future: stateServices.fatchWordlStateRecord(),
                    builder: (context,AsyncSnapshot<WorldStatesModel> snapshot){
                     if(!snapshot.hasData){
                       return Expanded(
                         flex: 1,
                         child: SpinKitFadingCircle(
                           size: 50,
                           color: Colors.blue,
                           controller: _controller
                         )
                       );
                     }
                     else
                     {
                       return Column(
                         children: [
                           PieChart(
                             dataMap: {
                               'Total':double.parse(
                                   snapshot.data!.cases!.toString()),
                               'Recovered':double.parse(
                                   snapshot.data!.recovered!.toString()),
                               'Death':double.parse(
                                   snapshot.data!.deaths!.toString()),

                             },
                           chartValuesOptions:const ChartValuesOptions(
                               showChartValuesInPercentage: true
                           ),

                           chartRadius: MediaQuery
                                 .of(context)
                                 .size
                                 .width / 3.2,

                             legendOptions: const LegendOptions(
                               legendPosition: LegendPosition.left,
                             ),
                             animationDuration: const Duration(
                                 microseconds: 2000),
                                 chartType: ChartType.ring,
                             colorList: colorList,
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 55),
                             child: Card(
                               child: Column(
                                 children: [
                                   ReusableRow(title: 'Total',value: snapshot.data!.cases!.toString(),),
                                   ReusableRow(title: 'Recovered',value: snapshot.data!.recovered!.toString(),),
                                   ReusableRow(title: 'Deaths',value: snapshot.data!.deaths!.toString(),),
                                   ReusableRow(title: 'Active',value: snapshot.data!.active!.toString(),),
                                   ReusableRow(title: 'Critical',value: snapshot.data!.critical!.toString(),),


                                 ],
                               ),
                             ),
                           ),
                           SizedBox(height: 20,),
                           InkWell(
                             onTap: (){
                               Navigator.push(context, MaterialPageRoute(
                                   builder: (context)=> CountriesList()));
                             },
                             child: Container(
                               height: 45,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15),
                                   color: Colors.blueAccent
                               ),
                               child: Center(child: Text("Track Country",
                                 style: TextStyle(fontSize: 15,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.white),),),
                             ),
                           ),
                           SizedBox(height: 20,),
                         ]
                       );
                     }
                    }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget{
  String title,value;
  ReusableRow({Key ? key ,required this.value,required this.title}): super(key: key);
  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 5),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(value),
          ],
        ),
        SizedBox(height: 10,),
        Divider()
      ],
    ),
  );
  }

}