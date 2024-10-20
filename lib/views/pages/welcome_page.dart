import 'package:flutter/material.dart';
import 'create_account_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>const  CreateAccountPage()),
          );
        },
        child: Stack(
          children: [
            // Background Image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welcome_img.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Overlay with text
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            // Text Content
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 35,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Velia',
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 60,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'The best hotel booking in this century, to accompany your vacation',
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 20,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
