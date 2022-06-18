//
//  ContentView.swift
//  Moonshot
//
//  Created by admin on 9/6/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("showGridLayout") private var showGridLayout = true
    
    let astronauts: [String: Astronaut] = Bundle.main.decode(fileName: "astronauts.json")
    let missions: [Mission] = Bundle.main.decode(fileName: "missions.json")
    let colums = [
        GridItem(.adaptive( minimum: 150) )
    ]
    
    var body: some View {
        NavigationView {
            Group {
                if showGridLayout {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    LinerLayout(missions: missions, astronauts: astronauts)
                }
            }
            .toolbar {
                Button {
                    showGridLayout.toggle()
                } label: {
                    Group {
                        if showGridLayout {
                            Label("Show liner layout", systemImage: "line.3.horizontal")
                        } else {
                            Label("Show grid layout", systemImage: "square.grid.2x2")
                        }
                    }
                    .foregroundColor(.white)
                }
            }
            .navigationTitle("MoonShot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
