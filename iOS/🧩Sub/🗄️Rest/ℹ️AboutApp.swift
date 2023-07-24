import SwiftUI

struct ℹ️AboutAppLink: View {
    var body: some View {
        Section {
            🖼️IconAndName()
            🔗AppStoreLink()
            NavigationLink(destination: ℹ️AboutAppMenu()) {
                Label(String(localized: "About App", table: "AboutApp"),
                      systemImage: "doc")
            }
        }
    }
}

struct ℹ️AboutAppMenu: View {
    var withSidebarLayout: Bool = false
    var body: some View {
        List {
            if self.withSidebarLayout { 🖼️IconAndName() }
            📰AppStoreDescriptionSection()
            📜VersionHistoryLink()
            👤PrivacyPolicySection()
            🏬AppStoreSection()
            📓SourceCodeLink()
            🧑‍💻AboutDeveloperPublisherLink()
        }
        .navigationTitle(Text("About App", tableName: "AboutApp"))
    }
}

private struct 🖼️IconAndName: View {
    var body: some View {
        GeometryReader { 📐 in
            VStack(spacing: 8) {
                Image(.roundedIcon)
                    .resizable()
                    .frame(width: 100, height: 100)
                VStack(spacing: 6) {
                    Text(🗒️StaticInfo.appName)
                        .font(.system(.headline, design: .rounded))
                        .tracking(1.5)
                        .opacity(0.75)
                    Text(🗒️StaticInfo.appSubTitle)
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                }
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            }
            .padding(20)
            .frame(width: 📐.size.width)
        }
        .frame(height: 200)
    }
}

private struct 📰AppStoreDescriptionSection: View {
    var body: some View {
        Section {
            NavigationLink {
                ScrollView {
                    Text("AppStoreDescription", tableName: "🌏AppStoreDescription")
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .navigationBarTitle(Text("Description", tableName: "AboutApp"))
                .textSelection(.enabled)
            } label: {
                Text(self.textWithoutEmptyLines)
                    .font(.subheadline)
                    .lineSpacing(5)
                    .lineLimit(7)
                    .padding(8)
                    .accessibilityLabel(Text("Description", tableName: "AboutApp"))
            }
        } header: {
            Text("Description", tableName: "AboutApp")
        }
    }
    private var textWithoutEmptyLines: String {
        String(localized: "AppStoreDescription", table: "🌏AppStoreDescription")
            .replacingOccurrences(of: "\n\n", with: "\n")
            .replacingOccurrences(of: "\n\n", with: "\n")
    }
}

private struct 🔗AppStoreLink: View {
    @Environment(\.openURL) var openURL
    var body: some View {
        Button {
            self.openURL(🗒️StaticInfo.appStoreProductURL)
        } label: {
            HStack {
                Label(String(localized: "Open AppStore page", table: "AboutApp"),
                      systemImage: "link")
                Spacer()
                Image(systemName: "arrow.up.forward.app")
                    .font(.body.weight(.light))
                    .imageScale(.small)
            }
        }
    }
}

private struct 🏬AppStoreSection: View {
    @Environment(\.openURL) var openURL
    var body: some View {
        Section {
            🔗AppStoreLink()
            Button {
                self.openURL(🗒️StaticInfo.appStoreUserReviewURL)
            } label: {
                HStack {
                    Label(String(localized: "Review on AppStore", table: "AboutApp"),
                          systemImage: "star.bubble")
                    Spacer()
                    Image(systemName: "arrow.up.forward.app")
                        .imageScale(.small)
                        .foregroundStyle(.secondary)
                }
            }
        } footer: {
            Text("\(🗒️StaticInfo.appStoreProductURL)")
        }
    }
}

private struct 👤PrivacyPolicySection: View {
    var body: some View {
        Section {
            NavigationLink {
                ScrollView {
                    Text(🗒️StaticInfo.privacyPolicyDescription)
                        .padding(24)
                        .textSelection(.enabled)
                        .frame(maxWidth: .infinity)
                }
                .navigationTitle(Text("Privacy Policy", tableName: "AboutApp"))
            } label: {
                Label(String(localized: "Privacy Policy", table: "AboutApp"),
                      systemImage: "person.text.rectangle")
            }
        }
    }
}

private struct 📜VersionHistoryLink: View {
    var body: some View {
        Section {
            NavigationLink {
                List {
                    ForEach(🗒️StaticInfo.versionInfos, id: \.version) { ⓘnfo in
                        Section {
                            Text(LocalizedStringKey(ⓘnfo.version), tableName: "🌏VersionDescription")
                                .font(.subheadline)
                                .padding()
                                .textSelection(.enabled)
                        } header: {
                            Text(ⓘnfo.version)
                        } footer: {
                            if 🗒️StaticInfo.versionInfos.first?.version == ⓘnfo.version {
                                Text("builded on \(ⓘnfo.date)", tableName: "AboutApp")
                            } else {
                                Text("released on \(ⓘnfo.date)", tableName: "AboutApp")
                            }
                        }
                        .headerProminence(.increased)
                    }
                }
                .navigationBarTitle(Text("Version History", tableName: "AboutApp"))
            } label: {
                Label(String(localized: "Version", table: "AboutApp"),
                      systemImage: "signpost.left")
                .badge(🗒️StaticInfo.versionInfos.first?.version ?? "🐛")
            }
            .accessibilityLabel(Text("Version History", tableName: "AboutApp"))
        }
    }
}

private struct 📓SourceCodeLink: View {
    var body: some View {
        NavigationLink {
            List {
                ForEach(🗒️StaticInfo.SourceCodeCategory.allCases) { Self.CodeSection($0) }
                self.bundleMainInfoDictionary()
                self.repositoryLinks()
            }
            .navigationTitle(Text("Source code", tableName: "AboutApp"))
        } label: {
            Label(String(localized: "Source code", table: "AboutApp"),
                  systemImage: "doc.plaintext")
        }
    }
    private struct CodeSection: View {
        private var category: 🗒️StaticInfo.SourceCodeCategory
        private var url: URL {
#if targetEnvironment(macCatalyst)
            Bundle.main.bundleURL.appendingPathComponent("Contents/Resources/📁SourceCode")
#else
            Bundle.main.bundleURL.appendingPathComponent("📁SourceCode")
#endif
        }
        var body: some View {
            Section {
                ForEach(self.category.fileNames, id: \.self) { ⓕileName in
                    if let ⓒode = try? String(contentsOf: self.url.appendingPathComponent(ⓕileName)) {
                        NavigationLink(ⓕileName) { self.sourceCodeView(ⓒode, ⓕileName) }
                    } else {
                        Text(verbatim: "🐛")
                    }
                }
                if self.category.fileNames.isEmpty { Text(verbatim: "🐛") }
            } header: {
                Text(self.category.rawValue)
                    .textCase(.none)
            }
        }
        init(_ category: 🗒️StaticInfo.SourceCodeCategory) {
            self.category = category
        }
        private func sourceCodeView(_ ⓣext: String, _ ⓣitle: String) -> some View {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    Text(ⓣext)
                        .padding()
                }
            }
            .navigationBarTitle(LocalizedStringKey(ⓣitle))
            .font(.caption.monospaced())
            .textSelection(.enabled)
        }
    }
    private func bundleMainInfoDictionary() -> some View {
        Section {
            NavigationLink("Bundle.main.infoDictionary") {
                ScrollView {
                    Text(Bundle.main.infoDictionary!.description)
                        .padding()
                }
                .navigationBarTitle("Bundle.main.infoDictionary")
                .textSelection(.enabled)
            }
        }
    }
    private func repositoryLinks() -> some View {
        Group {
            Section {
                Link(destination: 🗒️StaticInfo.webRepositoryURL) {
                    HStack {
                        Label(String(localized: "Web Repository", table: "AboutApp"),
                              systemImage: "link")
                        Spacer()
                        Image(systemName: "arrow.up.forward.app")
                            .imageScale(.small)
                            .foregroundStyle(.secondary)
                    }
                }
            } footer: {
                Text("\(🗒️StaticInfo.webRepositoryURL)")
            }
            Section {
                Link(destination: 🗒️StaticInfo.webMirrorRepositoryURL) {
                    HStack {
                        Label(String(localized: "Web Repository", table: "AboutApp"),
                              systemImage: "link")
                        Text("(Mirror)", tableName: "AboutApp")
                            .font(.subheadline.bold())
                            .foregroundStyle(.secondary)
                        Spacer()
                        Image(systemName: "arrow.up.forward.app")
                            .imageScale(.small)
                            .foregroundStyle(.secondary)
                    }
                }
            } footer: {
                Text("\(🗒️StaticInfo.webMirrorRepositoryURL)")
            }
        }
    }
}

private struct 🧑‍💻AboutDeveloperPublisherLink: View {
    var body: some View {
        NavigationLink {
            List {
                Section {
                    Text("Individual", tableName: "AboutApp")
                } header: {
                    Text("The System", tableName: "AboutApp")
                }
                Section {
                    Text(verbatim: "山下 亮")
                    Text(verbatim: "やました りょう (ひらがな)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text(verbatim: "Yamashita Ryo (alphabet)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                } header: {
                    Text("Name", tableName: "AboutApp")
                } footer: {
                    Text("only one person", tableName: "AboutApp")
                }
                Section {
                    Text("age", tableName: "AboutApp")
                        .badge(Text("about 28", tableName: "AboutApp"))
                    Text("country", tableName: "AboutApp")
                        .badge(Text("Japan", tableName: "AboutApp"))
                    Text("native language", tableName: "AboutApp")
                        .badge(Text("Japanese", tableName: "AboutApp"))
                } header: {
                    Text("identity / circumstance / background", tableName: "AboutApp")
                } footer: {
                    Text("As of 2021", tableName: "AboutApp")
                }
                Self.TimelineSection()
                Section {
                    Image(.developerPublisher)
                        .resizable()
                        .frame(width: 90, height: 90)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding()
                        .opacity(0.6)
                } header: {
                    Text("Image", tableName: "AboutApp")
                } footer: {
                    Text("Taken on 2021-11", tableName: "AboutApp")
                }
            }
            .navigationTitle(Text("Developer / Publisher", tableName: "AboutApp"))
        } label: {
            Label(String(localized: "Developer / Publisher", table: "AboutApp"),
                  systemImage: "person")
        }
    }
    private struct TimelineSection: View {
        private static var values: [(date: String, description: String)] {
            [("2013-04", "Finished from high school in Okayama Prefecture. Entranced into University-of-the-Ryukyus/faculty-of-engineering in Okinawa Prefecture."),
             ("2018-06", "Final year as an undergraduate student. Developed an iOS application(FlipByBlink) as software for the purpose of research experiments."),
             ("2019-01", "Released ebook reader app \"FlipByBlink\" ver 1.0 on AppStore. Special feature is to turn a page by slightly-longish-voluntary-blink."),
             ("2019-03", "Graduated from University-of-the-Ryukyus."),
             ("2019-05", "Released alarm clock app with taking a long time \"FadeInAlarm\" ver 1.0. First paid app."),
             ("2019-07", "Migrated to Okayama Prefecture."),
             ("2021-12", "Released FlipByBlink ver 3.0 for the first time in three years since ver 2.0."),
             ("2022-02", "Released FadeInAlarm ver 2.0 for the first time in three years since ver 1.0."),
             ("2022-04", "Released simple shogi board app \"PlainShogiBoard\" ver 1.0."),
             ("2022-05", "Released body weight registration app \"TapWeight\" ver 1.0."),
             ("2022-06", "Released body temperature registration app \"TapTemperature\" ver 1.0."),
             ("2022-06", "Adopted In-App Purchase model for the first time on TapWeight ver 1.1.1"),
             ("2022-09", "Released LockInNote and MemorizeWidget on iOS16 release occasion.")]
        }
        var body: some View {
            Section {
                ForEach(Self.values, id: \.self.description) { ⓥalue in
                    HStack {
                        Text(ⓥalue.date)
                            .font(.caption2)
                            .padding(8)
                        Text(LocalizedStringKey(ⓥalue.description), tableName: "AboutApp")
                            .font(.caption)
                    }
                }
            } header: {
                Text("Timeline", tableName: "AboutApp")
            }
        }
    }
}
