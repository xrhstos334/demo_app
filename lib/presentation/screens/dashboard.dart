import 'package:demo_app/presentation/blocs/dashboard_bloc/dashboard_bloc.dart';
import 'package:demo_app/presentation/screens/dashboard/calendart_view.dart';
import 'package:demo_app/presentation/screens/dashboard/home_view.dart';
import 'package:demo_app/presentation/screens/dashboard/messages.dart';
import 'package:demo_app/presentation/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/keys/asset_keys.dart';
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
                      GestureDetector(
                        onTap: (){

                        },
                        child: CircleAvatar(
                          radius: 28,
                          child:
                              Icon(Icons.search, color: Colors.white, size: 30),
                        ),
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
