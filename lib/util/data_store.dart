import 'package:biologyquiz/model/chapter.dart';

class DataStore {
  static List<Chapter> allChapters() {
    List<Chapter> chapters = [];

    chapters.add(Chapter(
        name: 'Biology Basics',
        desc: 'Biology, study of living things and their vital processes. The field deals with all the physicochemical aspects of life.',
        code: 'IntroductionToBiology',
        img: 'assets/images/intro_bio.png'));

    chapters.add(Chapter(
        name: 'Cell Biology',
        desc: 'The study of cells is called cell biology, cellular biology, or cytology.',
        code: 'CellBiology',
        img: 'assets/images/cell_bio.png'));

    chapters.add(Chapter(
        name: 'Biological Molecules',
        desc: 'Biomolecule, also called biological molecule, any of numerous substances that are produced by cells and living organisms.',
        code: 'BiologicalMolecules',
        img: 'assets/images/bio_molecule.png'));

    chapters.add(Chapter(
        name: 'Enzymes',
        desc: 'Enzyme, a catalyst that regulates the rate at which chemical reactions proceed in living organisms without itself being altered in the process.',
        code: 'Enzymes',
        img: 'assets/images/enzymes.png'));

    chapters.add(Chapter(
        name: 'Bioenergetics',
        desc: 'Bioenergetics is the branch of biochemistry that focuses on how cells transform energy, often by producing, storing or consuming adenosine triphosphate (ATP).',
        code: 'Bioenergetics',
        img: 'assets/images/bioenergetics.png'));
    chapters.add(Chapter(
        name: 'Virus, Bacteria & Fungi',
        desc: 'Introduction to Bacteria, Viruses, Fungi, and Parasites.',
        code: 'VirusBacteriaFungi',
        img: 'assets/images/virus_bectaria_fungi.png'));
    chapters.add(Chapter(
        name: 'Kingdom Plantae and Animalia',
        desc: 'Kingdoms are divided into smaller groups called phyla.',
        code: 'KingdomPlantaeandAnimalia',
        img: 'assets/images/kingdom_plantae_animalia.png'));
    chapters.add(Chapter(
        name: 'Digestion',
        code: 'Digestion',
        desc: 'Digestion is the breakdown of large insoluble food molecules into small water-soluble food molecules so that they can be absorbed into the watery blood plasma.',
        img: 'assets/images/digestion.png'));
    chapters.add(Chapter(
        name: 'Gaseous Exchange',
        desc: 'Gas exchange is the delivery of oxygen from the lungs to the bloodstream, and the elimination of carbon dioxide from the bloodstream to the lungs.',
        code: 'GaseousExchange',
        img: 'assets/images/gaseous.png'));

    chapters.add(Chapter(
        name: 'Transport',
        desc: 'Transport refers to the act or the means by which a molecule or ion is moved across the cell membrane or via the bloodstream.',
        code: 'Transport',
        img: 'assets/images/transport.png'));


    chapters.add(Chapter(
        name: 'Immunity',
        desc: 'Immunity is the capability of multicellular organisms to resist harmful microorganisms from entering it.',
        code: 'Immunity',
        img: 'assets/images/immunity.png'));

    chapters.add(Chapter(
        name: 'Excretion and Osmoregulation',
        desc: 'Excretion is the elimination of the waste products of metabolism from an organism.',
        code: 'ExcretionandOsmoregulation',
        img: 'assets/images/excretion_osmoregulation.png'));


    chapters.add(Chapter(
        name: 'Support and Movements',
        desc: 'The musculoskeletal system provides form, support, stability, and movement to the body.',
        code: 'SupportandMovements',
        img: 'assets/images/support_movements.png'));

    chapters.add(Chapter(
        name: 'Coordination and Control',
        desc: 'The nervous system helps in controlling and coordinating various activities of the human body.',
        code: 'CoordinationandControl',
        img: 'assets/images/coordination_control.png'));

    chapters.add(Chapter(
        name: 'Reproduction',
        desc: 'Reproduction is the biological process by which new individual organisms – "offspring" – are produced from their "parents".',
        code: 'Reproduction',
        img: 'assets/images/reproduction.png'));

    chapters.add(Chapter(
        name: 'Growth and Development',
        desc: 'The term growth denotes a net increase in the size, or mass of the tissue. It is largely attributed to multiplication of cells',
        code: 'GrowthandDevelopment',
        img: 'assets/images/groth_developent.png'));


    chapters.add(Chapter(
        name: 'Evolution and Genetics',
        desc: 'Evolution is the process by which populations of organisms change over generations.',
        code: 'EvolutionandGenetics',
        img: 'assets/images/evolution_genetics.png'));


    chapters.add(Chapter(
        name: 'Biotechnology',
        desc: 'Biotechnology is the use of an organism, or a component of an organism or other biological system, to make a product or process.',
        code: 'Biotechnology',
        img: 'assets/images/biotechnalogy.png'));

    chapters.add(Chapter(
        name: 'Ecosystems and Environment',
        desc: 'Environment refers to the surroundings, whereas, ecosystem is the interaction between the environment and the living organisms.',
        code: 'EcosystemsandEnvironment',
        img: 'assets/images/ecosystem_environment.png'));

    return chapters;
  }
}
