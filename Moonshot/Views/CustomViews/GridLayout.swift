//
//  GridLayout.swift
//  Moonshot
//
//  Created by admin on 17/6/22.
//

import Foundation
import SwiftUI


struct GridLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    let column = [
        GridItem(.adaptive(minimum: 130))
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: column) {
                ForEach(missions) { mission in
                    
                    NavigationLink {
                        MissionView(mission: mission, astronaut: astronauts)
                    
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
    }
}


struct GridLayout_Previews: PreviewProvider {
    
    static var previews: some View {
        GridLayout(astronauts: Bundle.main.decode(fileName: "astronauts.json"), missions: Bundle.main.decode(fileName: "missions.json"))
    }
}
