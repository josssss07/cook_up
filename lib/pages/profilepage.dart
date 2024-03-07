import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cook_up/utils/AppColor.dart';
import 'package:cook_up/widgets/user_info_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //brightness: Brightness.dark,
        backgroundColor: AppColor.primarySoft,
        elevation: 0,
        centerTitle: true,
        title: const Text('My Profile', style: TextStyle(fontFamily: 'inter', fontWeight: FontWeight.w400, fontSize: 16)),
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
              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
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
            color: AppColor.primary,
            padding: const EdgeInsets.symmetric(vertical: 24),
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
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(100),
                      // Profile Picture
                      image: const DecorationImage(image: AssetImage('assets/images/profile.jpg'), fit: BoxFit.cover),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Change Profile Picture', style: TextStyle(fontFamily: 'inter', fontWeight: FontWeight.w600, color: Colors.white)),
                      const SizedBox(width: 8),
                      SvgPicture.asset('assets/icons/camera.svg', color: Colors.white),
                    ],
                  )
                ],
              ),
            ),
          ),
          // Section 2 - User Info Wrapper
          Container(
            margin: const EdgeInsets.only(top: 24),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserInfoTile(
                  margin: const EdgeInsets.only(bottom: 16),
                  label: 'Email',
                  value: 'reinazahradummy@gmail.com', 
                  padding:  const EdgeInsets.all(16.0), 
                  valueBackground: AppColor.secondaryBackground, 
                  
                ),
                UserInfoTile(
                  margin: const EdgeInsets.only(bottom: 16),
                  label: 'Full Name',
                  value: 'Reina Zahra Azizah',
                  padding:  const EdgeInsets.all(16.0), 
                  valueBackground: AppColor.secondaryBackground, 
                ),
                UserInfoTile(
                  margin: const EdgeInsets.only(bottom: 16),
                  label: 'Subscription Type',
                  value: 'Premium Subscription',
                  padding:  const EdgeInsets.all(16.0), 
                  valueBackground: AppColor.secondaryBackground, 
                ),
                UserInfoTile(
                  margin: const EdgeInsets.only(bottom: 16),
                  label: 'Subscription Time',
                  value: 'Until 22 Oct 2021',
                  padding:  const EdgeInsets.all(16.0), 
                  valueBackground: AppColor.secondaryBackground, 
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
