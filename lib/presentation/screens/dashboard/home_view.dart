import 'package:demo_app/core/constants/style.dart';
import 'package:demo_app/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/fonts.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeBloc, HomeState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // A light grey background to match the image
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 150, // Adjust as needed
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 6, bottom: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Style.lightGrayColor
            ),
            child: Row(
              children: [
                CircleAvatar(
                  // Replace with your avatar image
                   // backgroundImage: NetworkImage('https://www.istockphoto.com/photo/eye-of-model-with-colorful-art-make-up-close-up-gm814423752-131755775'), // Placeholder image
                  radius: 20,
                  // Replace with your avatar image
                   // backgroundImage: NetworkImage('https://www.istockphoto.com/photo/eye-of-model-with-colorful-art-make-up-close-up-gm814423752-131755775'), // Placeholder image
                  child:  Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 8),
                Text(
                  state.authUser?.displayName ?? '',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                    fontFamily: Fonts.sfUI,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              // Handle notification icon press
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Explore the Beautiful world! Section
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.2,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Explore the\n'),
                    TextSpan(text: 'Beautiful '),
                    TextSpan(
                      text: 'world!',
                      style: TextStyle(
                        color: Colors.orange[700], // Adjust color to match the image
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.orange[700],
                        decorationThickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Best Destination Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Destination',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle View all press
                    },
                    child: Text(
                      'View all',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // Horizontal Scrollable Cards
              SizedBox(
                height: 300, // Adjust height as needed for the cards
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // DestinationCard(
                    //   imagePath: 'https://www.istockphoto.com/photo/eye-of-model-with-colorful-art-make-up-close-up-gm814423752-131755775', // Placeholder
                    //   title: 'Niladri Reservoir',
                    //   location: 'Tekergat, Sunamgnj',
                    //   rating: 4.7,
                    //   friendsCount: 50,
                    // ),
                    // const SizedBox(width: 20),
                    // DestinationCard(
                    //   imagePath: 'https://via.placeholder.com/300x400/add8e6/000000?text=Darma', // Placeholder
                    //   title: 'Darma',
                    //   location: 'Darn', // Inferred from the image
                    //   rating: 4.5, // Example
                    //   friendsCount: 30, // Example
                    // ),
                    // Add more DestinationCard widgets here if needed
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // You can add more sections here based on your design
            ],
          ),
        ),
      ),
    );
  },
);
  }
}

// 2. DestinationCard Widget
class DestinationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final double rating;
  final int friendsCount;

  const DestinationCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.location,
    required this.rating,
    required this.friendsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220, // Adjust card width as needed
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              imagePath,
              height: 180, // Adjust image height
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          '$rating',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    // Placeholder for friend avatars - you'd likely use a Stack or Row of CircleAvatars
                    CircleAvatar(radius: 10, backgroundColor: Colors.blue[100]),
                    const SizedBox(width: 4),
                    CircleAvatar(radius: 10, backgroundColor: Colors.green[100]),
                    const SizedBox(width: 4),
                    CircleAvatar(radius: 10, backgroundColor: Colors.red[100]),
                    const SizedBox(width: 4),
                    Text(
                      '+$friendsCount',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}