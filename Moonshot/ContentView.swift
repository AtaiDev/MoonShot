//
//  ContentView.swift
//  Moonshot
//
//  Created by admin on 9/6/22.
//

import SwiftUI

struct ContentView: View {
    let austronoutList: [String: Astronaut] = Bundle.main.decode(fileName: "astronauts.json")
    let missions: [Mission] = Bundle.main.decode(fileName: "missions.json")
    let colums = [
        GridItem(.adaptive( minimum: 150) )
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: colums) {
                    ForEach(missions) { mission in
                        
                        NavigationLink { 
                            MissionView(mission: mission, astronaut: austronoutList)
                        
                        } label: {
                            VStack{
                                Image(mission.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.callout)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
  
                                .background(.lightBackground)
                            }
                        }
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.lightBackground )
                            
                    )
                    
                    
                }
                .padding([.horizontal, .bottom])
            
            
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
