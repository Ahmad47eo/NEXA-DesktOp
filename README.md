# NEXA Desktop

NEXA Desktop is an experimental project exploring a Windows 11-inspired desktop experience on iPhone, with the long-term goal of launching compatible PC games such as Portal 2.

## Current status

🚧 **Native Xcode project added — build not yet verified.** The repository includes a browser-based interface preview, SwiftUI source, an Xcode project and shared scheme, plus a GitHub Actions workflow that attempts an unsigned iOS Simulator build. Portal 2 has not been tested in a NEXA build, and the game runtime is not connected.

## Try the interface preview

Open [prototype/index.html](prototype/index.html) in a browser. Keep index.html, style.css, and app.js together in the prototype/ folder. The preview includes a desktop wallpaper, taskbar, Start menu, and example About, Files, and Game Library panels.

## Native iOS project

Open [ios/NEXADesktop.xcodeproj](ios/NEXADesktop.xcodeproj) in Xcode on a Mac. See [ios/README.md](ios/README.md) for details. The GitHub Actions workflow in [.github/workflows/ios-build.yml](.github/workflows/ios-build.yml) runs a simulator build check on pushes and pull requests. A successful simulator build would not automatically produce an installable signed app for your iPhone.

## Goals

- Build a standalone iOS app with a desktop-inspired interface.
- Investigate an on-device runtime path for compatible Windows games.
- Explore open-source components such as [Madeira](https://github.com/willfaust/Madeira) where technically and legally appropriate.
- Preserve upstream attribution and comply with every dependency's license.
- Document device compatibility, setup, limitations, and testing honestly.

## Important notes

- The interface prototype is not Windows and cannot run PC games.
- Compatibility and performance will vary by device, iOS version, runtime, graphics translation, and game.
- Just because a game runs in another project does not guarantee it will run here.
- This project does not include game files. Use game files you are legally entitled to use.
- JIT and installation methods may have platform-specific requirements.

## Planned milestones

1. Validate the Xcode project with the simulator build workflow.
2. Improve the native desktop interface.
3. Evaluate runtime integration and device requirements.
4. Add input handling and controller support.
5. Test incrementally and publish reproducible results.

## Contributions

Before copying or modifying any upstream code, review its license and retain required copyright notices, license texts, and attributions. Keep upstream components and NEXA-specific code clearly documented.

## Disclaimer

NEXA Desktop is an independent experimental project and is not affiliated with Microsoft, Valve, or the Madeira project.
