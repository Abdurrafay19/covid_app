import 'package:covid_app/Services/Utilities/stats_services.dart';
import 'package:covid_app/details_screen.dart';
import 'package:covid_app/loading_countries_list.dart';
import 'package:flutter/material.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        elevation: 0,
        backgroundColor: Colors.white10.withOpacity(0),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintStyle: const TextStyle(color: Colors.grey),
                  hintText: 'Search for a Country',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  )),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
              child: FutureBuilder(
                  future: statsServices.countriesListApi(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return const LoadingCountriesList();
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data![index]['country'];

                            if (searchController.text.isEmpty) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(
                                        image: snapshot.data![index]['countryInfo']['flag'],
                                        name: snapshot.data![index]['country'],
                                        totalCases: snapshot.data![index]['cases'],
                                        totalRecovered: snapshot.data![index]['recovered'],
                                        totalDeaths: snapshot.data![index]['deaths'],
                                        active: snapshot.data![index]['active'],
                                        test: snapshot.data![index]['tests'],
                                        todayRecovered: snapshot.data![index]['todayRecovered'],
                                        critical: snapshot.data![index]['critical'],
                                      )));
                                    },
                                    child: ListTile(
                                      title: Text(
                                        snapshot.data![index]['country'],
                                        style:
                                            const TextStyle(color: Colors.white),
                                      ),
                                      subtitle: Text(
                                        snapshot.data![index]['cases'].toString(),
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      leading: Image(
                                          height: 50,
                                          width: 50,
                                          image: NetworkImage(
                                              snapshot.data![index]['countryInfo']
                                                  ['flag'])),
                                    ),
                                  )
                                ],
                              );
                            } else if (name.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(
                                        image: snapshot.data![index]['countryInfo']['flag'],
                                        name: snapshot.data![index]['country'],
                                        totalCases: snapshot.data![index]['cases'],
                                        totalRecovered: snapshot.data![index]['recovered'],
                                        totalDeaths: snapshot.data![index]['deaths'],
                                        active: snapshot.data![index]['active'],
                                        test: snapshot.data![index]['tests'],
                                        todayRecovered: snapshot.data![index]['todayRecovered'],
                                        critical: snapshot.data![index]['critical'],
                                      )));
                                    },
                                    child: ListTile(
                                      title: Text(
                                        snapshot.data![index]['country'],
                                        style:
                                            const TextStyle(color: Colors.white),
                                      ),
                                      subtitle: Text(
                                        snapshot.data![index]['cases'].toString(),
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      leading: Image(
                                          height: 50,
                                          width: 50,
                                          image: NetworkImage(
                                              snapshot.data![index]['countryInfo']
                                                  ['flag'])),
                                    ),
                                  )
                                ],
                              );
                            } else {
                              Container();
                            }
                          });
                    }
                  }))
        ],
      )),
    );
  }
}
