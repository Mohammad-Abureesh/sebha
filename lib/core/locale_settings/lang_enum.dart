enum ELanguages { arabic, english, system }

extension LanguagesEx on ELanguages {
  static final Map<ELanguages, String> _data = {
    ELanguages.arabic: 'ar',
    ELanguages.english: 'en',
    ELanguages.system: 'sys'
  };

  String get code => _data[this]!;
}
