# Villain Crash Clone — Flutter starter

This is a **UI recreation starter** based on screenshots supplied by the user and visual assets extracted from the user-provided APK.

## Included
- Home dashboard, bottom navigation, drawer
- Tools grid, information/rules page
- Local sender-label manager (stores only in app memory)
- Dark navy / cyan visual theme and supplied fonts/images
- GitHub Actions workflow to build a release APK

## Safety and scope
This project recreates the visible layout and benign navigation only. Features represented in the original screenshots that imply remote device access/RAT control, exploit payloads, DDoS, spam, unauthorized targeting, or covert message delivery are **not implemented**. Related cards are replaced with harmless local demo or safety/education screens.

## Build on GitHub from an Android phone
1. Create a GitHub account and a new empty repository.
2. Upload all files and folders from this project ZIP to the repository root (GitHub mobile web can upload files; for easiest folder upload use the GitHub website in desktop mode or the GitHub app plus a browser).
3. Open the repository's **Actions** tab.
4. Select **Build Android APK** and tap **Run workflow** (or push to `main`).
5. Wait for the workflow to finish. Open the successful run, find **Artifacts**, and download `villain-crash-clone-apk`.
6. Extract the downloaded artifact ZIP; install `app-release.apk` on your phone. Android may ask permission to install unknown apps.

## Local build
Requires Flutter SDK and Android SDK:
```bash
flutter pub get
flutter build apk --release
```
APK output: `build/app/outputs/flutter-apk/app-release.apk`

## Notes
- This is a starter clone, not a binary decompilation of the original app.
- User-specific login, server APIs, community services, and remote data are not connected.
