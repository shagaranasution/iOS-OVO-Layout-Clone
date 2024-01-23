//
//  Service.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 20/01/24.
//

import Foundation

final class Service {
    
    public static let shared = Service()
    
    private init() {}
    
    public func load<T: Decodable>(from filename: String) -> T? {
        let data: Data
        
        guard
            let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            print("Couldn't find \(filename) in main bundle.")
            return nil
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            print("Couldn't find \(filename) in main bundle.")
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            
            return try decoder.decode(T.self, from: data)
        } catch {
            print("Couldn't parse \(filename) as \(T.self):\n\(error)")
            return nil
        }
    }
    
}
