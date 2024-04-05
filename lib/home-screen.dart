import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            appBarSection(),
            storiesSection(),
            const Divider(color: Colors.grey, height: 0.1, thickness: 0.2),
            postSection()
          ],
        ),
      ),
    );
  }

  appBarSection() {
    return Container(
      // height: 200,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          top: MediaQuery.of(context).size.height * 0.02),
      child: Row(
        children: [
          const Text(
            'Instagram',
            style: TextStyle(
                fontFamily: 'Mourning',
                fontSize: 27,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.white),
          ),
          Container(
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.4),
            child: Row(
              children: [
                const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                SvgPicture.asset(
                  'assets/messenger-icon.svg',
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  storiesSection() {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemExtent: 80,
          itemCount: 5,
          itemBuilder: (context, index) {
            return index == 0 ? myStoryBubble() : storyBubble();
          }),
    );
  }

  myStoryBubble() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.01),
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                image: DecorationImage(
                  opacity: 1,
                  image: AssetImage('assets/man-person-icon.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: 20,
              width: 20,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                  left: MediaQuery.of(context).size.width * 0.1),
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.001,
                  left: MediaQuery.of(context).size.width * 0.001),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
        const Text('Your story', style: TextStyle(color: Colors.grey))
      ],
    );
  }

  storyBubble() {
    return Column(
      children: [
        SizedBox(
          // height: 50,
          // width: 50,
          child: Stack(
            children: [
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.01),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color.fromRGBO(105, 8, 97, 1), width: 2),
                  image: const DecorationImage(
                    opacity: 1,
                    image: AssetImage('assets/man-person-icon.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Text('username', style: TextStyle(color: Colors.grey))
      ],
    );
  }

  postSection() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.78,
      width: MediaQuery.of(context).size.width,
      // decoration: const BoxDecoration(color: Colors.orange),
      child: Column(
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(
                    // top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.width * 0.02),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    image: DecorationImage(
                        image: AssetImage('assets/profile-img.png'))),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              Container(
                // decoration: const BoxDecoration(color: Colors.green),
                width: MediaQuery.of(context).size.height * 0.1,
                height: 50,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: const Text('Username',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.55),
              SvgPicture.asset('assets/menu-icon.svg',
                  width: 20, height: 20, color: Colors.white),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05)
            ],
          ),
          // Body
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                        image: AssetImage('assets/profile-img.png'))),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          // Footer
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              const Icon(Icons.favorite_border, color: Colors.white),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              SvgPicture.asset('assets/comment-ions.svg',
                  fit: BoxFit.fill, width: 20, height: 20, color: Colors.white),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              SvgPicture.asset('assets/share-icon.svg',
                  width: 20, height: 20, color: Colors.white),
              SizedBox(width: MediaQuery.of(context).size.width * 0.7),
              SvgPicture.asset('assets/save-icon.svg',
                  width: 20, height: 20, color: Colors.white),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          // Likes
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              const Text('17 likes',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 15)),
            ],
          ),
          // SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          // Caption
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              const Text('username',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 15)),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              const Text('Catturando momenti senza tempo ✨',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 15)),
            ],
          ),
          // Hash
          const Row(
            children: [
              Text(' #VitaVibrante  #VitaVibrante  #VitaVibrante',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(155, 183, 210, 1),
                      fontSize: 15)),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.001),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              const Text('View all 2 comments',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 15)),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.height * 0.05,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/man-person-icon.png'))),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    left: MediaQuery.of(context).size.width * 0.02),
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color:const Color.fromRGBO(12, 15, 20, 1),
                    borderRadius: BorderRadius.circular(25)),
                child: const Text('Add a comment...',
                    style: TextStyle(
                      color: Colors.grey,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
