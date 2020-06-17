class PlanetData {
  String name;
  String data;
  String image;
  String mass;
  String radius;
  String orbitalPeriod;

  PlanetData(
      {this.data,
      this.name,
      this.image,
      this.mass,
      this.orbitalPeriod,
      this.radius});

  static List<PlanetData> planets;

  PlanetData.init() {
    planets = List();
    planets.add(PlanetData(
        name: 'Mercury',
        data:
            'Mercury is the smallest and innermost planet in the Solar System. It is named after the Roman deity Mercury, the messenger of the gods.',
        image: 'assets/planets/1mercury.png',
        mass: '3.285 × 10^23 kg',
        radius: '2,439.7 km',
        orbitalPeriod: '88 days'));
    planets.add(PlanetData(
        name: 'Venus',
        data:
            'Venus is the second planet from the Sun. It is named after the Roman goddess of love and beauty. As the second-brightest natural object in the night sky after the Moon.',
        image: 'assets/planets/2venus.png',
        orbitalPeriod: '225 days',
        radius: '6,051.8 km',
        mass: '4.867 × 10^24 kg'));
    planets.add(PlanetData(
        name: 'Earth',
        data:
            'Earth is the third planet from the Sun and the only astronomical object known to harbor life.',
        image: 'assets/planets/3earth.png',
        mass: '5.972 × 10^24 kg',
        radius: '6,371 km',
        orbitalPeriod: '365.25 days'));
    planets.add(PlanetData(
      name: 'Mars',
      data:
          'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being only larger than Mercury.',
      image: 'assets/planets/4mars.png',
      orbitalPeriod: '687 days',
      radius: '3,389.5 km',
      mass: '6.39 × 10^23 kg',
    ));
    planets.add(PlanetData(
      name: 'Jupiter',
      data:
          'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass one-thousandth that of the Sun.',
      image: 'assets/planets/5jupiter.png',
      mass: '1.898 × 10^27 kg',
      radius: '69,911 km',
      orbitalPeriod: '12 years',
    ));
    planets.add(PlanetData(
        name: 'Saturn',
        data:
            'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter.',
        image: 'assets/planets/6saturn.png',
        mass: '5.683 × 10^26 kg',
        radius: '58,232 km',
        orbitalPeriod: '29 years'));
    planets.add(PlanetData(
        name: 'Uranus',
        data:
            'Uranus is the seventh planet from the Sun. It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System.',
        image: 'assets/planets/7uranus.png',
        radius: '25,362 km',
        orbitalPeriod: '84 years',
        mass: '8.681 × 10^25 kg'));
    planets.add(PlanetData(
        name: 'Neptune',
        data:
            'Neptune is the eighth and farthest known planet from the Sun in the Solar System.',
        image: 'assets/planets/8neptune.png',
        radius: '24,622 km',
        orbitalPeriod: '165 years',
        mass: '1.024 × 10^26 kg'));
  }
}
