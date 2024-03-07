import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cook_up/utils/AppColor.dart';
import 'package:cook_up/widgets/user_info_tile.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //brightness: Brightness.dark,
        backgroundColor: AppColor.primarySoft,
        elevation: 2,
        centerTitle: true,
        title: const Text('My Profile', style: TextStyle(fontFamily: 'inter', fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
            child: const Text(
              'Edit',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
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
      margin: const EdgeInsets.all(10), // Adjust margin as needed
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.zero, // Radius for top left corner
          topRight: Radius.zero, // Radius for top right corner
          bottomLeft: Radius.circular(16), // No radius for bottom left corner
          bottomRight: Radius.circular(16), // No radius for bottom right corner
        ), // Border radius for the main container
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
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    ),

          // Section 2 - User Info Wrapper
          Container(
            color: AppColor.primarySoft,
            // margin: EdgeInsets.only(top: 24),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Email',
                  value: 'reinazahradummy@gmail.com', 
                  padding:  EdgeInsets.all(16.0), 
                  valueBackground: AppColor.secondarybg, 
                  
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Full Name',
                  value: 'Reina Zahra Azizah',
                  padding:  EdgeInsets.all(16.0), 
                  valueBackground: AppColor.secondarybg, 
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Subscription Type',
                  value: 'Premium Subscription',
                  padding:  EdgeInsets.all(16.0), 
                  valueBackground: AppColor.secondarybg, 
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Subscription Time',
                  value: 'Until 22 Oct 2021',
                  padding:  EdgeInsets.all(16.0), 
                  valueBackground: AppColor.secondarybg, 
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
