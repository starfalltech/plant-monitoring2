import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_client/data/data_sources/home_remote_datasources.dart';
import 'package:plant_client/data/repositories/home_repository_impl.dart';
import 'package:plant_client/domain/repositories/home_repository.dart';
import 'package:plant_client/presentation/pages/pages.dart';

import 'bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: false);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HomeRemoteDataSources>(
          create: (context) => HomeRemoteDataSourcesImpl(),
        ),
        RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepositoryImpl(
            RepositoryProvider.of<HomeRemoteDataSources>(context),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Plant Monitoring',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff44F1A6)),
          useMaterial3: true,
        ),
        home: const SplashPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
