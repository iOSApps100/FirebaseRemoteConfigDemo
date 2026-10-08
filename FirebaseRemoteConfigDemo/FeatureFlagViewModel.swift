//
//  FeatureFlagViewModel.swift
//  FirebaseRemoteConfigDemo
//
//  Created by Vikram Kumar on 08/10/26.
//

import Foundation
import Combine

@MainActor
final class FeatureFlagViewModel: ObservableObject {
    
    @Published var isNewHomeEnabled = false
    @Published var isLoading = false
    
    func fetchFeatureFlag() {
        
        isLoading = true
        RemoteConfigManager.shared.fetchConfig { [weak self] enabled in
            
            Task { @MainActor in
                self?.isNewHomeEnabled = enabled
                self?.isLoading = false
            }
        }
    }
}
