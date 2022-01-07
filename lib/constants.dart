import 'package:flutter/material.dart';
import 'package:isro/models/Questions.dart';
import 'package:isro/models/Subjects.dart';

const Astrophysics = Subject(name: 'Astrophysics', id: 0, questions: [
  Question(
      question: 'Which of the following type of galaxy is our Milky Way?',
      op1: 'A spiral galaxy',
      op2: 'An irregulary galaxy',
      op3: 'An elliptical galaxy',
      op4: 'None of these',
      answer: 0),
  Question(
      question:
          'The position of a planet when it is nearest to the Sun is called',
      op1: 'Apogee',
      op2: 'Aphelion',
      op3: 'Perigee',
      op4: 'Perihelion',
      answer: 3),
  Question(
      question: 'The unit of measuring distances between the stars is known as',
      op1: 'Light year',
      op2: 'Stellar mile',
      op3: 'Cosmic kilometer',
      op4: 'Galactic unit',
      answer: 0),
  Question(
      question:
          'The orbits of planets around the Sun, or of satellites around the Earth can be',
      op1: 'Circular and elliptic',
      op2: 'Parabolic and hyperbolic',
      op3: 'Elliptic and parabolic',
      op4: 'Circular and hyperbolic',
      answer: 0),
  Question(
      question:
          'On which of the following planets of the solar system does the sun rise in the west and set in the east?',
      op1: 'Saturn',
      op2: 'Mars',
      op3: 'Jupiter',
      op4: 'Venus',
      answer: 3),
  Question(
      question:
          'Which one of the following planets takes the same number of days for rotation and revolution?',
      op1: 'Jupiter',
      op2: 'Mars',
      op3: 'Mercury',
      op4: 'Venus',
      answer: 2),
  Question(
      question: 'Which planet is called \'Double Planet\'?',
      op1: 'Venus',
      op2: 'Uranus',
      op3: 'Pluto',
      op4: 'Earth',
      answer: 2),
  Question(
      question: 'Largest satellite in Solar System is ____.',
      op1: 'Moon',
      op2: 'Ganymede',
      op3: 'Europa',
      op4: 'Cheron',
      answer: 1),
  Question(
      question: 'Hale Bopp\' is a newly discovered ____.',
      op1: 'Planet',
      op2: 'Meteore',
      op3: 'Satellite',
      op4: 'Comet',
      answer: 3),
  Question(
      question: 'Charon is the satellite of _____.',
      op1: 'Pluto',
      op2: 'Earth',
      op3: 'Saturn',
      op4: 'Venus',
      answer: 0),
  Question(
      question: 'The word \'planet\' means ____.',
      op1: 'pollution',
      op2: 'wanderer',
      op3: 'celestial body',
      op4: 'D heavenly body',
      answer: 1),
  Question(
      question:
          'What is the most accurate description of the shape of the earth?',
      op1: 'a geoid',
      op2: 'a spherical',
      op3: 'an oblate sphere',
      op4: 'D a flat disc',
      answer: 0),
]);
const Aeronautics = Subject(name: 'Aeronautics', id: 1, questions: [
  Question(
      question: 'A lift is calculated by ____ to the direction of motion?',
      op1: 'Perpendicular',
      op2: 'Parallel',
      op3: 'opposite',
      op4: 'relative',
      answer: 0),
  Question(
      question: 'Aircraft Maintenance Engineer (AME), also called?',
      op1: 'AMM',
      op2: 'AME',
      op3: 'LAME',
      op4: 'KAME',
      answer: 2),
  Question(
      question: 'CAMP Stands for?',
      op1: 'Continuous Air Maintenance Program',
      op2: 'Continuous Airworthiness Mileage Program',
      op3: 'Continuous Airworthiness Maintenance Program',
      op4: 'Continuous Air Mileage Program',
      answer: 2),
  Question(
      question:
          'Aircraft maintenance is the performance of tasks required to ensure the continuing airworthiness of an aircraft or aircraft part?',
      op1: 'Yes',
      op2: 'No',
      op3: 'Can be yes or no',
      op4: 'Can not say',
      answer: 0),
  Question(
      question: 'How many man hours does a D-check require?',
      op1: '40',
      op2: '400',
      op3: '4000',
      op4: '40000',
      answer: 3),
  Question(
      question: 'A maintenance release can also be called a?',
      op1: 'ARS',
      op2: 'CRS',
      op3: 'BRS',
      op4: 'DRS',
      answer: 1),
  Question(
      question:
          'A D-check basically takes the entire airplane apart for inspection and overhaul. Such a check can take up to ________ to complete.',
      op1: '7 weeks',
      op2: '8 weeks',
      op3: '9 weeks',
      op4: '10 weeks',
      answer: 1),
  Question(
      question:
          'Automated aircraft inspection systems have the potential to make aircraft maintenance safer and more reliable',
      op1: 'TRUE',
      op2: 'FALSE',
      op3: 'Can be true or false',
      op4: 'Can not say',
      answer: 0),
  Question(
      question:
          'Which program provides budget predictability, avoids installing a loaner during repairs when an aircraft part fails and enrolled aircraft may have a better value and liquidity.',
      op1: 'Scheduled maintenance checks',
      op2: 'Power by the Hour',
      op3: 'Maintenance release',
      op4: 'Maintenance personnel',
      answer: 1),
  Question(
      question: 'Which of the following is not a part of Avionic systems',
      op1: 'Flight Recorder',
      op2: 'Weather Radars',
      op3: 'Communication Systems',
      op4: 'Empennage',
      answer: 3),
]);
const Geology = Subject(name: 'Geology', id: 2, questions: [
  Question(
      question:
          'The branch of geology which deals with occurrence, origin and history of rocks isknown as',
      op1: 'hydrogeology',
      op2: 'pedology',
      op3: 'petrology',
      op4: 'geomorphology',
      answer: 2),
  Question(
      question:
          'The branch of geology which deals with study of chronology of the earth\'s pastevents is called as',
      op1: 'historical geology',
      op2: 'structural geology',
      op3: 'physical geology',
      op4: 'none of the above',
      answer: 0),
  Question(
      question:
          'The branch of geology which deals with study of uppermost layers of earth\'s crust is known as',
      op1: 'petrology',
      op2: 'hydrogeology',
      op3: 'pedology',
      op4: 'geomorphology',
      answer: 2),
  Question(
      question:
          'Rocks which are formed from weathering products of preexisting rocks deposited near earth\'s surface are called as',
      op1: 'Igneous rocks',
      op2: 'Sedimentary rocks',
      op3: 'Metamorphic rocks',
      op4: 'None of the above',
      answer: 1),
  Question(
      question:
          'In relative proportion of rocks by weight percentage which type of rocks are having maximum percentage ?',
      op1: 'Igneous rocks',
      op2: 'Sedimentary rocks',
      op3: 'Metamorphic rocks',
      op4: 'None of the above',
      answer: 0),
  Question(
      question:
          'Approximately % of sun\'s heat is absorbed by land, sea or the atmosphere ?',
      op1: '40',
      op2: '20',
      op3: '10',
      op4: '60',
      answer: 3),
  Question(
      question:
          'Element which constitute earth crust with maximum volume per cent is',
      op1: 'oxygen',
      op2: 'potassium',
      op3: 'sodium',
      op4: 'silicon',
      answer: 0),
  Question(
      question:
          'The study of rocks in the laboratory as hand specimens with a view to analyse anddiscuss their texture, mineral composition, chemical composition is called as',
      op1: 'petrography',
      op2: 'hydrogeology',
      op3: 'pedology',
      op4: 'any of the above',
      answer: 0),
  Question(
      question:
          'The physical property of mineral by which minerals are identified on account of its colour of the powder form is called as',
      op1: 'colour',
      op2: 'luster',
      op3: 'streak',
      op4: 'none of these',
      answer: 2),
  Question(
      question:
          'Quartz has hardness of 7 and will scratch on all the minerals with hardness 8 and higher.',
      op1: 'True',
      op2: 'False',
      op3: 'Can not say',
      op4: 'none',
      answer: 1),
  Question(
      question: 'The common nesosilicate – single tetrahedron is',
      op1: 'olivine',
      op2: 'pyroxene',
      op3: 'quartz',
      op4: 'feldspar',
      answer: 0),
]);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
