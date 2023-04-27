//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by ShafiulAlam-00058 on 3/22/23.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject private var viewModel = FrameworkGridViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
                .navigationTitle("Apple Framework")
            }
            .fullScreenCover(isPresented: $viewModel.isShowingDetailsView) {
                FrameworkDetailsView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailsView: $viewModel.isShowingDetailsView)
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}

struct FrameworkTitleView: View {
    var framework: Framework
    
    var body: some View {
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }
        .padding()
    }
}
