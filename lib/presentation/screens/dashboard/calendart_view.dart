import 'package:demo_app/core/constants/fonts.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/style.dart';
import '../../../core/utils/keys/asset_keys.dart';

class CalendarView extends StatelessWidget {
  // const CalendarView({super.key});
  final List<Map<String, String>> scheduleItems = [
    {
      'image': AssetKeys.onBoardingScreen1,
      // Replace with your asset path or network image
      'date': '26 January 2022',
      'title': 'Niladri Reservoir',
      'location': 'Tekergat, Sunamgnj',
    },
    {
      'image': AssetKeys.onBoardingScreen2,
      'date': '26 January 2022',
      'title': 'High Rech Park',
      'location': 'Zeero Point, Sylhet',
    },
    {
      'image': AssetKeys.onBoardingScreen3,
      'date': '26 January 2022',
      'title': 'Darma Reservoir',
      'location': 'Darma, Kuningan',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  // Handle back button press
                },
              ),
              Text(
                'Schedule',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20,
                      color: Style.lightTextColor,
                      fontFamily: Fonts.sfUI,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {
                  // Handle notification button press
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Date Selector (Calendar Part)
          _buildDateSelector(context),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Schedule',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20,
                      color: Style.lightTextColor,
                      fontFamily: Fonts.sfUI,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View all',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        color: Style.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          // List of Schedule Items
          ListView.builder(
            shrinkWrap: true,
            // Important to make ListView work inside Column/SingleChildScrollView
            physics: const NeverScrollableScrollPhysics(),
            // Disable ListView's own scrolling
            itemCount: scheduleItems.length,
            itemBuilder: (context, index) {
              final item = scheduleItems[index];
              return _buildScheduleItem(item['image']!, item['date']!,
                  item['title']!, item['location']!, context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '22 October',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20,
                      color: Style.lightTextColor,
                      fontFamily: Fonts.sfUI,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 16),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 16),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDayColumn('S', '18', false),
              _buildDayColumn('M', '19', false),
              _buildDayColumn('T', '20', false),
              _buildDayColumn('W', '21', false),
              _buildDayColumn('T', '22', true), // Highlighted day
              _buildDayColumn('F', '23', false),
              _buildDayColumn('S', '24', false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDayColumn(String day, String date, bool isSelected) {
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isSelected ? Colors.deepOrange : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            date,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScheduleItem(String imageUrl, String date, String title,
      String location, BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      // No shadow for the card itself
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl, // Use Image.asset if using local assets
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined,
                          size: 14, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(
                        date,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            color: Style.lightSubTextColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        color: Style.lightTextColor,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined,
                          size: 14, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(
                        location,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            color: Style.lightSubTextColor,
                            fontWeight: FontWeight.w400),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
