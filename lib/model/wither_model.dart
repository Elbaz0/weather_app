class witherModel {
  final String cityname;
  final String date;
  final String image;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String weathercondition;
  witherModel(
      {required this.cityname,
      required this.date,
      required this.image,
      required this.maxtemp,
      required this.mintemp,
      required this.temp,
      required this.weathercondition});

  factory witherModel.fromJson(json) {
    return witherModel(
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      cityname: json['location']['name'],
      date: json['current']['last_updated'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      weathercondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
