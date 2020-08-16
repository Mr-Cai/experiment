import 'package:meta/meta.dart';

class Weather {
  final String cityName;
  final double temp;

  Weather({
    @required this.cityName,
    @required this.temp,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Weather && o.cityName == cityName && o.temp == temp;
  }

  @override
  int get hashCode => cityName.hashCode ^ temp.hashCode;
}
