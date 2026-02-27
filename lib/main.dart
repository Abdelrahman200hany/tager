import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tager/core/helpers/generate_routes.dart';
import 'package:tager/core/servies/create_bloc_observer.dart';
import 'package:tager/core/servies/create_singleton_servies_locator.dart';
import 'package:tager/core/servies/shared_preferense_singleton.dart';
import 'package:tager/core/uitls/app_color.dart';
import 'package:tager/feature/Splash_feature/data/presention/views/splash_view.dart';
import 'package:tager/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // لازم أول حاجة
  Bloc.observer = SimpleBlocObserver();
  await Prefs.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServiceLocator();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const Tager(), // Wrap your app
    ),
  );
}

class Tager extends StatelessWidget {
  const Tager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('ar'),
      debugShowCheckedModeBanner: false,

      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: AppColor.kPrimaryColor),
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
