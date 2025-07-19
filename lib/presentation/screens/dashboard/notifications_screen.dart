import 'dart:math';

import 'package:demo_app/core/constants/fonts.dart';
import 'package:demo_app/presentation/widgets/common_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/style.dart';
import '../../blocs/notifications_bloc/notifications_bloc.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'avatar': 'https://placehold.co/50x50/ADD8E6/000000?text=P1',
      // Placeholder image
      'title': 'Super Offer',
      'subtitle': 'Get 60% off in our first booking',
      'time': 'Sun,12:40pm',
    },
    {
      'avatar': 'https://placehold.co/50x50/F08080/000000?text=P2',
      'title': 'Super Offer',
      'subtitle': 'Get 60% off in our first booking',
      'time': 'Mon,11:50pm',
    },
    {
      'avatar': 'https://placehold.co/50x50/90EE90/000000?text=P3',
      'title': 'Super Offer',
      'subtitle': 'Get 60% off in our first booking',
      'time': 'Tue,10:56pm',
    },
    {
      'avatar': 'https://placehold.co/50x50/FFDAB9/000000?text=P4',
      'title': 'Super Offer',
      'subtitle': 'Get 60% off in our first booking',
      'time': 'Wed,12:40pm',
    },
    {
      'avatar': 'https://placehold.co/50x50/DDA0DD/000000?text=P5',
      'title': 'Super Offer',
      'subtitle': 'Get 60% off in our first booking',
      'time': 'Fri,11:50pm',
    },
    {
      'avatar': 'https://placehold.co/50x50/FFDEAD/000000?text=P6',
      'title': 'Super Offer',
      'subtitle': 'Get 60% off in our first booking',
      'time': 'Sat,10:56pm',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationsBloc, NotificationsState>(
      listener: (context, state) async {
        for (final url in state.avatarUrls) {
          await precacheImage(NetworkImage(url), context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonBackButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 10),
                      Text('Notifications',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 20,
                                    fontFamily: Fonts.sfUI,
                                    fontWeight: FontWeight.bold,
                                  )),
                      TextButton(
                        onPressed: () => context.read<NotificationsBloc>().add(
                              NotificationsEvent.clearAll(),
                            ),
                        child: Text(
                          'Clear all',
                          style: TextStyle(
                              color: Colors.orange[700], fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTabButton(0, 'Recent', state, context),
                      _buildTabButton(1, 'Earlier', state, context),
                      _buildTabButton(2, 'Archived', state, context),
                    ],
                  ),
                ),
                _buildList(context, state),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildList(BuildContext context, NotificationsState state) {
    if (context
            .read<NotificationsBloc>()
            .getNotifications(state.selectedIndex) !=
        null) {
      if (context
          .read<NotificationsBloc>()
          .getNotifications(state.selectedIndex)!
          .isEmpty) {
        return Expanded(
          child: Center(
            child: Text(
              'No notifications',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    fontFamily: Fonts.sfUI,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        );
      } else {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: context
                  .read<NotificationsBloc>()
                  .getNotifications(state.selectedIndex)!
                  .map((notification) {
                return _buildNotificationItem(
                    state.avatarUrls[Random().nextInt(state.avatarUrls.length)],
                    notification.title ?? "",
                    notification.body ?? "",
                    DateFormat('EEE dd, MMM HH:mm').format(
                      DateTime.parse(notification.date!),
                    ),
                    context);
              }).toList(),
            ),
          ),
        );
      }
    } else {
      return const SizedBox();
    }
  }

  Widget _buildTabButton(
      int index, String text, NotificationsState state, BuildContext context) {
    final bool isSelected = state.selectedIndex == index;
    return GestureDetector(
      onTap: () {
        context.read<NotificationsBloc>().add(
              NotificationsEvent.selectCategory(index),
            );
      },
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontFamily: Fonts.sfUI,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? Colors.orange[700] : Style.lightTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(String avatarUrl, String title, String subtitle,
      String time, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      // No shadow
      color: Colors.white.withValues(alpha: 0.97),
      // _selectedTabIndex == 0 && notifications.indexOf(
      //     notifications.firstWhere((element) =>
      //     element['avatar'] ==
      //         avatarUrl)) == 0
      //     ? Colors.blue.withValues(
      //     alpha: 0.1) // Light blue for the first item in "Recent"
      //     : Colors.white.withValues(alpha: 0.97),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage:
                  NetworkImage(avatarUrl), // Use NetworkImage for URL
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                          fontFamily: Fonts.sfUI,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          fontFamily: Fonts.sfUI,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            Text(
              time,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 11,
                    fontFamily: Fonts.sfUI,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
