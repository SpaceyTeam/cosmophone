import 'package:bloc_pattern/bloc_pattern.dart';

enum TtsState { playing, stopped }

class PlanetDetailsBloc extends BlocBase {
  String getDescription(String planetName) {
    switch (planetName.toLowerCase()) {
      case 'mars':
        return 'Mars is one of the most explored bodies in our solar system and is the only planet to which we send rovers to travel through the alien landscape. NASA currently has three orbiting spacecraft, one rover and one lander on the surface and another rover under construction here on Earth. India and ESA also have spacecraft orbiting above Mars.';
        break;
      case 'saturn':
        return 'Eighty-two moons makes the ringed giant king of the moon count - for now. (NASA, 2019)';
        break;
      case 'makemake':
        return 'Makemake holds an important place in the history of solar system studies because it was one of the objects whose discovery prompted the International Astronomical Union to reconsider the definition of a planet and to create the new group of dwarf planets.';
        break;
      case 'eris':
        return 'Eris at first seemed to be bigger than Pluto. This triggered a debate in the scientific community that led to the decision of the International Astronomical Union in 2006 to clarify the definition of the planet. Eris is named after the ancient Greek goddess of discord and discord. The name fits in, as Eris remains at the center of a scientific debate about planet definition.';
        break;
      case 'neptune':
        return 'More than 30 times farther from the Sun than Earth, Neptune is the only planet in our solar system that is not visible to the naked eye and the first predicted by mathematics before its discovery. In 2011, Neptune completed its first 165-year orbit since its discovery in 1846.';
        break;
      case 'venus':
        return 'Venus is the second closest planet to the sun and its day lasts 243 Earth days. (NASA, 2019)';
        break;
      case 'sun':
        return 'The Sun - the heart of our solar system - is a yellow dwarf star, a hot ball of bright gases. Its gravity holds the solar system together, holding everything from the largest planets to the smallest debris particles in its orbit.';
        break;
      case 'mercury':
        return 'Hot like you expect, but also colder than you might think (NASA, 2019)';
        break;
      case 'moon':
        return 'The largest and brightest object in our night sky, the Moon makes Earth a more livable planet, moderating our planet\'s oscillation on its axis, leading to a relatively stable climate. Beyond Earth is the only place beyond Earth where humans have stepped.';
        break;
      case 'jupiter':
        return 'King of the planets. Only the Sun has more influence on our solar system.';
        break;
      case 'uranus':
        return 'The first planet found with the help of a telescope, Uranus was discovered in 1781 by astronomer William Herschel, although he originally thought it was a comet or a star. Two years later, the object was universally accepted as a new planet, in part because of the observations of astronomer Johann Elert Bode.';
        break;
      case 'pluto':
        return 'Pluto - which is smaller than Earth\'s moon - has a heart-shaped glacier the size of Texas and Oklahoma. This fascinating world has blue skies, whirling moons, mountains as high as the Rockies and snow - but the snow is red.';
        break;
      case 'haumea':
        return 'Haumea resides in the Kuiper belt and is roughly the same size as Pluto. Haumea is one of the fastest rotating large objects in our solar system. Its fast spin distorts Haumea\'s shape, making this dwarf planet look like a football. Every 4 hours, faster than any other body in the solar system';
        break;
      case 'quaoar':
        return '50000 Quaoar is a transnetunian object located between Pluto and Sedna, about 6.5 billion miles from Earth. This transnetunian object was discovered on June 4, 2002 by Caltech astronomers Chad Trujillo and Michael Brown, and its discovery was announced on October 7, 2002.';
        break;
      default:
        return '';
    }
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
  }
}
