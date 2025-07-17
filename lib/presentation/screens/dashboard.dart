import 'package:demo_app/presentation/blocs/dashboard_bloc/dashboard_bloc.dart';
import 'package:demo_app/presentation/screens/dashboard/calendart_view.dart';
import 'package:demo_app/presentation/screens/dashboard/home_view.dart';
import 'package:demo_app/presentation/screens/dashboard/messages.dart';
import 'package:demo_app/presentation/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:grpc/grpc.dart';

import '../../core/constants/style.dart';
import '../../core/utils/keys/asset_keys.dart';
import '../../routes/routes.dart';
import '../../src/generated/service.pbgrpc.dart';
import '../../src/generated/weather.pb.dart';

import '../../src/generated/location.pb.dart' as location_pb;
import '../widgets/bottom_bar_button.dart';
import '../widgets/nav_painter.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: SafeArea(
                child: bottomNavigationWidgets(
                    state.currentPage)[state.currentPage]),
            bottomNavigationBar: CustomPaint(
              size: Size(double.infinity, 100),
              painter: NavBarPainter(),
              child: SizedBox(
                height: 130,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BottomBarButton(
                          title: "Home",
                          path: AssetKeys.home,
                          onTap: () => context
                              .read<DashboardBloc>()
                              .add(DashboardEvent.goToPage(0)),
                          isSelected: state.currentPage == 0),
                      BottomBarButton(
                        title: "Calendar",
                        onTap: () => context
                            .read<DashboardBloc>()
                            .add(DashboardEvent.goToPage(1)),
                        isSelected: state.currentPage == 1,
                        path: AssetKeys.calendar,
                      ),
                      CircleAvatar(
                        radius: 28,
                        child:
                            Icon(Icons.search, color: Colors.white, size: 30),
                      ),
                      BottomBarButton(
                        title: "Messages",
                        onTap: () => context
                            .read<DashboardBloc>()
                            .add(DashboardEvent.goToPage(2)),
                        isSelected: state.currentPage == 2,
                        path: AssetKeys.messages,
                      ),
                      BottomBarButton(
                        title: "Profile",
                        onTap: () => context
                            .read<DashboardBloc>()
                            .add(DashboardEvent.goToPage(3)),
                        isSelected: state.currentPage == 3,
                        path: AssetKeys.person,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> bottomNavigationWidgets(int number) {
    return [HomeView(), CalendarView(), MessagesView(), ProfileView()];
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _weatherResponse = 'No data yet';

  Future<void> _getWeather() async {
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
          location: location_pb.OneOfLocation()..city = "Corvallis",
        ),
      );
      setState(() {
        print('Response received: ${response.payload.toString()}');
        _weatherResponse = response.payload.toString();
      });
    } catch (e) {
      setState(() {
        print(e.toString());
        _weatherResponse = 'Error: $e';
      });
    }
    await channel.shutdown();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Weather gRPC Client')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_weatherResponse, style: const TextStyle(fontSize: 24)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await _getWeather();
                },
                child: const Text('Get Weather'),
              ),
              Center(
                child: TextButton(
                  onPressed: () async {
                    try {
                      await FacebookAuth.instance.logOut();
                      await FirebaseAuth.instance.signOut();

                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.loginScreen, (route) => false);
                    } catch (e) {
                      print('❌ Logout failed: $e');
                    }
                  },
                  child: Text(
                    'logout',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
