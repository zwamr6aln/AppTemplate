import Foundation
import SwiftUI

struct ADSheet: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var body: some View {
        NavigationView {
            Group {
                if self.verticalSizeClass == .regular {
                    VStack(spacing: 18) {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                        Spacer()
                        Image(systemName: "square")
                            .resizable()
                            .frame(width: 60, height: 60)
                        Text("App name")
                            .font(.headline)
                        Text("This is placeholder. Please deploy app description. 2 ~ 3 lines.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                        Spacer()
                        HStack(spacing: 6) {
                            Image("appstore_badge")
                            Image(systemName: "hand.point.up.left")
                        }
                        .padding()
                    }
                    .padding()
                } else {
                    HStack(spacing: 16) {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                        VStack(spacing: 18) {
                            Spacer()
                            Image(systemName: "square")
                                .resizable()
                                .frame(width: 60, height: 60)
                            Text("App name")
                                .font(.headline)
                            Text("This is placeholder. Please deploy app description. 2 ~ 3 lines.")
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                            Spacer()
                            HStack(spacing: 6) {
                                Image("appstore_badge")
                                Image(systemName: "hand.point.up.left")
                            }
                            .padding()
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
        }
    }
}


struct View_Previews: PreviewProvider {
    static var previews: some View {
        ADSheet()
            .sheet(isPresented: .constant(true), content: {
                ADSheet()
            })
            .previewInterfaceOrientation(.portrait)
        ADSheet()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
