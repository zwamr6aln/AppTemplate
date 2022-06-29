
import SwiftUI

//TODO: ソースコードも透明性レポート内に配置するか検討する
//TODO: グラフィックデザイン資料セクションを実装
//TODO: "identity/circumstance/background"
//TODO: "TransparencyReport"用の先頭絵文字を検討

struct TransparencyReportLink: View {
    var body: some View {
        Section {
            NavigationLink {
                TransparencyReportMenu()
            } label: {
                Label("Transparency Report", systemImage: "questionmark.app.dashed")
            }
        }
    }
}


struct TransparencyReportMenu: View {
    var body: some View {
        List {
            NavigationLink {
                Developer_Publisher()
            } label: {
                Label("Developer / Publisher", systemImage: "person")
            }
            
            NavigationLink {
                AboutAppStoreRelease()
            } label: {
                Label("AppStore Release", systemImage: "a.square")
            }
            
            NavigationLink {
                Text("placeholder")
            } label: {
                Label("Graphic design resource", systemImage: "paintbrush")
            }
        }
        .navigationTitle("Transparency Report")
    }
}


struct Developer_Publisher: View {
    var body: some View {
        List {
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
                Image("Developer_Publisher")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding()
                    .opacity(0.66)
            } header: {
                Text("Image")
            } footer: {
                Text("Date: 2021-11-??")
            }
            
            
            Section {
                HStack {
                    Text("age")
                    Spacer()
                    Text("about 27")
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Text("country")
                    Spacer()
                    Text("Japan")
                        .foregroundStyle(.secondary)
                }
            } header: {
                Text("identity/circumstance/background")
            }
        }
        .navigationTitle("Developer / Publisher")
    }
}


struct AboutAppStoreRelease: View {
    var body: some View {
        List {
            Section {
                Text("4+")
            } header: {
                Text("AppStore age rating")
            }
            
            Section {
                Text("It is distributed to all (175) available countries or regions. It will also be automatically published to any new countries or regions that become available for distribution on AppStore.")
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


struct GraphicDesignResource: View {
    var body: some View {
        List {
            Text("placeholder")
        }
        .navigationTitle("Graphic design resource")
    }
}


struct TransparencySection_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TransparencyReportMenu()
        }
        
        NavigationView {
            Developer_Publisher()
        }
        
        NavigationView {
            AboutAppStoreRelease()
        }
        
        NavigationView {
            GraphicDesignResource()
        }
    }
}
