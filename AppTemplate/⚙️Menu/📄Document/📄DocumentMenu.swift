
import SwiftUI

struct 📄DocumentMenu: View {
    @EnvironmentObject var 📱:📱AppModel
    
    var body: some View {
        NavigationLink {
            List {
                🏷VersionMenu()
                
                Section {
                    NavigationLink {
                        📋TextView(📄About, "About App")
                            .redacted(reason: .placeholder)
                    } label: {
                        Text(📄About)
                            .font(.subheadline)
                            .lineLimit(4)
                            .padding(8)
                            .redacted(reason: .placeholder)
                    }
                } header: {
                    Text("About")
                }
                
                
                let 🔗 = "https://apps.apple.com/app/id1111"
                Section {
                    Link(destination: URL(string: 🔗)!) {
                        HStack {
                            Label("Open AppStore page", systemImage: "link")
                            
                            Spacer()
                            
                            Image(systemName: "arrow.up.forward.app")
                        }
                    }
                } footer: {
                    Text(🔗)
                }
                
                
                Section {
                    NavigationLink {
                        Text("""
                            2022-AA-AA
                            
                            (English)This application don't collect user infomation.
                            
                            (Japanese)このアプリ自身において、ユーザーの情報を一切収集しません。
                            """)
                        .padding(32)
                        .textSelection(.enabled)
                        .navigationTitle("Privacy Policy")
                    } label: {
                        Label("Privacy Policy", systemImage: "person.text.rectangle")
                    }
                }
                
                
                Section {
                    NavigationLink {
                        💸TextAboutAD()
                            .padding()
                            .navigationTitle("About self-AD")
                            .textSelection(.enabled)
                    } label: {
                        Label("About self-AD", systemImage: "exclamationmark.bubble")
                    }
                }
                
                
                NavigationLink {
                    📓SourceCodeMenu()
                } label: {
                    Label("Source code", systemImage: "doc.plaintext")
                }
            }
            .navigationTitle("App Document")
        } label: {
            Label("App Document", systemImage: "doc")
        }
    }
}


let 📄About = """
                                placeholder
                                placeholder
                                placeholder
"""
