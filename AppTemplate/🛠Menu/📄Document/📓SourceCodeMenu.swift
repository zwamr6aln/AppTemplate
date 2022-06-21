
import SwiftUI

enum 📁SourceFolder: String, CaseIterable, Identifiable {
    case main
    case 🧩Sub
    case 🛠Menu
    case 📄Document
    case 🏬InAppPurchase
    case 💸AD
    
    var id: String { self.rawValue }
}


struct 📓SourceCodeMenu: View {
    var body: some View {
        List {
            ForEach(📁SourceFolder.allCases) { 📁 in
                📰CodeSection(📁.rawValue)
            }
            
            📑BundleMainInfoDictionary()
            
            🔗RepositoryLink()
        }
        .navigationTitle("Source code")
    }
}


struct 📰CodeSection: View {
    var 🄳irectoryPath: String
    
    var 📁URL: URL {
        Bundle.main.bundleURL.appendingPathComponent(🄳irectoryPath)
    }
    
    var 🏷FileName: [String] {
        do {
            return try FileManager.default.contentsOfDirectory(atPath: 📁URL.path)
        } catch {
            return []
        }
    }
    
    var body: some View {
        Section {
            ForEach(🏷FileName, id: \.self) { 🏷 in
                NavigationLink(🏷) {
                    let 📍 = 📁URL.appendingPathComponent(🏷)
                    📋TextView(try! String(contentsOf: 📍), 🏷, ⓗorizonScroll: true)
                }
            }
            
            if 🏷FileName.isEmpty {
                Text("🐛Bug")
            }
        } header: {
            Text(🄳irectoryPath)
                .textCase(.none)
        }
    }
    
    init(_ ⓓirectoryPath: String) {
        🄳irectoryPath = ⓓirectoryPath
    }
}


let 🄱undleMainInfoDictionary = Bundle.main.infoDictionary!.description
struct 📑BundleMainInfoDictionary: View {
    var body: some View {
        Section {
            NavigationLink("Bundle.main.infoDictionary") {
                📋TextView(🄱undleMainInfoDictionary, "Bundle.main.infoDictionary")
            }
        }
    }
}


struct 🔗RepositoryLink: View {
    var body: some View {
        let 🔗 = "https://github.com/FlipByBlink/AAAA"
        Section {
            Link(destination: URL(string: 🔗)!) {
                HStack {
                    Label("Web Repository", systemImage: "link")
                    
                    Spacer()
                    
                    Image(systemName: "arrow.up.forward.app")
                }
            }
        } footer: {
            Text(🔗)
                .textSelection(.enabled)
        }
        
        
        let Mirror🔗 = "https://gitlab.com/FlipByBlink/AAAA"
        Section {
            Link(destination: URL(string: Mirror🔗)!) {
                HStack {
                    Label("Web Repository", systemImage: "link")
                    
                    Text("(Mirror)")
                        .font(.subheadline.bold())
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Image(systemName: "arrow.up.forward.app")
                }
            }
        } footer: {
            Text(Mirror🔗)
                .textSelection(.enabled)
        }
    }
}
