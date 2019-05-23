//
//  Beer.swift
//  ShowMyBeear
//
//  Created by Fabio Souza de Morais on 20/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import Foundation

struct Beer: Decodable {
    let id: Int?
    let name: String?
    let tagline: String?
    let description: String?
    let image_url: String?
    let abv: Double?
    let ibu: Double?
    let error: Error?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case description
        case image_url
        case abv
        case ibu
        case error
    }
}

struct Error: Decodable { }

extension Beer {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(Int.self, forKey: .id)
        name = try? container.decode(String.self, forKey: .name)
        tagline = try? container.decode(String.self, forKey: .tagline)
        description = try? container.decode(String.self, forKey: .description)
        image_url = try? container.decode(String.self, forKey: .image_url)
        abv = try? container.decode(Double.self, forKey: .abv)
        ibu = try? container.decode(Double.self, forKey: .ibu)
        error = try? container.decode(Error.self, forKey: .error)
    }

    static func parse(_ data: Data) -> [Beer]? {
        var beer: [Beer]?
        
        do {
            beer = try JSONDecoder().decode([Beer].self, from: data)
        } catch let jsonErr {
            print("Error decoding Json", jsonErr)
        }
        return beer
    }
}
