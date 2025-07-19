

class WeatherModel{
  final String name;
  final double temp;
  final double tempMin;
  final double tempMax;

  WeatherModel({
    required this.name,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
  });

  WeatherModel.empty()
      : name = '',
        temp = 0.0,
        tempMin = 0.0,
        tempMax = 0.0;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      name: json['name'],
      temp: json["main"]['temp'],
      tempMin: json["main"]['temp_min'],
      tempMax: json["main"]['temp_max'],
    );
  }
}