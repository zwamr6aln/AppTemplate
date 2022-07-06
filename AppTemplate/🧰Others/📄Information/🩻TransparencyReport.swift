// ⚠️ Work in progress ⚠️

import SwiftUI

struct 🩻TransparencyReportLink: View {
    var body: some View {
        Section {
            NavigationLink {
                🩻TransparencyReportMenu()
            } label: {
                Label("Transparency Report", systemImage: "questionmark.app.dashed")
            }
        } header: {
            Text("🩻TransparencyReport")
        }
    }
}


struct 🩻TransparencyReportMenu: View {
    var body: some View {
        List {
            NavigationLink {
                📓SourceCodeMenu()
            } label: {
                Label("Source code", systemImage: "doc.plaintext")
            }
            
            NavigationLink {
                🧑‍💻AboutDeveloperPublisher()
            } label: {
                Label("Developer / Publisher", systemImage: "person")
            }
            
//            NavigationLink {
//                📃AboutAppStoreRelease()
//            } label: {
//                Label("AppStore Release", systemImage: "a.square")
//            }
        }
        .navigationTitle("Transparency Report")
    }
}


struct 🧑‍💻AboutDeveloperPublisher: View {
    var body: some View {
        List {
            Section {
                Text("Individual")
            } header: {
                Text("The System")
            }
            
            
            Section {
                Text("山下 亮")
                
                Text("やました りょう (ひらがな)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text("Yamashita Ryo (alphabet)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            } header: {
                Text("Name")
            } footer: {
                Text("only one person")
            }
            
            
            Section {
                HStack {
                    Text("age")
                    Spacer()
                    Text("about 28")
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Text("country")
                    Spacer()
                    Text("Japan")
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Text("native language")
                    Spacer()
                    Text("Japanese")
                        .foregroundStyle(.secondary)
                }
                
//                HStack {
//                    Text("income")
//                    Spacer()
//                    Text("almost nothing")
//                        .foregroundStyle(.secondary)
//                }
            } header: {
                Text("identity / circumstance / background")
            } footer: {
                Text("As of 2021")
            }
            
            
            📆TimelineSection()
            
            
            Section {
                Image("Developer_Publisher")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding()
                    .opacity(0.5)
            } header: {
                Text("Image")
            } footer: {
                Text("Taken on 2021-11")
            }
        }
        .navigationTitle("Developer / Publisher")
    }
}


struct 📆TimelineSection: View {
    var 📃Text: [[String]] = 📆TimelineText
    
    var body: some View {
        Section {
        ForEach(📃Text, id: \.self) { 📃 in
            HStack {
                Text(📃.first ?? "🐛")
                    .font(.caption2)
                    .padding(8)
                Text(📃.last ?? "🐛")
                    .font(.caption)
            }
        }
        } header: {
            Text("Timeline")
        }
    }
}

let 📆TimelineText: [[String]] =
[["2013-04","岡山県の高校から沖縄県の琉球大学工学部情報工学科へ進学。"],
 ["2018-06","大学学部生として最終学年。卒業研究にて「FlipByBlink」の元となるアプリ開発を行う。"],
 ["2019-01","特殊なまばたきでページめくりができる電子書籍リーダーアプリ「FlipByBlink」をver1.0としてAppStoreにリリース。"],
 ["2019-03","琉球大学を卒業。"],
 ["2019-05","時間をかけて徐々に音が大きくなるアラームアプリ「FadeInAlarm」ver1.0をリリース。初めてとなる有料アプリ。"],
 ["2019-07","岡山に移住。"],
 ["2021-12","FlipByBlink、ver2.0以来 約3年ぶりとなるver3.0をリリース。"],
 ["2022-02","FadeInAlarm、ver1.0以来 約3年ぶりとなるver2.0をリリース。"],
 ["2022-04","シンプルな将棋盤アプリ「Plain将棋盤」ver1.0をリリース。"],
 ["2022-05","体重登録アプリ「TapWeight」ver1.0をリリース。"],
 ["2022-06","体温登録アプリ「TapTemperature」ver1.0をリリース。"],
 ["2022-06","TapWeight、有料課金モデルを初めて採用したver1.1.1をリリース。"]]
//["2022-0",""],







struct 📃AboutAppStoreRelease: View { //TODO: 再検討
    var body: some View {
        List {
            Section {
                Text("4+")
            } header: {
                Text("Age rating")
            }

            Section {
                Text("It is distributed to all (175) available countries or regions. It will also be automatically published to any new countries or regions that become available for distribution on AppStore.")
                    .padding()
            } header: {
                Text("Availability")
            }

            Section {
                Text("placeholder") // "enable", "disable"
                    .redacted(reason: .placeholder)
            } header: {
                Text("Compatibility with Apple Silicon mac")
            }
        }
        .navigationTitle("AppStore Release")
    }
}
