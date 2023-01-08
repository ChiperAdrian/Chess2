//
//  SettingsView.swift
//  ChessV7
//
//  Created by Adrian Gabriel Chiper on 06.01.2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text("Settings").font(.title).padding(.leading, 20).foregroundColor(.white)
                    Spacer()
                    VStack(alignment: .leading) {
                        PickerView(name: "Difficulty", choices: ["Easy", "Medium", "Hard"], selection: "Medium")
                        PickerView(name: "Player color", choices: ["White", "Black"], selection: "White")
                        PickerView(name: "Time limit", choices: ["No", "5", "10", "15", "30", "60"], selection: "15")
                        ToggleView()
                    }
                    .padding(20)
                    .background(.black)
                    Spacer()
                    Spacer()
                }
                .padding()
                .frame(width: .infinity, height: .infinity)
                Spacer()
            }
            Spacer()
            Rectangle()
                .fill(Color.clear)
                .frame(height: 10)
                .background(Color(red: 26/225, green: 23/255, blue: 26/255))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


struct PickerView: View {
    var name: String
    var choices: [String]
    @State var selection: String
    init(name: String, choices: [String], selection: String) {
        self.name = name
        self.choices = choices
        self.selection = selection
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(.white)], for: .normal)
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(red: 91/255, green: 91/255, blue: 97/255, alpha: 1)
    }
    var body: some View {
        VStack(alignment:.leading) {
            Text(name)
            Picker(name, selection: $selection) {
                ForEach(choices, id:\.self) {
                    Text($0)
                }
            }
            .background(Color(red: 28/255, green: 28/255, blue: 31/255))
            .cornerRadius(7)

            
        }
        .pickerStyle(.segmented)
        .padding(.bottom, 80)
        .foregroundColor(.white)
    }
}

struct ToggleView: View {
    @State var hintsOn = false
    var body : some View {
        Toggle("Hints", isOn: $hintsOn).foregroundColor(.white)
    }
}
