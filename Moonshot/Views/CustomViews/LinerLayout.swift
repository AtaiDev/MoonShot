//
//  LinerLayout.swift
//  Moonshot
//
//  Created by admin on 17/6/22.
//

import Foundation
import SwiftUI

struct LinerLayout: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    var body: some View {
        GeometryReader { geo in
            List {
                ForEach (missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronaut: astronauts)
                    } label: {
                        HStack {
                            Image(mission.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.2)
                                .padding(.horizontal)
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.callout)
                                    .foregroundColor(.white.opacity(0.7))
                            } .padding()
                            
                        }
                    }

                }
                .listRowBackground(Color.darkBackground)
                .padding(.vertical)
            }

            .listStyle(.plain)
        }
    }
}

struct LinerLayout_Previews: PreviewProvider {
    static var previews: some View {
        LinerLayout(missions: Bundle.main.decode(fileName: "missions.json"),
                    astronauts: Bundle.main.decode(fileName: "astronauts.json"))
            .preferredColorScheme(.dark)
    }
}

