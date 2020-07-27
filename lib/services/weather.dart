import 'location.dart';
import 'networking.dart';

const apikey = 'fb2ce45fc35eeb88c7ce5ebe3920c98a';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Future<dynamic> getLocationWeather() async {
    // print("func");
    Location location = Location();
    await location.getCurrentLocation();
    // print(location.latitude);
    NetworkHandel networkHandelObj = NetworkHandel(
        'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var data = await networkHandelObj.getData();
    // print(data);

    return data;
  }

  Future<dynamic> getLocationWeatherByCityName(String cityNAme) async {
    // print("func");
    Location location = Location();
    await location.getCurrentLocation();
    // print(location.latitude);
    NetworkHandel networkHandelObj = NetworkHandel(
        'http://api.openweathermap.org/data/2.5/weather?q=$cityNAme&appid=$apikey&units=metric');
    var data = await networkHandelObj.getData();
    // print(data);

    return data;
  }
}
