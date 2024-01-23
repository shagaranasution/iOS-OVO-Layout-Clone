//
//  ProductService.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 20/01/24.
//

import Foundation

struct ProductService: Codable {
    let id: Int
    let name: String
    let category: Category
    let image: String
    
    enum Category: String, Codable {
        case favorit = "favorite"
        case other = "other"
        case grab = "grab"
        case financial = "financial"
    }
}
