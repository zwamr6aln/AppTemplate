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
                        Image("mainImage")
                            .resizable()
                            .scaledToFit()
                        Spacer()
                        Image("icon")
                            .resizable()
                            .frame(width: 60, height: 60)
                        Text("App name")
                            .font(.headline)
                        Spacer()
                        Text("This is placeholder. Please deploy app description. 2 ~ 3 lines.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 8)
                        Spacer()
                        HStack(spacing: 6) {
                            Image("appstore_badge")
                            Image(systemName: "hand.point.up.left")
                        }
                        Spacer()
                    }
                    .padding()
                } else {
                    HStack(spacing: 16) {
                        Image("mainImage")
                            .resizable()
                            .scaledToFit()
                        VStack(spacing: 12) {
                            Spacer()
                            Image("icon")
                                .resizable()
                                .frame(width: 60, height: 60)
                            Text("App name")
                                .font(.headline)
                            Text("This is placeholder. Please deploy app description. 2 ~ 3 lines.")
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 4)
                            Spacer()
                            HStack(spacing: 6) {
                                Image("appstore_badge")
                                Image(systemName: "hand.point.up.left")
                            }
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
}


struct View_Previews: PreviewProvider {
    static var previews: some View {
        ADSheet()
            .previewInterfaceOrientation(.portrait)
        ADSheet()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
