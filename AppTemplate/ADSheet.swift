import Foundation
import SwiftUI

struct ADSheet: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
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
        Image("mock/fia")
            .resizable()
            .scaledToFit()
    }
    func ⓘcon() -> some View {
        Image("icon")
            .resizable()
            .frame(width: 60, height: 60)
    }
    func ⓐppName() -> some View {
        Text("App name")
            .font(.headline)
    }
    func ⓓescription() -> some View {
        Text("This is placeholder. Please deploy app description. 2 ~ 3 lines.")
            .font(.subheadline)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 8)
    }
    func ⓐppStoreBadge() -> some View {
        HStack(spacing: 6) {
            Image("appstore_badge")
            Image(systemName: "hand.point.up.left")
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
