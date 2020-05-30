import 'package:biologyquiz/model/chapter.dart';

class DataStore{

  static List<Chapter> allChapters(){

    List<Chapter> chapters = [];

    chapters.add(Chapter(name: 'Biology Basics', code: 'IntroductionToBiology', img: 'assets/images/bio.png'));
    chapters.add(Chapter(name: 'Cell Biology', code: 'CellBiology', img: 'assets/images/bio.png'));
    chapters.add(Chapter(name: 'Biological Molecules', code: 'BiologicalMolecules', img: 'assets/images/bio.png'));
    chapters.add(Chapter(name: 'Enzymes', code: 'Enzymes', img: 'assets/images/bio.png'));
    chapters.add(Chapter(name: 'Bioenergetics', code: 'Bioenergetics', img: 'assets/images/bio.png'));
    chapters.add(Chapter(name: 'Virus, Bacteria & Fungi', code: 'VirusBacteriaFungi', img: 'assets/images/bio.png'));
    chapters.add(Chapter(name: 'Kingdom Plantae and Animalia', code: 'KingdomPlantaeandAnimalia', img: 'assets/images/bio.png'));
    chapters.add(Chapter(name: 'Digestion', code: 'Digestion', img: 'assets/images/bio.png'));
    chapters.add(Chapter(name: 'Gaseous Exchange', code: 'GaseousExchange', img: 'assets/images/bio.png'));
    //chapters.add(Chapter(name: '', code: '', img: 'assets/images/bio.png'));
    //chapters.add(Chapter(name: '', code: '', img: 'assets/images/bio.png'));

    return chapters;
  }
}