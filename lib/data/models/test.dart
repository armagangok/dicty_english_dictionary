class WordModel {
    WordModel({
        required this.word,
        required this.phonetics,
        required this.meanings,
        required this.license,
        required this.sourceUrls,
    });

    String word;
    List<Phonetic> phonetics;
    List<Meaning> meanings;
    License license;
    List<String> sourceUrls;
}

class License {
    License({
        required this.name,
        required this.url,
    });

    String name;
    String url;
}

class Meaning {
    Meaning({
        required this.partOfSpeech,
        required this.definitions,
        required this.synonyms,
        required this.antonyms,
    });

    String partOfSpeech;
    List<Definition> definitions;
    List<String> synonyms;
    List<String> antonyms;
}

class Definition {
    Definition({
        required this.definition,
        required this.synonyms,
        required this.antonyms,
        this.example,
    });

    String definition;
    List<dynamic> synonyms;
    List<dynamic> antonyms;
    String? example;
}

class Phonetic {
    Phonetic({
        required this.audio,
        this.sourceUrl,
        this.license,
        this.text,
    });

    String audio;
    String? sourceUrl;
    License? license;
    String? text;
}
