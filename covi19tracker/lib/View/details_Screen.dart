import 'package:covi19tracker/View/Word_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget{
  String name;
  String image;
  int totalCases;
  int totalDeaths;
  int totalRecovered;
  int active;
  int critical;
  int todayRecovered;
   DetailScreen({
     required this.name,
    required this.image,
    required this.critical,
     required this.active,
     required this.todayRecovered,
   required this.totalCases,
    required this.totalDeaths,
     required this.totalRecovered

  });
  @override
  State<DetailScreen> createState() => _detailsScreenState();
}

class _detailsScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title:Text(widget.name,style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*.06,),
                      ReusableRow(value: 'Cases', title: widget.totalCases.toString()),
                      ReusableRow(value: 'Total Deaths', title: widget.totalDeaths.toString()),
                      ReusableRow(value: 'Total Recovered', title: widget.totalRecovered.toString()),
                      ReusableRow(value: 'Active', title: widget.active.toString()),
                      ReusableRow(value: 'Critical', title: widget.critical.toString()),
                      ReusableRow(value: 'Today Recovered', title: widget.todayRecovered.toString()),
                      // ReusableRow(value: 'Test', title: widget.test.toString())
                    ],
                  ),
                ),
              ),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}