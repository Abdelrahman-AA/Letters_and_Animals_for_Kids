# Letters and Animals for Kids (Android APP)

**Letters and Animals for Kids** is an educational app designed to help children learn how to correctly pronounce letters and animal names in Arabic and the Egyptian dialect. The app features an engaging interface specially designed for children, along with voiceovers that assist in improving their pronunciation.

## Demo

You can watch the demo video of the app on YouTube:

[![Watch the demo video](https://img.youtube.com/vi/O4S1y2h3nmE/0.jpg)](https://www.youtube.com/watch?v=O4S1y2h3nmE)

## Download the App

### You can download the app from the Google Play Store by clicking on the link below:

[Download Letters and Animals for Kids on Google Play](https://play.google.com/store/apps/details?id=com.arca.animals_v3)

### 📦 Download the APK

If you'd like to try the app directly without using the Google Play Store, you can download the APK file and install it manually on your Android device from the link below:

🔗 [Download APK](https://github.com/Abdelrahman-AA/Letters_and_Animals_for_Kids/releases/latest/download/Letters_and_Animals_for_Kids.apk)

> ⚠️ **Note:** Make sure to enable "Install from unknown sources" in your device settings before installing the APK.



## Key Features

- **Letter Learning**: Helps children learn the Arabic alphabet.
- **Animal Names Learning**: Displays pictures and names of animals with pronunciation in Arabic and the Egyptian dialect.
- **Child-Friendly Interface**: Simple and attractive design for young children.
- **Voiceover**: Contributed voiceovers in the Egyptian dialect to aid in learning.

## Technologies Used

- **Programming Language**: Dart
- **Framework**: Flutter
- **Ads**: Google Mobile Ads (Banner Ads)
- **Audio**: Using packages like `assets_audio_player` to play sounds.

## Installation Instructions

To install and run the app on your device, follow these steps:

1. **Clone the Repository**:
   Download the code from the GitHub repository using the following command:

   ```bash
   git clone https://github.com/yourusername/letters_and_animals_for_kids.git
   ```

2. **Install Dependencies**:
   Navigate to the project folder and install dependencies by running:

   ```bash
   flutter pub get
   ```

3. **Run the App**:
   To run the app on a simulator or a physical device:

   ```bash
   flutter run
   ```

## Publishing the App on Google Play

1. **Prepare the App**:
   Before uploading your app to the Google Play Store, ensure you have set up a keystore file for signing the app. You can create one using the following command:

   ```bash
   keytool -genkey -v -keystore release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias release
   ```

   Then, update the `build.gradle` file in the `android/app` directory to enable signing.

2. **Build the Release Version**:
   Use the following command to build the APK or AAB ready for uploading:

   ```bash
   flutter build apk --release
   # Or
   flutter build appbundle --release
   ```

3. **Upload to Google Play**:
   - Go to [Google Play Console](https://play.google.com/console).
   - Log in to your account and click on "Create a new application".
   - Follow the instructions to add the app description, upload the icon, and upload the APK or AAB file.

## Adding Ads to the App

Google Ads have been added to the app using the `google_mobile_ads` package to display banner ads at the bottom of the screen.

### Enabling Ads:

1. **Add Google Mobile Ads Library**:
   Add the following package to your `pubspec.yaml`:

   ```yaml
   dependencies:
     google_mobile_ads: ^2.3.0
   ```

2. **Initialize the Ads in the App**:
   In the code, initialize the banner ad with your AdMob ad unit ID:

   ```dart
   late BannerAd bannerAd;

   void _createBannerAd() {
     bannerAd = BannerAd(
       size: AdSize.banner,
       adUnitId: 'your-admob-ad-unit-id',
       listener: BannerAdListener(
         onAdLoaded: (ad) {
           setState(() {
             _isAdReady = true;
           });
         },
         onAdFailedToLoad: (ad, error) {
           print('Ad failed to load: ${error.message}');
         },
       ),
       request: AdRequest(),
     );
     bannerAd.load();
   }
   ```

3. **Display the Ads**:
   Once the ad is loaded, it is displayed within the app's interface using `AdWidget`.

## Customization

- You can customize the images and sounds in the app by modifying the following directories:
  - `assets/images/` - for the images used in the app's interface.
  - `assets/audio/` - for storing audio files.

## Contributing

If you have improvements or additions you would like to contribute, please submit a pull request via GitHub. We welcome community contributions.

## License

The app is licensed under the [reative Commons Attribution-NonCommercial 4.0 International License](https://creativecommons.org/licenses/by-nc/4.0/).
