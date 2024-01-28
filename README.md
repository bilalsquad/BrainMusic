# BrainMusic

## Description

BrainMusic est une application mobile développée avec Flutter, visant à deviner la culture d'un utilisateur basée sur ses goûts musicaux. Grâce à son interface intuitive et à une base de données riche en genres musicaux, BrainMusic promet une expérience utilisateur unique et engageante.

## Caractéristiques

- **Détection de la culture musicale :** Analyse des préférences musicales pour prédire la culture de l'utilisateur.
- **Bibliothèque musicale étendue :** Large éventail de genres musicaux du monde entier.
- **Interface utilisateur intuitive :** Facile à naviguer et à utiliser.

## Spécifications Implémentées

| Spécification                                                             | Implémenté |
| ------------------------------------------------------------------------- | :--------: |
| Connexion                                                                 |    [x]     |
| Inscription                                                               |    [x]     |
| Modification des données du profil                                        |    [x]     |
| Lancement de la musique                                                   |    [x]     |
| Activation du bluetooth                                                   |    [x]     |
| Connexion automatique au casque                                           |    [x]     |
| Formulaire qui récupère les données de l'utilisateur (âge, culture, etc.) |    [x]     |
| Affichage des différents graphes EEG avec la session correspondante       |    [x]     |
| Récuperation des données EEG dans l'application                           |    [ ]     |

## Installation et Exécution

Pour installer et exécuter BrainMusic, suivez ces étapes :

1. **Clonez le dépôt :**
   ```bash
   git clone https://github.com/[VotreUsername]/brainmusic.git
   ```
2. **Naviguez vers le dossier du projet :**
   ```bash
   cd brainmusic
   ```
3. **Installez les dépendances :**
   ```bash
   flutter pub get
   ```
4. **Exécutez l'application :**
   ```bash
   flutter run
   ```
   Cette commande démarrera l'application dans un mode de développement. Assurez-vous d'avoir un émulateur en cours d'exécution ou un appareil connecté pour visualiser l'application.

## Installation sur Simulator ou sur Iphone physique

### Prérequis

- **Xcode:** Assurez-vous d'avoir Xcode installé sur votre Mac pour développer pour iOS.
- **Compte développeur Apple:** Nécessaire pour exécuter l'application sur un iPhone physique.
- **CocoaPods:** BrainMusic peut nécessiter CocoaPods pour gérer les dépendances iOS. Installez-le avec `sudo gem install cocoapods`.

### Configuration pour iPhone ou Simulateur iOS

Lien d'une vidéo pour expliquer comment tester l'application sur son Iphone : https://www.youtube.com/watch?v=aPjF5-9aFc4&t=538s

#### 1. Préparez votre environnement

- **Simulateur iOS:** Lancez-le via Xcode.
- **iPhone physique:** Connectez-le à votre Mac avec un câble.

#### 2. Accédez à votre projet

Ouvrez le terminal et naviguez vers votre dossier de projet :

```bash
cd chemin_vers/brainmusic
```

#### 3. Installez CocoaPods (si nécessaire)

```bash
cd ios
pod install
cd ..
```

#### 4. Ouvrez Xcode

Ouvrez le fichier `Runner.xcworkspace` dans le dossier `ios` de votre projet Flutter.

#### 5. Configurez Xcode

- Configurez votre identifiant de développeur Apple dans Xcode.
- Sélectionnez votre appareil cible dans Xcode (iPhone ou simulateur).

#### 6. Exécutez l'application

Retournez à la racine du dossier du projet et exécutez :

```bash
flutter run
```

### Dépannage courant

- **Problèmes de profil de provisionnement:** Vérifiez votre configuration dans Xcode.
- **Erreurs de compilation:** Utilisez `flutter clean` et `flutter pub get` pour nettoyer et réinstaller les dépendances.

## Technologies Utilisées

- **Flutter :** Pour le développement multiplateforme.

## Contribution

Les contributions sont les bienvenues. Pour contribuer :

1. Fork le projet
2. Créez votre branche de fonctionnalités (`git checkout -b feature/AmazingFeature`)
3. Commit vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request

## Licence

Distribué sous la licence MIT. Voir `LICENSE` pour plus d'informations.
