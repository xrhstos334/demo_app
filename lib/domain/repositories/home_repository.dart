import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:grpc/grpc.dart';
import '../../core/utils/logger.dart';
import '../../data/data_models /weather_model.dart';
import '../../src/generated/location.pb.dart' as location_pb;
import '../../src/generated/service.pbgrpc.dart';
import '../../src/generated/weather.pb.dart';

class HomeRepository {
  static Future<WeatherModel> getWeather() async {
    final channel = ClientChannel(
      "10.0.2.2",
      port: 5001,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    final stub = WeatherServiceClient(channel);

    try {
      final response = await stub.current(
        RequestCurrent(
          locationType: location_pb.LocationType.LOCATION_TYPE_CITY,
          units: Units.UNITS_METRIC,
          location: location_pb.OneOfLocation()..city = "Thessaloniki",
        ),
      );
      final body = jsonDecode(response.payload);
      Log.i('Response received: ${response.payload.toString()}');
      await channel.shutdown();
      return WeatherModel.fromJson(body);


    } catch (e) {
      Log.i(e.toString());
      await channel.shutdown();
      return WeatherModel.empty();
    }
  }

 static  Future<List<Map<String , dynamic>>> fetchImages() async {
    try {
      final firebaseStorage = FirebaseStorage.instance;

      final folder = 'places/';
      final result = await firebaseStorage.ref(folder).listAll();
      final urls = await Future.wait(
        result.items.map((ref) => ref.getDownloadURL()),
      );

      List<Map<String, dynamic>> placesImageData = [];
      for (int i = 0; i < result.items.length; i++) {
        final ref = result.items[i];
        final url = urls[i];
        placesImageData.add({
          'name': ref.name,
          'url': url,
        });
        Log.i('📁 File name: ${ref.name}');
        Log.i('🔗 Download URL: $url');
        Log.i('-------------------------------');
      }
      Log.i("Fetched URLs: $urls");

      return placesImageData;
    } catch (e) {
      return [];
    }
  }

  static Future<List<String>>  getAvatars() async {
    try {
      final firebaseStorage = FirebaseStorage.instance;

      final folder = 'avatars/';
      final result = await firebaseStorage.ref(folder).listAll();
      final urls = await Future.wait(
        result.items.map((ref) => ref.getDownloadURL()),
      );

      List<String> avatarsData = [];
      for (int i = 0; i < result.items.length; i++) {
        final url = urls[i];
        avatarsData.add(url);
      }


      return avatarsData;
    } catch (e) {
      return [];
    }
  }
}


