import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/models/job.dart';

class JobWidget extends StatelessWidget {
  final Job job;
  const JobWidget(this.job, {super.key});

  @override
  Widget build(BuildContext context) => Card(
        child: Text(job.name),
      );
}
