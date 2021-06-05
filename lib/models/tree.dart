import 'dart:convert';

import 'package:my_plants/models/planted_tree.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tree {
  String plantId;
  String name;
  String description;
  int growZoneNumber;
  int wateringInterval;
  String imageUrl;
  String wikipediaLink;
  String datePlanted;

  Tree(this.plantId , this.name, this.description, this.growZoneNumber, this.wateringInterval , this.imageUrl, this.wikipediaLink, this.datePlanted);

  Map toJson() => {
    "plantId": plantId,
    "name": name,
    "growZoneNumber": growZoneNumber,
    "wateringInterval": wateringInterval,
    "imageUrl": imageUrl,
    "wikipediaLink":wikipediaLink,
    "datePlanted":datePlanted,
    "description": description,
  };

  factory Tree.fromJson(dynamic json) {
    return Tree(
      json['plantId'] as String,
      json['name'] as String,
      json['description'] as String,
      json['growZoneNumber'] as int,
      json['wateringInterval'] as int,
      json['imageUrl'] as String,
      json['wikipediaLink'] as String,
      json['datePlanted'] as String,
    );
  }
}

List<Tree> trees = [
  Tree("malus-pumila", "Apple", "An apple is a sweet, edible fruit produced by an apple tree (Malus pumila). Apple trees are cultivated worldwide, "
      "and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii,"
      " is still found today. Apples have been grown for thousands of years in Asia and Europe, and were brought to North America by European colonists."
      " Apples have religious and mythological significance in many cultures, including Norse, Greek and European Christian traditions."
      "Apple trees are large if grown from seed. Generally apple cultivars are propagated by grafting onto rootstocks, which control"
      " the size of the resulting tree. There are more than 7,500 known cultivars of apples, resulting in a range of desired characteristics. "
      "Different cultivars are bred for various tastes and uses, including cooking, eating raw and cider production. Trees and fruit are prone "
      "to a number of fungal, bacterial and pest problems, which can be controlled by a number of organic and non-organic means. In 2010, "
      "the fruit's genome was sequenced as part of research on disease control and selective breeding in apple production."
      "Worldwide production of apples in 2014 was 84.6 million tonnes, with China accounting for 48% of the total."
      "",
      3, 30, "https://upload.wikimedia.org/wikipedia/commons/5/55/Apple_orchard_in_Tasmania.jpg",
      "https://en.wikipedia.org/wiki/Apple",
      ""
  ),
  Tree(
      "beta-vulgaris",
      "Beet",
      "The beetroot is the taproot portion of the beet plant, usually known in North America as the beet and also"
          " known as the table beet, garden beet, red beet, or golden beet. It is one of several of the cultivated varieties "
          "of Beta vulgaris grown for their edible taproots and their leaves (called beet greens). These varieties have been"
          " classified as B. vulgaris subsp. vulgaris Conditiva Group.Other than as a food, beets have use as a food colouring and "
          "as a medicinal plant. Many beet products are made from other Beta vulgaris varieties, particularly sugar beet.",
      2, 7,
      "https://upload.wikimedia.org/wikipedia/commons/2/29/Beetroot_jm26647.jpg",
      "https://en.wikipedia.org/wiki/Beetroot",
      ""
  ),
  Tree(
      "coriandrum-sativum",
      "Cilantro",
      "Coriander, also known as cilantro or Chinese parsley, is an annual herb in the family Apiaceae. All parts of the plant are edible,"
          " but the fresh leaves and the dried seeds are the parts most traditionally used in cooking.",
      2, 2,
      "https://upload.wikimedia.org/wikipedia/commons/5/51/A_scene_of_Coriander_leaves.JPG",
      "https://en.wikipedia.org/wiki/Coriander",
      ""
  ),
  Tree(
      "solanum-lycopersicum",
      "Tomato",
      "The tomato is the edible, often red, berry of the nightshade Solanum lycopersicum, commonly known as a tomato plant. The species originated in"
          " western South America. The Nahuatl (Aztec language) word tomatl gave rise to the Spanish word tomate, from which the English word tomato "
          "derived. Its use as a cultivated food may have originated with the indigenous peoples of Mexico. The Spanish encountered the tomato from "
          "their contact with the Aztec during the Spanish colonization of the Americas and brought it to Europe. From there, "
          "the tomato was introduced to other parts of the European-colonized world during the 16th century."
          "The tomato is consumed in diverse ways, raw or cooked, in many dishes, sauces, salads, and drinks. "
          "While tomatoes are fruits – botanically classified as berries – they are commonly used as a vegetable ingredient "
          "or side dish.Numerous varieties of the tomato plant are widely grown in temperate climates across the world,"
          " with greenhouses allowing for the production of tomatoes throughout all seasons of the year. "
          "Tomato plants typically grow to 1–3 meters (3–10 ft) in height. They are vines that have a weak stem that sprawls and "
          "typically needs support. Indeterminate tomato plants are perennials in their native habitat, but are cultivated as annuals."
          " Determinate, or bush, plants are annuals that stop growing at a certain height and produce a crop all at once. The size of the "
          "tomato varies according to the cultivar, with a range of 0.5–4 inches (1.3–10.2 cm) in width.",
      9, 4,
      "https://upload.wikimedia.org/wikipedia/commons/1/17/Cherry_tomatoes_red_and_green_2009_16x9.jpg",
      "https://en.wikipedia.org/wiki/Tomato",
      ""
  ),
  Tree(
      "persea-americana",
      "Avocado",
      "The avocado (Persea americana) is a tree, long thought to have originated in South Central Mexico, classified as"
          " a member of the flowering plant family Lauraceae. The fruit of the plant, also called an avocado (or avocado pear or alligator pear),"
          " is botanically a large berry containing a single large seed.Avocados are commercially valuable and are cultivated in tropical "
          "and Mediterranean climates throughout the world. They have a green-skinned, fleshy body that may be pear-shaped, egg-shaped, "
          "or spherical. Commercially, they ripen after harvesting. Avocado trees are partially self-pollinating and are often propagated "
          "through grafting to maintain a predictable quality and quantity of the fruit.",
      9,
      3,
      "https://upload.wikimedia.org/wikipedia/commons/e/e4/Branch_and_fruit_of_the_Maluma_avocado_cultivar.jpg",
      "https://en.wikipedia.org/wiki/Avocado",
      ""
  ),
  Tree(
      "pyrus-communis",
      "Pear",
      "The pear tree and shrub are a species of genus Pyrus, in the family Rosaceae, bearing the pomaceous fruit of the same name. "
          "Several species of pear are valued for their edible fruit and juices while others are cultivated as trees.",
      3, 30,
      "https://upload.wikimedia.org/wikipedia/commons/1/13/More_pears.jpg",
      "https://en.wikipedia.org/wiki/Pear",
      ""
  ),
  Tree(
      "solanum-melongena",
      "Eggplant",
      "Eggplant (US), aubergine (UK), or brinjal (South Asia and South Africa) is a plant species in the nightshade family Solanaceae,"
          " Solanum melongena, grown for its often purple edible fruit.The spongy, absorbent fruit of the plant is widely used "
          "in cooking in many different cuisines, and is often considered a vegetable, even though it is a berry by botanical definition. "
          "As a member of the genus Solanum, it is related to the tomato and the potato. Like the tomato, its skin and seeds can be eaten, but, "
          "like the potato, it is not advisable to eat it raw. Eggplant supplies low contents of macronutrients and micronutrients. "
          "The capability of the fruit to absorb oils and flavors into its flesh through cooking is well known in the culinary arts."
          "It was originally domesticated from the wild nightshade species thorn or bitter apple,"
          " S. incanum, probably with two independent domestications: one in South Asia, and one in East Asia.",
      4, 3,
      "https://upload.wikimedia.org/wikipedia/commons/e/e5/Eggplant_display.JPG",
      "https://en.wikipedia.org/wiki/Eggplant",
      ""
  ),
  Tree(
      "vitis-vinifera",
      "Grape",
      "A grape is a fruit, botanically a berry, of the deciduous woody vines of the flowering plant genus Vitis."
          "Grapes can be eaten fresh as table grapes or they can be used for making wine, jam, juice, jelly, grape seed extract, raisins, "
          "vinegar, and grape seed oil. Grapes are a non-climacteric type of fruit, generally occurring in clusters.",
      9, 9,
      "https://upload.wikimedia.org/wikipedia/commons/0/03/Grape_Plant_and_grapes9.jpg",
      "https://en.wikipedia.org/wiki/Grape",
      ""
  ),
  Tree(
      "mangifera-indica",
      "Mango",
      "Mangoes are juicy stone fruit (drupe) from numerous species of tropical trees belonging to the flowering plant genus Mangifera,"
          " cultivated mostly for their edible fruit.<br><br>The majority of these species are found in nature as wild mangoes. "
          "The genus belongs to the cashew family Anacardiaceae. Mangoes are native to South Asia, from where the common mango or Indian mango, Mangifera indica, has been distributed worldwide to become one of the most widely cultivated fruits in the tropics. Other Mangifera species (e.g. horse mango, Mangifera foetida) are grown on a more localized basis.<br><br>It is the national fruit of India, Pakistan, and the Philippines, and the national tree of Bangladesh.",
      11, 7,
      "https://upload.wikimedia.org/wikipedia/commons/6/67/Mangos_criollos_y_pera.JPG",
      "https://en.wikipedia.org/wiki/Mango",
      ""
  ),
  Tree(
      "citrus-x-sinensis",
      "Orange",
      "The orange is the fruit of the citrus species Citrus × sinensis in the family Rutaceae. It is also called sweet orange, to distinguish it from the related Citrus × aurantium, referred to as bitter orange. The sweet orange reproduces asexually (apomixis through nucellar embryony); varieties of sweet orange arise through mutations.<br><br>The orange is a hybrid between pomelo (Citrus maxima) and mandarin (Citrus reticulata). The chloroplast genome, and therefore the maternal line, is that of pomelo. The sweet orange has had its full genome sequenced.<br><br>Sweet oranges were mentioned in Chinese literature in 314 BC. As of 1987, orange trees were found to be the most cultivated fruit tree in the world. Orange trees are widely grown in tropical and subtropical climates for their sweet fruit. The fruit of the orange tree can be eaten fresh, or processed for its juice or fragrant peel. As of 2012, sweet oranges accounted for approximately 70% of citrus production.<br><br>In 2014, 70.9 million tonnes of oranges were grown worldwide, with Brazil producing 24% of the world total followed by China and India.",
      9, 30,
      "https://upload.wikimedia.org/wikipedia/commons/2/22/Apfelsinenbaum--Orange_tree.jpg",
      "https://en.wikipedia.org/wiki/Orange_(fruit)",
      ""
  ),
  Tree(
      "helianthus-annuus",
      "Sunflower",
      "Roses are red Violets are blue Sunflowers have seeds. That folks love to chew Helianthus annuus, the common sunflower,"
          " is a large annual forb of the genus Helianthus grown as a crop for its edible oil and edible fruits. "
          "This sunflower species is also used as wild bird food, as livestock forage (as a meal or a silage plant),"
          " in some industrial applications, and as an ornamental in domestic gardens. The plant was first domesticated in the Americas."
          " Wild Helianthus annuus is a widely branched annual plant with many flower heads. The domestic sunflower,"
          " however, often possesses only a single large inflorescence (flower head) atop an unbranched stem."
          " The name sunflower may derive from the flower's head's shape, which resembles the sun, or from the impression that the blooming plant"
          " appears to slowly turn its flower towards the sun as the latter moves across the sky on a daily basis."
          "Sunflower seeds were brought to Europe from the Americas in the 16th century, where, along with sunflower oil,"
          " they became a widespread cooking ingredient.",
      8, 3,
      "https://upload.wikimedia.org/wikipedia/commons/a/aa/Sunflowers_in_field_flower.jpg",
      "https://en.wikipedia.org/wiki/Helianthus_annuus",
      ""
  ),
  Tree(
      "citrullus-lanatus",
      "Watermelon",
      "Citrullus lanatus is a plant species in the family Cucurbitaceae, a vine-like (scrambler and trailer)"
          " flowering plant originating in West Africa. It is cultivated for its fruit. The subdivision of this species into two varieties,"
          " watermelons (Citrullus lanatus (Thunb.) var. lanatus) and citron melons (Citrullus lanatus var. citroides (L. H. Bailey) Mansf.),"
          " originated with the erroneous synonymization of Citrullus lanatus (Thunb.) Matsum. & Nakai and Citrullus vulgaris Schrad."
          " by L.H. Bailey in 1930. Molecular data including sequences from the original collection of Thunberg and other relevant type material,"
          " show that the sweet watermelon (Citrullus vulgaris Schrad.) and the bitter wooly melon Citrullus lanatus (Thunb.)"
          " Matsum. & Nakai are not closely related to each other. Since 1930, thousands of papers have misapplied the name"
          " Citrullus lanatus (Thunb.) Matsum. & Nakai for the watermelon, and a proposal to conserve the name with this meaning was accepted"
          " by the relevant nomenclatural committee and confirmed at the International Botanical Congress in Shenzhen."
          "The bitter South African melon first collected by Thunberg has become naturalized in semiarid regions of several continents, "
          "and is designated as a 'pest plant' in parts of Western Australia where they are called pig melon."
          "Watermelon (Citrullus lanatus) is a scrambling and trailing vine in the flowering plant family Cucurbitaceae."
          " The species was long thought to have originated in southern Africa, but this was based on the erroneous synonymization"
          " by L. H. Bailey (1930) of a South African species with the cultivated watermelon. The error became apparent with DNA "
          "comparison of material of the cultivated watermelon seen and named by Linnaeus and the holotype of the South African species."
          " There is evidence from seeds in Pharao tombs of watermelon cultivation in Ancient Egypt. Watermelon is grown in tropical and "
          "subtropical areas worldwide for its large edible fruit, also known as a watermelon, which is a special kind of berry with a hard "
          "rind and no internal division, botanically called a pepo. The sweet, juicy flesh is usually deep red to pink, with many black seeds, "
          "although seedless varieties have been cultivated. The fruit can be eaten raw or pickled and the rind is edible after cooking."
          "Considerable breeding effort has been put into disease-resistant varieties. Many cultivars are available that produce mature "
          "fruit within 100 days of planting the crop.",
      7, 3,
      "https://upload.wikimedia.org/wikipedia/commons/f/fc/01266jfWatermelons_Philippines_textures_Apolonio_Samson_Market_Quezon_Cityfvf_02.jpg",
      "https://en.wikipedia.org/wiki/Watermelon",
      ""
  ),
  Tree(
      "hibiscus-rosa-sinensis",
      "Hibiscus",
      "Hibiscus is a genus of flowering plants in the mallow family, Malvaceae. "
          "The genus is quite large, comprising several hundred species that are native to warm temperate, subtropical and tropical regions "
          "throughout the world. Member species are renowned for their large, showy flowers and those species are commonly known simply as "
          "hibiscus, or less widely known as rose mallow. There are also names for hibiscus such as hardy hibiscus, rose of sharon, "
          "and tropical hibiscus.The genus includes both annual and perennial herbaceous plants, as well as woody shrubs and small trees. "
          "The generic name is derived from the Greek name ἰβίσκος (hibiskos) which Pedanius Dioscorides gave to Althaea officinalis "
          "(c. 40–90 AD).Several species are widely cultivated as ornamental plants, notably Hibiscus syriacus and Hibiscus rosa-sinensis."
          "A tea made from hibiscus flowers is known by many names around the world and is served both hot and cold."
          " The beverage is known for its red colour, tart flavour, and vitamin C content.",
      10, 1,
      "https://upload.wikimedia.org/wikipedia/commons/8/82/Hibiscus_rosa-sinensis_flower_2.JPG",
      "https://en.wikipedia.org/wiki/Hibiscus",
      ""
  ),
  Tree(
      "cypripedium-reginae",
      "Pink & White Lady's Slipper",
      "Cypripedium reginae, known as the showy lady's slipper, pink-and-white lady's-slipper, or the queen's lady's-slipper, "
          "is a rare terrestrial lady's-slipper orchid native to northern North America.It is the state flower of Minnesota, "
          "United States, and the provincial flower of Prince Edward Island, Canada.Despite producing a large amount of seeds per seed pod, "
          "it reproduces largely by vegetative reproduction, and remains restricted to the North East region of the United States "
          "and south east regions of Canada. Although never common, this rare plant has vanished from much of its historical range due"
          " to habitat loss. It has been a subject of horticultural interest for many years with Charles Darwin who, like many, was unsuccessful "
          "in cultivating the plant.",
      4, 7,
      "https://upload.wikimedia.org/wikipedia/commons/a/ab/Cypripedium_reginae_Orchi_004.jpg",
      "https://en.wikipedia.org/wiki/Cypripedium_reginae",
      ""
  ),
  Tree(
      "aquilegia-coerulea",
      "Rocky Mountain Columbine",
      "Aquilegia coerulea, the state flower of Colorado, is a species of flowering plant in the buttercup family"
          " Ranunculaceae, native to the Rocky Mountains from Montana south to New Mexico and west to Idaho and Arizona. Its common name is "
          "Colorado blue columbine; sometimes it is called \"Rocky Mountain columbine,\" but this also refers to Aquilegia saximontana.",
      5, 3,
      "https://upload.wikimedia.org/wikipedia/commons/9/94/Aquilegia_caerulea.jpg",
      "https://en.wikipedia.org/wiki/Aquilegia_coerulea",
      ""
  ),
  Tree(
      "magnolia-denudata",
      "Yulan Magnolia",
      "Magnolia denudata, known as the lilytree or Yulan magnolia (simplified Chinese:"
          " 玉兰花; traditional Chinese: 玉蘭花), is native to central and eastern China. It "
          "has been cultivated in Chinese Buddhist temple gardens since 600 AD. Its flowers were regarded as a symbol of purity in the"
          " Tang Dynasty and it was planted in the grounds of the Emperor's palace."
          "It is the official city flower of Shanghai.",
      8, 7,
      "https://upload.wikimedia.org/wikipedia/commons/1/13/Yulan_magnolia_%28Magnolia_denudata%29_%2816953983745%29.jpg",
      "https://en.wikipedia.org/wiki/Magnolia_denudata",
      ""
  ),
  Tree(
      "bougainvillea-glabra",
      "Bougainvillea",
      "Bougainvillea is a genus of thorny ornamental vines, bushes, or trees. The inflorescence consists of large colourful sepallike bracts which "
          "surround three simple waxy flowers. The vine species grow anywhere from 1 to 12 m (3 to 40 ft.) tall, scrambling over other plants with their"
          " spiky thorns, which are tipped with a black, waxy substance. They are evergreen where rainfall occurs all year, or deciduous if there is a"
          " dry season.Bougainvillea glabra (simplified Chinese: 簕杜鹃; traditional Chinese: 簕杜鵑) is the official city flower of Shenzhen "
          "and many other cities around the world.",
      10, 21,
      "https://upload.wikimedia.org/wikipedia/commons/6/6d/Paperflower_--_Bougainvillea_glabra.jpg",
      "https://en.wikipedia.org/wiki/Bougainvillea",
      ""
  ),
];

