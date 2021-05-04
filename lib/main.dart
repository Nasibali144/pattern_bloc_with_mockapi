import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc_with_mockapi/blocs/list_contact_cubit.dart';
import 'package:pattern_bloc_with_mockapi/pages/home_page.dart';

import 'blocs/create_contact_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Pattern',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black),
        )
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ListContactCubit()),
        ],
        child: HomePage(),
      ),
    );
  }
}