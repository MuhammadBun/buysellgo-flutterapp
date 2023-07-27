import 'package:buysellgo/API/Base/api_base_response.dart';
import 'package:buysellgo/Core/Constants/my_colors.dart';
import 'package:buysellgo/Provider/Auth%20provider/signin_provider.dart';
import 'package:buysellgo/Provider/Auth%20provider/signup_provider.dart';
import 'package:buysellgo/Provider/shared_pref_provider/shared_pref_provider.dart';
import 'package:buysellgo/Widgets/Authentication/signup.dart';
import 'package:buysellgo/Widgets/Home/home.dart';
import 'package:buysellgo/Widgets/Home/main_screen.dart';

import 'package:buysellgo/Widgets/Profile/profile.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: ColorsConstants.primaryColor,
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.@override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorsConstants.primaryColor,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInResponseProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: SignUpScreen()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String error = '';
    return Scaffold(
      body: Center(
        child: Consumer<SignUpProvider>(
          builder: (context, value, child) {
            return ElevatedButton(
                onPressed: () async {},
                child: value.response.status == Status.loading
                    ? LoadingAnimationWidget.fourRotatingDots(
                        color: Colors.purple, size: 20)
                    : Text("Open"));
          },
        ),
      ),
    );
  }
}

class StoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text('This is a story'),
      ),
    );
  }
}
