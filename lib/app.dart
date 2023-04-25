import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/pages/main_page.dart';
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
          child: MaterialApp(
            title: 'title',
            theme: ThemeData(),
            home: const MainPage(),
          ),
        ),
      );
}
