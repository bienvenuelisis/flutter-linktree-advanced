import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'responsive.dart';

const List<String> descriptions = [
  "Baobab Alley, Madagascar",
  "The underwater waterfall, Mauritius Island",
  "Architecture of buildings, Namibia",
  "The Ngorongoro Crater, Tanzania",
  "The dunes of Sossusvlei, Namibia",
  "National Park of Etosha, Namibia",
  "City of Goree, Senegal",
  "Lake Natron, Tanzania",
  "Pink lakes and canoes, Senegal",
  "Pink lake seen from above, Senegal",
  "Mosquée de Djenne, Mali",
  "National Park of Nyungwe, Rwanda",
  "Hotel by the sea, Zanzibar",
];

const List<BlendMode> filtersMode = [
  BlendMode.modulate,
  BlendMode.colorBurn,
  BlendMode.dstATop,
  BlendMode.dstOver,
  BlendMode.hardLight,
  BlendMode.difference,
];

const List<String> imagesBackground = [
  "assets/baobabs-madagascar.webp",
  "assets/cascade-sous-marine-iles-maurice.webp",
  "assets/cité-namibie.jpg",
  "assets/cratere-ngorongono-et-faune.webp",
  "assets/dunes-sossusvlei-soirée.webp",
  "assets/etosha-lion.webp",
  "assets/goree-paysages.webp",
  "assets/lac-natron-vue-de-haut.webp",
  "assets/lac-rose-pirogue.webp",
  "assets/lac-rose-prise-couleur-haut.webp",
  "assets/mosque-djenne-mali.webp",
  "parc-Nyungwe-paysage.jpg",
  "assets/zanzibar-hotel.jpg",
];

const List<String> imagesProfiles = [
  "assets/me/me.jpg",
  "assets/me/me_smile.jpg",
  "assets/me/me_aledjo.jpg",
];

class SocialLink {
  final String name;

  final String url;

  final Widget icon;

  final Color color;

  const SocialLink({
    @required this.name,
    @required this.url,
    @required this.icon,
    @required this.color,
  });

  Widget box(Size size, BuildContext context) => Card(
        elevation: 9,
        color: Colors.transparent,
        borderOnForeground: false,
        shadowColor: Colors.transparent,
        child: Container(
          margin: EdgeInsets.only(
            bottom: size.height / 36,
          ),
          padding: const EdgeInsets.all(9),
          //height: size.height / 15,
          width:
              Responsive.isMobile(context) ? size.width * 0.9 : size.width / 2,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
          ),
          child: InkWell(
            hoverColor: Colors.teal,
            onTap: () => launch(url),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                icon,
                const SizedBox(width: 18),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: Responsive.isMobile(context) ? 14 : 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

const List<SocialLink> links = [
  SocialLink(
    name: "My Portofolio Website",
    url: "https://bienvenuelisis.github.io/",
    icon: Icon(
      FlutterIcons.user_circle_faw5,
      color: Colors.white,
    ),
    color: Colors.teal,
  ),
  SocialLink(
    name: "Email me",
    url: "mailto:agbavonbienvenu@gmail.com",
    icon: Icon(
      FlutterIcons.email_mdi,
      color: Colors.white,
    ),
    color: Colors.indigo,
  ),
  SocialLink(
    name: "Take a look at my apps",
    url: "https://bienvenuelisis.github.io/apps-noir-meilleur/",
    icon: Icon(
      FlutterIcons.apps_box_mco,
      color: Colors.black,
    ),
    color: Colors.brown,
  ),
  SocialLink(
    name: "Follow me on Twitter",
    url: "https://twitter.com/agbavonkokou",
    icon: Icon(
      FlutterIcons.twitter_faw5d,
      color: Colors.white,
    ),
    color: Colors.blue,
  ),
  SocialLink(
    name: "Collaborate with me on GitHub",
    url: "https://github.com/bienvenuelisis/",
    icon: Icon(
      FlutterIcons.github_faw5d,
      color: Colors.white,
    ),
    color: Colors.black45,
  ),
  SocialLink(
    name: "Reach me on LinkedIn",
    url: "https://www.linkedin.com/in/bienvenu-agbavon/",
    icon: Icon(
      FlutterIcons.linkedin_faw5d,
      color: Colors.white,
    ),
    color: Colors.indigoAccent,
  ),
  SocialLink(
    name: "Read my articles on Hashnode",
    url: "https://blog.theresilient.dev/",
    icon: Icon(
      FlutterIcons.newspaper_faw5s,
      color: Colors.white,
    ),
    color: Colors.teal,
  ),
  SocialLink(
    name: "When i don't talk code...",
    url: "https://www.instagram.com/noir___meilleur/",
    icon: Icon(
      FlutterIcons.instagram_faw5d,
      color: Colors.white,
    ),
    color: Colors.redAccent,
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _reloadScore = 1;

  int get score => _reloadScore;

  final Random random = Random();

  int bgIndex = 0;

  int meIndex = 0;

  int colorModeIndex = 0;

  void reload() {
    setState(() {
      bgIndex = random.nextInt(imagesBackground.length);
      meIndex = random.nextInt(imagesProfiles.length);
      colorModeIndex = random.nextInt(filtersMode.length);
      _reloadScore++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  int get maxBlendMode => 6;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              width: size.width,
              height: size.height,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(
                    imagesBackground[bgIndex],
                  ),
                  fit: BoxFit.cover,
                  colorFilter: filtersMode[colorModeIndex] == null
                      ? null
                      : ColorFilter.mode(
                          Colors.teal,
                          filtersMode[colorModeIndex],
                        ),
                  filterQuality: FilterQuality.high,
                ),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.teal,
                    Colors.green,
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(imagesProfiles[meIndex]),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(height: size.height / 20),
                    const Text(
                      "Hi 👋, I'm Kokou AGBAVON",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: size.height / 20),
                    RichText(
                      text: const TextSpan(
                        text: "Software engineer, from Togo.",
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text:
                                "\n\nHumanist. Africa future optimist. Child of internet.",
                            style: TextStyle(
                              fontSize: 21,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text:
                                "\n\nReload the page and let the magic happen (I'm funny at parties, I guarantee it)",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height / 15),
                    ...links.map((link) => link.box(size, context)),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 25,
            top: 15,
            child: CircleAvatar(
              child: Text(
                score.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            left: 25,
            top: 15,
            child: Center(
              child: SizedBox(
                width: Responsive.isMobile(context)
                    ? size.width / 3.3
                    : size.width / 11.7,
                child: ElevatedButton(
                  onPressed: () {
                    reload();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        FlutterIcons.magic_wand_sli,
                        color: Colors.white,
                        size: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Reload",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 9,
            bottom: 15,
            child: InkWell(
              onTap: () {
                launch(
                    "https://bienvenuelisis.github.io/news-noir-meilleur-jekyll/10-pays-visites-afrique/");
              },
              child: Text(
                descriptions[bgIndex],
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
