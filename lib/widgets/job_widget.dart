import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/models/job.dart';

class JobWidget extends StatelessWidget {
  final Job job;
  const JobWidget(this.job, {super.key});

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.all(4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(job.name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              JobContentWidget(job),
            ],
          ),
        ),
      );
}

class JobContentWidget extends StatelessWidget {
  final Job job;
  const JobContentWidget(this.job, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(job.nomeAzienda)],
    );
  }
}
