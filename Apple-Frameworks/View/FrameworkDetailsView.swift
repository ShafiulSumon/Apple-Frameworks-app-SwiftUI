//
//  FrameworkDetailsView.swift
//  Apple-Frameworks
//
//  Created by ShafiulAlam-00058 on 3/22/23.
//

import SwiftUI

struct FrameworkDetailsView: View {
    var framework: Framework
    @Binding var isShowingDetailsView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isShowingDetailsView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
                .padding()
            }
            Spacer()
            FrameworkTitleView(framework: framework)
                .padding(30)
            Text(framework.description)
                .font(.body)
                .fontWeight(.thin)
                .padding()
            Spacer()
            Button {
                isShowingSafariView = true
            } label: {
                Text("Learn More")
                    .frame(width: 280, height: 45)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 50)
        }
        .fullScreenCover(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        }
        .preferredColorScheme(.dark)
    }
}

struct FrameworkDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailsView(framework: MockData.sampleFramework, isShowingDetailsView: .constant(false))
    }
}
