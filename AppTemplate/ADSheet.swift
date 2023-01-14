import Foundation
import SwiftUI

struct ADSheet: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var ⓐpp: 📣AppName = .MemorizeWidget
    var body: some View {
        NavigationView {
            Group {
                if self.verticalSizeClass == .regular {
                    VStack(spacing: 12) {
                        Spacer()
                        self.ⓜockImage()
                        Spacer()
                        self.ⓘcon()
                        self.ⓐppName()
                        Spacer()
                        self.ⓓescription()
                        Spacer()
                        self.ⓐppStoreBadge()
                        Spacer()
                    }
                    .padding()
                } else {
                    HStack(spacing: 16) {
                        self.ⓜockImage()
                        VStack(spacing: 12) {
                            Spacer()
                            self.ⓘcon()
                            self.ⓐppName()
                            self.ⓓescription()
                            Spacer()
                            self.ⓐppStoreBadge()
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                }
            }
            .navigationTitle("AD")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        📣ADMenu()
                    } label: {
                        Image(systemName: "questionmark.circle")
                            .foregroundColor(.primary)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "chevron.down")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    func ⓜockImage() -> some View {
        Image(self.ⓐpp.mockImageName)
            .resizable()
            .scaledToFit()
    }
    func ⓘcon() -> some View {
        Image(self.ⓐpp.iconImageName)
            .resizable()
            .frame(width: 60, height: 60)
    }
    func ⓐppName() -> some View {
        Text(self.ⓐpp.name)
            .font(.headline)
    }
    func ⓓescription() -> some View {
        Text(self.ⓐpp.description)
            .font(.subheadline)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 8)
    }
    func ⓐppStoreBadge() -> some View {
        Link(destination: self.ⓐpp.url) {
            HStack(spacing: 6) {
                Image("appstore_badge")
                Image(systemName: "hand.point.up.left")
            }
            .foregroundColor(.primary)
        }
    }
}


struct View_Previews: PreviewProvider {
    static var previews: some View {
        ADSheet()
            .previewInterfaceOrientation(.portrait)
        ADSheet()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
