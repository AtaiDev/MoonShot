//
//  CustomDivider.swift
//  Moonshot
//
//  Created by admin on 17/6/22.
//

import Foundation
import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.white.opacity(0.5))
            .frame( height: 1)
            .cornerRadius(10)
    }
}


struct CustomDivider_Previews: PreviewProvider {
    
    static var previews: some View {
        CustomDivider()
    }
}
