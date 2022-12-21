class RecentController {
  RecentController._();
  static final instance = RecentController._();

  bool _isEditting = false;
  bool _isExtended = true;
  final List<bool> _choosenItemList = [];

  bool get isEditting => _isEditting;
  bool get isExtended => _isExtended;
  List<bool> get choosenItemList => _choosenItemList;

  void edit() => _isEditting = !_isEditting;
  void extend() => _isExtended = !_isExtended;
}
