//
//  BeerDetailsViewModel.swift
//  ShowMyBeear
//
//  Created by Fabio Souza de Morais on 21/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import Foundation
import UIKit

class BeerDetailsViewModel {

    var beer: Beer?
    
    func beerName() -> String {
        return beer?.name ?? ""
    }
    
    func beerImage() -> String {
        return beer?.image_url ?? ""
    }
    
    func tagline() -> String {
        return beer?.tagline ?? ""
    }
    
    func abv() -> String {
        return "\(beer?.abv?.toString() ?? "")% ABV"
    }
    
    func ibu() -> String {
        return "\(beer?.ibu?.toString() ?? "")% IBU"
    }
    
    func description() -> String {
        return beer?.description ?? ""
    }
}
