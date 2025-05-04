import 'package:city_guide_ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'package:city_guide_ui/screens/activity_details_screen.dart';
import 'services/auth_service.dart';
import 'firebase_options.dart';
import 'package:city_guide_ui/screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        title: 'City Guide',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color(0xFF3EBACE),
            secondary: Color(0xFFD8ECF1),
          ),
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
        ),
        home: Consumer<AuthService>(
  builder: (context, authService, _) {
    if (authService.isSignedIn) {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  },
),
  routes: {
         '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
         '/home': (context) => HomeScreen(),
        '/activity_details': (context) => ActivityDetailsScreen(),
        // '/review': (context) => ReviewScreen(),
        // '/profile': (context) => ProfileScreen(),
        // '/admin_dashboard': (context) => AdminDashboardScreen(),
      },
      ),
    );
  }
}
