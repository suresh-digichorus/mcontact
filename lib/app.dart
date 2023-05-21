import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcontact/bloc/contact/contact_bloc.dart';
import 'package:mcontact/core/services/contact/contact_service.dart';
import 'package:mcontact/layout/base_layout.dart';
import 'package:mcontact/routes/routes.dart';
import 'package:mcontact/screens/05_profile/profile_add_or_update_screen.dart';
import 'package:mcontact/themes/themes.dart';
import 'package:page_transition/page_transition.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ContactBloc(
            contactService: ContactService(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'M contect',
        theme: Themes.themeData(context),
        routes: Routes.buildRoutes,
        initialRoute: Routes.initialRoute,
        onUnknownRoute:
            Routes.unknownRoute as Route<dynamic>? Function(RouteSettings),
      ),
    );
  }
}
