import 'package:http/http.dart' as http;

Future getCovidStats() async {
  var url = Uri.parse('https://api.rootnet.in/covid19-in/stats/latest');
  var response = await http.get(url);
  return response;
}

Future getpkCovidStats() async {
  var url =
      Uri.parse('https://coronavirus-19-api.herokuapp.com/countries/Pakistan');
  var response = await http.get(url);
  return response;
}
