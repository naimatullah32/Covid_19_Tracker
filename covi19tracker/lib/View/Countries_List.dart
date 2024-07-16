import 'package:covi19tracker/Services/states_services.dart';
import 'package:covi19tracker/View/details_Screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: 'Search country name',
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: stateServices.countriesListApi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            children: [
                              ListTile(
                                title: Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.white,
                                ),
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index]["country"];
                        if (searchController.text.isEmpty || name.toLowerCase().contains(searchController.text.toLowerCase())) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DetailScreen(
                                         image: snapshot.data![index]["countryInfo"]["flag"],
                                        name: snapshot.data![index]["country"],
                                         critical: snapshot.data![index]["critical"],
                                         active: snapshot.data![index]["active"],
                                         // test: snapshot.data![index]["test"],
                                        todayRecovered: snapshot.data![index]["todayRecovered"],
                                         totalCases: snapshot.data![index]["cases"],
                                         totalDeaths: snapshot.data![index]["deaths"],
                                         totalRecovered: snapshot.data![index]["recovered"],
                                      ),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  title: Text(snapshot.data![index]["country"]),
                                  subtitle: Text(snapshot.data![index]["cases"]
                                      .toString()),
                                  leading: Image(
                                    height: 60,
                                    width: 60,
                                    image: NetworkImage(snapshot.data![index]
                                    ["countryInfo"]["flag"]),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
