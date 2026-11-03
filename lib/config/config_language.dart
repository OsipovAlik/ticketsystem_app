class LanguageConfig {
  final String name;
  final String image;
  final String value;
  final String valueId;
  bool visible;

  LanguageConfig({
    required this.name,
    required this.image,
    required this.value,
    required this.valueId,
    this.visible = false,
  });
}

List<LanguageConfig> languages = [
  LanguageConfig(
    name: 'English',
    image: 'lib/assets/images/en.png',
    value: 'en',
    valueId: '1',
  ),
  LanguageConfig(
      name: 'Русский',
      image: 'lib/assets/images/ru.png',
      value: 'ru',
      valueId: '2',
      visible: false),
  LanguageConfig(
      name: 'Հայերեն',
      image: 'lib/assets/images/hy.png',
      value: 'hy',
      valueId: '3',
      visible: false),
];
