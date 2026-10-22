# Native iOS project

This folder contains the SwiftUI app shell and Xcode project for NEXA Desktop.

## Build validation

The GitHub Actions workflow builds:
- An unsigned iOS Simulator app bundle.
- An unsigned app for the physical iPhone target, packaged as an IPA.

The workflow has passed on the latest recorded build. Download artifacts from the [GitHub Actions runs](https://github.com/Ahmad47eo/NEXA-DesktOp/actions/workflows/ios-build.yml).

## Install/signing caveat

The generated IPA is **unsigned** and cannot be installed directly as-is. To use it on a physical iPhone, it must be signed with an Apple development identity and a matching provisioning profile, or imported into a supported sideloading/signing workflow. Signing credentials are intentionally not stored in the repository.

## Current features

- Desktop-style wallpaper, icons, taskbar clock, Start menu, and app panels.
- Native document picker for user-selected files.
- Limited UTF-8 text preview for files smaller than 256 KB; this is not a full file manager.
- Game Library panel that reports Portal 2 as not launchable and links to runtime research.

## Not implemented

- Windows compatibility runtime or integration with Madeira/FEX/Wine/DXMT.
- JIT setup/management.
- Actual game launching, Steam integration, controller mapping, or game-specific compatibility.
- A signed IPA or App Store distribution.

Portal 2 has not been run inside NEXA. Runtime integration is a separate engineering project, not a UI-only change.
