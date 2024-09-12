/// Style options for HeroIcons. If an option is missing, please open an issue
/// or pull request into the HeroIcons Flutter repository.
enum BaseIconStyle {
  outline('outline'),
  solid('solid'),
  mini('mini'),
  micro('micro');

  const BaseIconStyle(this.name);

  final String name;
}