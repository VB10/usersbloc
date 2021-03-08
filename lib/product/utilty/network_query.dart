enum NetworkQuery { PAGE }

extension NetworkQueryExtension on NetworkQuery {
  MapEntry<String, int> pageQuery(int pageNumber) => MapEntry('page', pageNumber);
}
