//
//  CrewMemberView.swift
//  Moonshot
//
//  Created by admin on 17/6/22.
//

import Foundation
import SwiftUI


struct CrewMemberView: View {
    let crewMembers: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crewMembers, id: \.role) { member in
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
        
    }
}

struct CrewMemberView_Previews: PreviewProvider {
    static var astronauts: [String: Astronaut] = Bundle.main.decode(fileName: "astronauts.json")
    static let missions: [Mission] = Bundle.main.decode(fileName: "missions.json")
    static var crewMembers = missions[1].crew.map { member -> MissionView.CrewMember in
        if let astronaut = astronauts[member.name] {
            return MissionView.CrewMember(role: member.role, austronout: astronaut)
        } else {
            fatalError("unable to find member \(member.name)")
        }
    }
    
    static var previews: some View {
        CrewMemberView(crewMembers: crewMembers)
            .preferredColorScheme(.dark)
    }
}
