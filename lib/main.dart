
import 'package:event/modules/screens/main_layout/manger/layout_provider.dart';
import 'package:event/modules/screens/main_layout/screens/create_event/selected_location_provider.dart';
import 'package:event/modules/screens/main_layout/screens/map_tab/map_provider.dart';
import 'package:event/providers/config_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'event.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ConfigProvider()),
      ChangeNotifierProvider(create: (context) => LayoutProvider()),
      ChangeNotifierProvider(create: (context) => MapProvider(),),
      ChangeNotifierProvider(create: (context) => SelectedLocationProvider(),),
    ],
      child: Event()));
}
