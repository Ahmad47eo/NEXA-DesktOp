# NEXA Desktop

NEXA Desktop is an experimental, Windows 11-inspired iPhone desktop shell. The long-term goal is to investigate whether compatible Windows PC games such as Portal 2 can be run through an integrated runtime.

## Current status

**Build status: green.** GitHub Actions has successfully built both the iOS Simulator app and an unsigned iPhone-device IPA. These are build artifacts, not a signed, ready-to-install app.

The native SwiftUI interface currently includes:
- Desktop-style wallpaper, app icons, taskbar clock, Start menu, and panels.
- A native iOS Files picker.
- A limited UTF-8 text preview for selected files smaller than 256 KB.
- A Game Library panel that clearly marks Portal 2 as unavailable until a runtime is integrated.

## Build artifacts

Open the [latest iOS build workflow](https://github.com/Ahmad47eo/NEXA-DesktOp/actions/workflows/ios-build.yml). Select the newest successful run and download either:
- `NEXADesktop-iPhone-unsigned-IPA` — device-targeted unsigned package for further signing work.
- `NEXADesktop-iOS-Simulator` — simulator-only app bundle.

The unsigned IPA is **not directly installable as-is**. It requires a signing step. No Apple signing credentials or provisioning profile are included in this repository.

## Browser preview

Open [prototype/index.html](prototype/index.html) in a browser. Keep `index.html`, `style.css`, and `app.js` together in `prototype/`.

## Native iOS project

Open [ios/NEXADesktop.xcodeproj](ios/NEXADesktop.xcodeproj) in Xcode on a Mac. See [ios/README.md](ios/README.md) for details. GitHub Actions builds the simulator target and an unsigned iPhone target on each push to `main`.

## Runtime and Portal 2 status

**Portal 2 does not run in NEXA yet.** No Windows emulator/runtime, Wine/FEX/DXMT components, JIT bridge, controller/input pipeline, or game-launch integration is included. Madeira is a separate GPL-3.0-or-later project with a substantial build and dependency stack; its code and licenses must be reviewed before integration. Adding a link to Madeira is not integration, and compatibility with Portal 2 must not be assumed.

- [Madeira source](https://github.com/willfaust/Madeira)
- [Madeira build documentation](https://github.com/willfaust/Madeira/blob/main/docs/BUILDING.md)

NEXA does not bundle copyrighted game files. Use only game files you are legally entitled to use.

## Planned milestones

1. Keep simulator and unsigned device builds green.
2. Complete file preview and desktop-shell interactions.
3. Evaluate runtime architecture, iOS/JIT constraints, memory needs, graphics translation, and upstream licensing.
4. Integrate only after the runtime can be built and linked reproducibly.
5. Add game import, controller/input handling, and compatibility tests.
6. Publish test results and clear device requirements.

## Disclaimer

NEXA Desktop is an independent experimental project and is not affiliated with Microsoft, Valve, or the Madeira project.
