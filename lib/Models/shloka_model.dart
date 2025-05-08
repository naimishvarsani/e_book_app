class Shloka {
  final String num;
  final String shloka;
  final String meaning;
  final String synonyms;
  final String purport;

  Shloka({
    required this.num,
    required this.shloka,
    required this.meaning,
    required this.synonyms,
    required this.purport,
  });

  factory Shloka.fromJson(Map<String, dynamic> json) {
    return Shloka(
      num: json['num'] ?? '',
      shloka: json['shloka'] ?? '',
      meaning: json['meaning'] ?? '',
      synonyms: json['Synonyms'] ?? '',
      purport: json['Purport'] ?? '',
    );
  }
}
