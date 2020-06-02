import 'package:biologyquiz/model/chapter.dart';

class DataStore {
  static List<Chapter> allChapters() {
    List<Chapter> chapters = [];

    chapters.add(Chapter(
        name: 'Biology Basics',
        desc: '',
        code: 'IntroductionToBiology',
        img: 'assets/images/bio.png'));
    chapters.add(Chapter(
        name: 'Cell Biology',
        desc: '',
        code: 'CellBiology',
        img: 'assets/images/bio.png'));
    chapters.add(Chapter(
        name: 'Biological Molecules',
        code: 'BiologicalMolecules',
        img: 'assets/images/bio.png'));
    chapters.add(Chapter(
        name: 'Enzymes',
        desc: '',
        code: 'Enzymes',
        img: 'assets/images/bio.png'));
    chapters.add(Chapter(
        name: 'Bioenergetics',
        desc: '',
        code: 'Bioenergetics',
        img: 'assets/images/bio.png'));
    chapters.add(Chapter(
        name: 'Virus, Bacteria & Fungi',
        desc: '',
        code: 'VirusBacteriaFungi',
        img: 'assets/images/bio.png'));
    chapters.add(Chapter(
        name: 'Kingdom Plantae and Animalia',
        desc: '',
        code: 'KingdomPlantaeandAnimalia',
        img: 'assets/images/bio.png'));
    chapters.add(Chapter(
        name: 'Digestion',
        code: 'Digestion',
        desc: '',
        img: 'assets/images/bio.png'));
    chapters.add(Chapter(
        name: 'Gaseous Exchange',
        desc: '',
        code: 'GaseousExchange',
        img: 'assets/images/bio.png'));

    chapters.add(Chapter(
        name: 'Transport',
        desc: '',
        code: 'Transport',
        img: 'assets/images/bio.png'));


    chapters.add(Chapter(
        name: 'Immunity',
        desc: '',
        code: 'Immunity',
        img: 'assets/images/bio.png'));

    chapters.add(Chapter(
        name: 'Excretion and Osmoregulation',
        desc: '',
        code: 'ExcretionandOsmoregulation',
        img: 'assets/images/bio.png'));


    chapters.add(Chapter(
        name: 'Support and Movements',
        desc: '',
        code: 'SupportandMovements',
        img: 'assets/images/bio.png'));

    chapters.add(Chapter(
        name: 'Coordination and Control',
        desc: '',
        code: 'CoordinationandControl',
        img: 'assets/images/bio.png'));

    chapters.add(Chapter(
        name: 'Reproduction',
        desc: '',
        code: 'Reproduction',
        img: 'assets/images/bio.png'));

    chapters.add(Chapter(
        name: 'Growth and Development',
        desc: '',
        code: 'GrowthandDevelopment',
        img: 'assets/images/bio.png'));


    chapters.add(Chapter(
        name: 'Evolution and Genetics',
        desc: '',
        code: 'EvolutionandGenetics',
        img: 'assets/images/bio.png'));


    chapters.add(Chapter(
        name: 'Biotechnology',
        desc: '',
        code: 'Biotechnology',
        img: 'assets/images/bio.png'));

    chapters.add(Chapter(
        name: 'Ecosystems and Environment',
        desc: '',
        code: 'EcosystemsandEnvironment',
        img: 'assets/images/bio.png'));

    return chapters;
  }
}
