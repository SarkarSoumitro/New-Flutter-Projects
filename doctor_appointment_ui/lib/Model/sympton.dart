class Symptoms {
  final String image;
  final String label;

  Symptoms({
    required this.image,
    required this.label,
  });
}

List<Symptoms> symptoms = [
  Symptoms(
    image: 'images/temperature.png',
    label: 'Temperature',
  ),
  Symptoms(
    image: 'images/snuffle.png',
    label: 'Snuffle',
  ),
  Symptoms(
    image: 'images/headache.png',
    label: 'Headache',
  ),
  Symptoms(
    image: 'images/dizzy.png',
    label: 'Dizzy',
  ),
];
