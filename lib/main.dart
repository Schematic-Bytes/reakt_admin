import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

// import 'package:provider/provider.dart';
// import 'package:reality/database/database.dart';
// import 'package:reality/routes/authentication/router.dart';
// import 'package:reality/routes/authentication/service.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.loggerName}: ${record.message}');
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        Provider<DatabaseService>(
          create: (_) => DatabaseService(FirebaseFirestore.instance),
        )
      ],
      child: MaterialApp(
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          physics: const BouncingScrollPhysics(),
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        theme: ThemeData.dark().copyWith(
          primaryColor: const Color(0xffbb86fc),
          colorScheme: const ColorScheme.dark().copyWith(
            primary: const Color(0xffbb86fc),
            secondary: const Color.fromARGB(175, 3, 218, 197),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(22, 27, 34, 1.0),
          ),
          snackBarTheme: SnackBarThemeData(
            backgroundColor: const Color.fromARGB(255, 29, 35, 43),
            actionTextColor: Colors.indigo.shade400,
            contentTextStyle: TextStyle(
              color: Colors.indigo.shade400,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          scaffoldBackgroundColor: const Color.fromRGBO(13, 17, 23, 1.0),
          bottomAppBarTheme: const BottomAppBarTheme(
            color: Color.fromRGBO(22, 27, 34, 0.8),
          ),
          popupMenuTheme: const PopupMenuThemeData(
            color: Color.fromARGB(255, 37, 45, 58),
          ),
          dialogTheme: const DialogTheme(
            backgroundColor: Color.fromRGBO(22, 27, 34, 1.0),
          ),
        ),
        home: const AuthRouter(),
      ),
    );
  }
}
