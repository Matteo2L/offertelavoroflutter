import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter/misc/colors.dart';
import 'package:offertelavoroflutter/pages/main_page.dart';
import 'package:offertelavoroflutter/repositories/jobs_repository.dart';
import 'package:offertelavoroflutter/repositories/mappers/job_mapper.dart';
import 'package:offertelavoroflutter/services/network/jobs_service.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<JobMapper>(
            create: (_) => JobMapper(),
          )
        ],
        child: MultiProvider(
          providers: [
            Provider<JobsService>(
              create: (_) => JobsService(),
            ),
          ],
          child: MultiRepositoryProvider(
            providers: [
              RepositoryProvider<JobsRepository>(
                create: (context) => JobsRepository(
                  jobsService: context.read<JobsService>(),
                  jobMapper: context.read<JobMapper>(),
                ),
              )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Jobs',
              theme: ThemeData(
                primarySwatch: MaterialColor(0xFF027DFD, color),
                scaffoldBackgroundColor: Colors.grey.shade300,
                appBarTheme: const AppBarTheme(
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.indigo,
                  elevation: 5,
                ),
                tabBarTheme: const TabBarTheme(
                  unselectedLabelColor: Color(0x88FFFFFF),
                  labelColor: Colors.white,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                cardTheme: CardTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 1,
                ),
              ),
              home: const MainPage(),
            ),
          ),
        ),
      );
}
