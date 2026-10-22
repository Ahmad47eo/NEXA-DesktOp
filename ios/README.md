# Native iOS project

This folder contains a starter SwiftUI shell and an Xcode project for NEXA Desktop.

## Open in Xcode

On a Mac with Xcode installed, open `NEXADesktop.xcodeproj` and select the `NEXADesktop` scheme. Choose an iOS Simulator destination and build. To install on a physical iPhone, configure your own Apple signing team and provisioning in Xcode. No signing credentials are stored in this repository.

## Build validation

The repository's GitHub Actions workflow attempts an unsigned simulator build on macOS. Check the Actions tab for the actual result; the project has not been locally built or independently verified from this chat.

## Current scope

- SwiftUI root view with a desktop-inspired wallpaper and taskbar
- Start menu that opens and closes
- Basic About, Files, and Game Library panels
- No Windows runtime, game files, JIT integration, or file access yet

The `prototype/` folder is a quick browser preview of the same general interface.
