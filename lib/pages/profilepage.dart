// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:cook_up/utils/AppColor.dart';
import 'package:cook_up/widgets/user_info_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: const Text('My Profile',
            style: TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
            child: const Text(
              'Edit',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Profile Picture Wrapper
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            margin: const EdgeInsets.all(12), // Adjust margin as needed
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.zero, // Radius for top left corner
                topRight: Radius.zero, // Radius for top right corner
                bottomLeft:
                    Radius.circular(16), // No radius for bottom left corner
                bottomRight:
                    Radius.circular(16), // No radius for bottom right corner
              ), // Border radius for the main container
              color: Colors.white,
            ),
            child: GestureDetector(
              onTap: () {
                print('Code to open file manager');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color.fromARGB(255, 249, 246, 238),
                      // Profile Picture
                      image: const DecorationImage(
                        image: AssetImage('assets/images/user_profile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Text(
                    'Change Profile Picture',
                    style: TextStyle(
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),

          // Section 2 - User Info Wrapper
          Container(
            color: Color.fromARGB(255, 249, 246, 238),
            // margin: EdgeInsets.only(top: 24),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Email',
                  value: 'Testemail@email.com',
                  padding: EdgeInsets.all(16.0),
                  valueBackground: Colors.amber,
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Full Name',
                  value: 'demo page',
                  padding: EdgeInsets.all(16.0),
                  valueBackground: Colors.amber,
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Subscription Type',
                  value: 'Premium Subscription',
                  padding: EdgeInsets.all(16.0),
                  valueBackground: Colors.amber,
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Subscription Time',
                  value: 'Until 22 Oct 2021',
                  padding: EdgeInsets.all(16.0),
                  valueBackground: Colors.amber,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
