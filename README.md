# NEXA Desktop

NEXA Desktop is an experimental project exploring a Windows 11-inspired desktop experience on iPhone, with the long-term goal of launching compatible PC games such as Portal 2.

## Current status

🚧 **UI starter created — game runtime not connected.** The repository now includes a browser-based interface preview and starter SwiftUI source files. This is not yet a complete Xcode project, installed iOS app, or working PC-game runtime. Portal 2 has not been tested in a NEXA build.

## Try the interface preview

Open [prototype/index.html](prototype/index.html) in a browser. Keep index.html, style.css, and app.js together in the prototype/ folder. The preview includes a desktop wallpaper, taskbar, Start menu, and example About, Files, and Game Library panels.

## Native iOS starter

See the [ios/ folder](ios/README.md) for the SwiftUI starter files and setup notes. To build an iPhone app, create an iOS App project in Xcode and add the provided Swift files. An Xcode project, signing configuration, and compiled app are not included yet.

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

1. Build and review the desktop interface shell.
2. Create and test a complete native iOS project.
3. Evaluate runtime integration and device requirements.
4. Add input handling and controller support.
5. Test incrementally and publish reproducible results.

## Contributions

Before copying or modifying any upstream code, review its license and retain required copyright notices, license texts, and attributions. Keep upstream components and NEXA-specific code clearly documented.

## Disclaimer

NEXA Desktop is an independent experimental project and is not affiliated with Microsoft, Valve, or the Madeira project.
