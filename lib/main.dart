import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/database/database.dart';
import 'di/init.dart';
import 'src/presentation/bloc/home_bloc.dart';
import 'src/presentation/root_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.init();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => getIt(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Quicksand',
          primaryColor: Colors.black,
          brightness: Brightness.dark,
          canvasColor: Colors.transparent,
          primaryColorBrightness: Brightness.dark,
          accentColorBrightness: Brightness.dark,
        ),
        home: RootController(),
      ),
    );
  }
}
