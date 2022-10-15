import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'Controller/Provider/profile_image_provider.dart';
import 'Controller/Provider/user_provider.dart';
import 'Model/model.dart';
import 'Views/Splash/splash_screen.dart';
import 'Views/User details/user_details_screen.dart';
import 'Views/studentListScreem/stundentListScreen.dart';

late Box<DataBase> userData;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DataBaseAdapter());
  await Hive.openBox<DataBase>('user');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileImageProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue, primaryTextTheme: const TextTheme()),
        home: splashScreen(),
        routes: {
          StudentListScreen.routeName: (context) => StudentListScreen(),
          StudentDetailsScreen.routeName: (context) => StudentDetailsScreen()
        },
      ),
    );
  }
}
