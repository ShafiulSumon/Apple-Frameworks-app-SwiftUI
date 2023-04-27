//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by ShafiulAlam-00058 on 3/23/23.
//

import SwiftUI

class FrameworkGridViewModel: ObservableObject {
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailsView = true
        }
    }
    
    @Published var isShowingDetailsView = false
}
