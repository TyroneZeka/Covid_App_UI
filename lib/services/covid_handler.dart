import 'package:covid_19_update/services/location.dart';
import 'networking.dart';

class CovidModel {
  CovidModel({this.country});
  String country;

  Future<dynamic> getLocationCases() async {
    LocationServices location = LocationServices();
    await location.determinePosition();
    var country = location.country;
    DataHandler dataHandler = DataHandler(
        url:
            "https://disease.sh/v3/covid-19/countries/$country?yesterday=true&strict=false");

    var covidData = await dataHandler.getData();
    // print(covidData);
    return covidData;
  }

  Future<dynamic> getCountryCases(String country) async {
    var url =
        "https://disease.sh/v3/covid-19/countries/$country?yesterday=true&strict=false";
    DataHandler dataHandler = DataHandler(url: url);
    var countryCases = await dataHandler.getData();
    return countryCases;
  }
}
