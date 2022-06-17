//
//  Bundle_Accesser.swift
//  Moonshot
//
//  Created by admin on 9/6/22.
//

import Foundation
extension Bundle {
    func decode<T: Codable>(fileName: String) -> T {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("failed to load \(fileName) bundle.")
        }
        
        guard let dataDecoded = try? Data(contentsOf: fileURL) else {
            fatalError("failed to load data from \(fileName)")
        }
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        guard let loaded = try? decoder.decode(T.self, from: dataDecoded) else {
            fatalError("failed to load file")
        }
        
        
        return loaded
    }
    
    
}
