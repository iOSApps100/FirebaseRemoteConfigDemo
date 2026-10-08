//
//  ContentView.swift
//  FirebaseRemoteConfigDemo
//
//  Created by Vikram Kumar on 07/10/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FeatureFlagViewModel()
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Feature flag Demo")
                .font(.largeTitle)
                .bold()
            Divider()
            if viewModel.isLoading {
                ProgressView("Fetching config...")
            } else {
                if viewModel.isNewHomeEnabled {
                    NewHomeView()
                } else {
                    OldHomeView()
                }
            }
            Button("Refresh Config") {
                viewModel.fetchFeatureFlag()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear {
            viewModel.fetchFeatureFlag()
        }
    }
}


struct NewHomeView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("New Home Screen")
                .font(.title2)
                .bold()
            Text("This feature is enabled remotely")
        }
    }
}

struct OldHomeView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("Old Home Screen")
                .font(.title2)
                .bold()
            Text("This is the existing experience")
        }
    }
}

#Preview {
    ContentView()
}
