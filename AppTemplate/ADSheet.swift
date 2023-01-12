import Foundation
import SwiftUI

struct ADSheet: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var body: some View {
        NavigationView {
            if verticalSizeClass == .regular {
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
                .navigationTitle("AD")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "questionmark.circle")
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "chevron.down")
                    }
                }
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
                .navigationTitle("AD")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "questionmark.circle")
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "chevron.down")
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}


struct View_Previews: PreviewProvider {
    static var previews: some View {
        ADSheet()
            //.previewLayout(.fixed(width: 300, height: 600))
    }
}
