import 'package:buysellgo/Core/Constants/my_colors.dart';
import 'package:buysellgo/Models/post.dart';
import 'package:buysellgo/Provider/Auth%20provider/signin_provider.dart';
import 'package:buysellgo/Provider/Auth%20provider/signup_provider.dart';
import 'package:buysellgo/Provider/posts%20provider/post_provider.dart';
import 'package:buysellgo/Provider/shared_pref_provider/signin_response_provider.dart';
import 'package:buysellgo/Widgets/Authentication/signin.dart';
import 'package:buysellgo/Widgets/Authentication/signup.dart';
import 'package:buysellgo/Widgets/Home/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Provider/shared_pref_provider/sign_up_pref.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: ColorsConstants.primaryColor,
  ));
  runApp(const MyApp());

  // SignUpResponseProvider signUpResponseProvider = SignUpResponseProvider();
  // final s = await signUpResponseProvider.retrieveSignUpResponse();
  // print(s!.user.email);

  // SignInResponseProvider signInResponseProvider = SignInResponseProvider();
  // final s1 = await signInResponseProvider.retrieveSignInResponse();
  // // print(s1!.token);
  // // print(s1.user.id);
  // PostProvider postProvider = PostProvider();
  // final posts = await postProvider.fetchPostList();
  // await postProvider.addPost(Post(
  //   description: "Hehehe",
  //   contactInfo: "test",
  //   postType: true,
  //   state: true,
  //   likes: 0,
  // ));
  // print(postProvider.postList);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
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
          home: const MainAppView()),
    );
  }
}
