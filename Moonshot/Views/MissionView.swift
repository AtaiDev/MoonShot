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
                        .padding(.vertical)
                    
                    if  let date = mission.launchDate {
                        Label(date.formatted(date: .abbreviated, time: .omitted), systemImage: "calendar")
                            .font(.title2)
                    }
                    
                    VStack(alignment: .leading) {
                        
                        CustomDivider()
                        
                        Text("Mission Heiglihts")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                            .padding(.vertical)
                        
                        CustomDivider()
                        
                        Text("Crew members")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    // Crew memberView
                    CrewMemberView(crewMembers: self.crew)
                    
                } // end vstack
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
            // end scrolview

        } // geometry reader
    }
    
    init (mission: Mission, astronaut: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map({ member in
            if let astronaut = astronaut[member.name] {
                return CrewMember(role: member.role, austronout: astronaut)
            } else {
                fatalError("Could not find astronaut with name \(member.name)")
            }
        })
        
    }
}


struct MissionView_Previews: PreviewProvider {
    static var missions: [Mission] = Bundle.main.decode(fileName: "missions.json")
    static var astronaut: [String: Astronaut] = Bundle.main.decode(fileName: "astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[1], astronaut: astronaut)
            .preferredColorScheme(.dark)
    }
}
