import Foundation
import SwiftUI

struct ADSheet: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @EnvironmentObject var 🛒: 🛒StoreModel
    var ⓐpp: 📣AppName = 📣AppName.allCases.randomElement()!
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
                    self.ⓓismissButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    self.ⓐdMenuLink()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    private func ⓜockImage() -> some View {
        Image(self.ⓐpp.mockImageName)
            .resizable()
            .scaledToFit()
    }
    private func ⓘcon() -> some View {
        Image(self.ⓐpp.iconImageName)
            .resizable()
            .frame(width: 60, height: 60)
    }
    private func ⓐppName() -> some View {
        Text(self.ⓐpp.name)
            .font(.headline)
    }
    private func ⓓescription() -> some View {
        Text(self.ⓐpp.description)
            .font(.subheadline)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 8)
    }
    private func ⓐppStoreBadge() -> some View {
        Link(destination: self.ⓐpp.url) {
            HStack(spacing: 6) {
                Image("appstore_badge")
                Image(systemName: "hand.point.up.left")
            }
            .foregroundColor(.primary)
        }
    }
    private func ⓐdMenuLink() -> some View {
        NavigationLink {
            📣ADMenu()
        } label: {
            Image(systemName: "questionmark.circle")
                .foregroundColor(.primary)
        }
    }
    private func ⓓismissButton() -> some View {
        Button {
            🛒.🚨showADSheet = false
        } label: {
            Image(systemName: "chevron.down")
        }
        .foregroundStyle(.primary)
    }
}


struct View_Previews: PreviewProvider {
    static let 🛒 = 🛒StoreModel(id: "PLACEHOLDER.adfree")
    static var previews: some View {
        ADSheet()
            .previewInterfaceOrientation(.portrait)
            .environmentObject(🛒)
        ADSheet()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(🛒)
    }
}
