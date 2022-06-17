//
//  AstronautView.swift
//  Moonshot
//
//  Created by admin on 15/6/22.
//

import Foundation
import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFill()
                
                Text(astronaut.description)
                    .foregroundColor(.white)
                    .padding()
            }
            
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronaut: [String: Astronaut] = Bundle.main.decode(fileName: "astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronaut["mattingly"]! )
    }
}
