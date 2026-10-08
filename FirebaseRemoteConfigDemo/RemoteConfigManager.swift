//
//  RemoteConfigManager.swift
//  FirebaseRemoteConfigDemo
//
//  Created by Vikram Kumar on 07/10/26.
//

import Foundation
import FirebaseRemoteConfig

final class RemoteConfigManager {
    
    static let shared = RemoteConfigManager()
    private let remoteConfig: RemoteConfig
    
    private init() {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
        setDefaults()
    }
    
    private func setDefaults() {
        
        do {
            try remoteConfig.setDefaults(from: ["new_home_screen" : false])
        } catch {
            print("Failed to set remote config defaults: \(error)")
        }
    }
    
    func fetchConfig(completion: @escaping (Bool) -> Void) {
        //for fetching and activating remote config values together.
        remoteConfig.fetchAndActivate { status, error in
        
            if let error = error {
                print("Remote Config error: \(error.localizedDescription)")
                completion(self.remoteConfig["new_home_screen"].boolValue)
                return
            }
            
            let isEnabled = self.remoteConfig["new_home_screen"].boolValue
            print("Remote Config fetched")
            print("new_home_screen = \(isEnabled)")
            
            completion(isEnabled)
        }
    }
    
}
