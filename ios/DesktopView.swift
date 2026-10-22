import SwiftUI

private enum NEXAStyle {
    static let ink = Color(red: 0.035, green: 0.075, blue: 0.15)
    static let panel = Color(red: 0.055, green: 0.105, blue: 0.19).opacity(0.92)
    static let muted = Color(red: 0.73, green: 0.80, blue: 0.91)
    static let blue = Color(red: 0.48, green: 0.72, blue: 1.0)
}

private enum DesktopApp: String, CaseIterable, Identifiable {
    case about = "About NEXA"
    case files = "Files"
    case games = "Game Library"

    var id: String { rawValue }

    var symbol: String {
        switch self {
        case .about: return "sparkle"
        case .files: return "folder.fill"
        case .games: return "gamecontroller.fill"
        }
    }

    var description: String {
        switch self {
        case .about:
            return "NEXA Desktop is an experimental desktop-inspired interface for iPhone. Runtime support is not connected yet."
        case .files:
            return "File access is not implemented. A future version should use Apple's document picker so you choose what the app can access."
        case .games:
            return "No games can be launched yet. Runtime compatibility, graphics translation, JIT requirements, and controls still need investigation."
        }
    }
}

struct DesktopView: View {
    @State private var startMenuVisible = false
    @State private var selectedApp: DesktopApp?

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                wallpaper
                VStack(alignment: .leading, spacing: 24) {
                    HStack(spacing: 12) {
                        logo(size: 44)
                        VStack(alignment: .leading, spacing: 3) {
                            Text("NEXA Desktop").font(.headline)
                            Text("Interface preview · Runtime not connected")
                                .font(.caption2).foregroundStyle(NEXAStyle.muted)
                        }
                    }
                    .padding(12)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 17))

                    VStack(alignment: .leading, spacing: 18) {
                        ForEach(DesktopApp.allCases) { app in
                            Button {
                                selectedApp = app
                                startMenuVisible = false
                            } label: {
                                VStack(spacing: 7) {
                                    appIcon(app)
                                    Text(app.rawValue).font(.caption2)
                                }
                                .frame(width: 92)
                                .padding(6)
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    Spacer(minLength: 0)
                }
                .padding(.horizontal, 18)
                .padding(.top, 24)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

                if let app = selectedApp {
                    appPanel(app)
                        .padding(16)
                        .transition(.opacity.combined(with: .scale(scale: 0.97)))
                }

                if startMenuVisible {
                    VStack(spacing: 16) {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Text("Search apps and features")
                            Spacer()
                        }
                        .foregroundStyle(NEXAStyle.muted)
                        .padding(12)
                        .background(.white.opacity(0.06), in: RoundedRectangle(cornerRadius: 12))

                        Text("Pinned").font(.headline).frame(maxWidth: .infinity, alignment: .leading)
                        HStack(spacing: 8) {
                            ForEach(DesktopApp.allCases) { app in
                                Button {
                                    selectedApp = app
                                    startMenuVisible = false
                                } label: {
                                    VStack(spacing: 8) {
                                        appIcon(app)
                                        Text(app.rawValue).font(.caption2).multilineTextAlignment(.center)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        Text("Prototype only — no game runtime installed.")
                            .font(.caption).foregroundStyle(NEXAStyle.muted)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(18)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 22))
                    .overlay(RoundedRectangle(cornerRadius: 22).stroke(.white.opacity(0.14)))
                    .padding(.horizontal, 14)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom, 86)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }

                VStack {
                    Spacer()
                    HStack(spacing: 10) {
                        Button {
                            withAnimation(.easeOut(duration: 0.18)) {
                                startMenuVisible.toggle()
                                selectedApp = nil
                            }
                        } label: {
                            logo(size: 30)
                        }
                        .accessibilityLabel("Toggle Start menu")

                        Button {
                            withAnimation(.easeOut(duration: 0.18)) {
                                startMenuVisible = true
                                selectedApp = nil
                            }
                        } label: {
                            Label("Search", systemImage: "magnifyingglass")
                                .font(.subheadline)
                                .foregroundStyle(NEXAStyle.muted)
                                .padding(.horizontal, 12)
                                .frame(height: 40)
                                .background(.white.opacity(0.06), in: RoundedRectangle(cornerRadius: 11))
                        }
                        Spacer()
                        Text(Date.now, format: .dateTime.hour().minute())
                            .font(.caption.monospacedDigit())
                    }
                    .padding(9)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18))
                    .overlay(RoundedRectangle(cornerRadius: 18).stroke(.white.opacity(0.15)))
                    .padding(.horizontal, 10)
                    .padding(.bottom, max(8, geometry.safeAreaInsets.bottom == 0 ? 8 : 4))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .animation(.easeOut(duration: 0.18), value: startMenuVisible)
            .animation(.easeOut(duration: 0.18), value: selectedApp)
        }
        .ignoresSafeArea()
        .preferredColorScheme(.dark)
    }

    private var wallpaper: some View {
        ZStack {
            LinearGradient(
                colors: [NEXAStyle.ink, Color(red: 0.07, green: 0.17, blue: 0.32), Color(red: 0.035, green: 0.07, blue: 0.16)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            Circle()
                .fill(NEXAStyle.blue.opacity(0.18))
                .frame(width: 330, height: 330)
                .blur(radius: 65)
                .offset(x: 100, y: 70)
            Circle()
                .stroke(.white.opacity(0.07), lineWidth: 1)
                .frame(width: 330, height: 330)
                .overlay(Circle().stroke(.white.opacity(0.035), lineWidth: 24).padding(-35))
                .offset(x: 55, y: 65)
        }
        .ignoresSafeArea()
    }

    private func logo(size: CGFloat) -> some View {
        Text("N")
            .font(.system(size: size * 0.52, weight: .heavy, design: .rounded))
            .foregroundStyle(Color(red: 0.035, green: 0.10, blue: 0.22))
            .frame(width: size, height: size)
            .background(
                LinearGradient(colors: [.white, NEXAStyle.blue], startPoint: .topLeading, endPoint: .bottomTrailing),
                in: RoundedRectangle(cornerRadius: size * 0.29)
            )
    }

    private func appIcon(_ app: DesktopApp) -> some View {
        Image(systemName: app.symbol)
            .font(.system(size: 21, weight: .semibold))
            .foregroundStyle(app == .about ? .blue : (app == .files ? .yellow : .mint))
            .frame(width: 44, height: 44)
            .background(.white.opacity(0.10), in: RoundedRectangle(cornerRadius: 13))
    }

    private func appPanel(_ app: DesktopApp) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Image(systemName: app.symbol)
                Text(app.rawValue).font(.headline)
                Spacer()
                Button {
                    selectedApp = nil
                } label: {
                    Image(systemName: "xmark")
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 8))
                }
                .accessibilityLabel("Close window")
            }
            Divider().overlay(.white.opacity(0.12))
            Text(app.description)
                .font(.subheadline)
                .foregroundStyle(NEXAStyle.muted)
                .fixedSize(horizontal: false, vertical: true)
            Text("EARLY PROTOTYPE")
                .font(.caption2.weight(.bold))
                .tracking(1)
                .foregroundStyle(.orange)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(.orange.opacity(0.12), in: Capsule())
        }
        .padding(18)
        .frame(maxWidth: 480, alignment: .leading)
        .background(NEXAStyle.panel, in: RoundedRectangle(cornerRadius: 18))
        .overlay(RoundedRectangle(cornerRadius: 18).stroke(.white.opacity(0.16)))
        .shadow(color: .black.opacity(0.35), radius: 28, y: 12)
    }
}