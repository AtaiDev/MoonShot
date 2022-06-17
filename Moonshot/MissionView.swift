//
//  MissionView.swift
//  Moonshot
//
//  Created by admin on 12/6/22.
//

import Foundation
import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let austronout: Astronaut
    }
    let mission: Mission
    var crew = [CrewMember]()
    
    var body: some View {
        GeometryReader { geo in
            ScrollView (showsIndicators: false) {
                VStack {
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.6)
                        .padding(.top)
                    
                    VStack(alignment: .leading) {
                        
                        Rectangle()
                            .foregroundColor(.white.opacity(0.5))
                            .frame( height: 1)
                            .cornerRadius(10)

                        
                        
                        Text("Mission Heiglihts")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                            .padding(.vertical)
                        
                        Rectangle()
                            .foregroundColor(.white.opacity(0.5))
                            .frame( height: 1)
                            .cornerRadius(10)
                        
                        Text("Crew members")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(crew, id: \.role) { member in
                                NavigationLink {
                                    
                                    AstronautView(astronaut: member.austronout)
                                
                                } label: {
                                Image(member.austronout.id)
                                    .resizable()
                                    .frame(width: 104, height: 72)
                                    .clipShape(Capsule())
                                    .overlay(
                                        Capsule()
                                            .strokeBorder(.white, lineWidth: 1 )
                                    )

                                    VStack (alignment: .leading) {
                                        Text(member.austronout.name)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        
                                        Text(member.role)
                                            .font(.callout)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                .padding([.horizontal, .vertical])
                                
                            }

                        }
                    }
                } // end vstack
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.lightBackground)
            // end scrolview

        } // geometry reader
    }
    
    init (mission: Mission, astronaut: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map({ member in
            if let astronaut = astronaut[member.name] {
                return CrewMember(role: member.role, austronout: astronaut)
            } else {
                fatalError("Could not found astronaut with name \(member.name)")
            }
        })
        
    }
}


struct MissionView_Previews: PreviewProvider {
    static var missions: [Mission] = Bundle.main.decode(fileName: "missions.json")
    static var astronaut: [String: Astronaut] = Bundle.main.decode(fileName: "astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronaut: astronaut)
            .preferredColorScheme(.dark)
    }
}
