import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class JobDTO extends Equatable {
  final PropertiesDTO properties;

  const JobDTO({
    required this.properties,
  });

  factory JobDTO.fromJson(Map<String, dynamic> data) => JobDTO(
        properties: PropertiesDTO.fromJson(data['properties']),
      );

  @override
  List<Object?> get props => [properties];
}

class PropertiesDTO extends Equatable {
  final JobPostedDTO jobPosted;
  final TeamDTO team;
  final String? contratto;
  final String? seniority;
  final int? ral;
  final String name;
  final String? qualifica;
  final String? retribuzione;
  final DescrizioneOffertaDTO descrizioneOfferta;
  final String comeCandidarsi;
  final String? localita;
  final String nomeAzienda;
  final String? statoPubblicazione;
  final String? urlSitoWeb;

  const PropertiesDTO({
    required this.jobPosted,
    required this.team,
    required this.contratto,
    required this.seniority,
    required this.ral,
    required this.name,
    required this.qualifica,
    required this.retribuzione,
    required this.descrizioneOfferta,
    required this.comeCandidarsi,
    required this.localita,
    required this.nomeAzienda,
    required this.statoPubblicazione,
    required this.urlSitoWeb,
  });

  factory PropertiesDTO.fromJson(Map<String, dynamic> data) => PropertiesDTO(
        jobPosted: JobPostedDTO.fromJson(data['Job Posted']),
        team: TeamDTO.fromJson(data['Team']),
        contratto: data['Contratto']['select']['name'],
        seniority: data['Seniority']['select']['name'],
        ral: data['RAL']['select'],
        name: data['Name']['title']['text']['content'],
        qualifica: data['Qualifica']['rich_text']['text']['content'],
        retribuzione: data['Retribuzione']['rich_text']['text']['content'],
        descrizioneOfferta:
            DescrizioneOffertaDTO.fromJson(data['Descrizione offerta']),
        comeCandidarsi: data['Come candidarsi']['rich_text']['text']['content'],
        localita: data['Località']['rich_text']['text']['content'],
        nomeAzienda: data['Nome azienda']['rich_text']['text']['content'],
        statoPubblicazione: data['Stato di pubblicazione']['rich_text']['text']
            ['content'],
        urlSitoWeb: data['URL sito web']['url'],
      );

  @override
  List<Object?> get props => [
        jobPosted,
        team,
        contratto,
        seniority,
        ral,
        name,
        qualifica,
        retribuzione,
        descrizioneOfferta,
        comeCandidarsi,
        localita,
        nomeAzienda,
        statoPubblicazione,
        urlSitoWeb,
      ];
}

class JobPostedDTO extends Equatable {
  final DateTime createdTime;

  const JobPostedDTO({required this.createdTime});

  factory JobPostedDTO.fromJson(Map<String, dynamic> data) => JobPostedDTO(
        createdTime:
            DateFormat('yyyy-MM-ddTHH:mm:ss.000Z').parse(data['created_time']),
      );

  @override
  List<Object?> get props => [createdTime];
}

class TeamDTO extends Equatable {
  final String? jobPosition;

  const TeamDTO({required this.jobPosition});

  factory TeamDTO.fromJson(Map<String, dynamic> data) =>
      TeamDTO(jobPosition: data['select']['name']);

  @override
  List<Object?> get props => [jobPosition];
}

class DescrizioneOffertaDTO extends Equatable {
  final List<String> text;

  const DescrizioneOffertaDTO({required this.text});

  factory DescrizioneOffertaDTO.fromJson(Map<String, dynamic> data) =>
      DescrizioneOffertaDTO(
          text: (data['rich_text']).map(data['text']['content'] as List));

  @override
  List<Object?> get props => [text];
}
