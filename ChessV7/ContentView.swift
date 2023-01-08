//
//  ContentView.swift
//  ChessV7
//
//  Created by Adrian Gabriel Chiper on 29.12.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        TabView {
            SettingsView().tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
            ChessboardView().environmentObject(viewModel).tabItem {
                Image(systemName: "arrowtriangle.right.circle.fill")
                Text("Play")
            }
        }.preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
