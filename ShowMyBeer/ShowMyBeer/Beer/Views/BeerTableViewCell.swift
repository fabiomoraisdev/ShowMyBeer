//
//  BeerTableViewCell.swift
//  ShowMyBeear
//
//  Created by Fabio Souza de Morais on 20/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var percentageOfAlcoholLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.activityIndicator.hidesWhenStopped = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.beerImage.image = nil
        self.beerNameLabel.text = nil
        self.percentageOfAlcoholLabel.text = nil
    }
    
    func fillCell(with beer: Beer?) {
        self.activityIndicator.startAnimating()
        if let beer = beer {
            self.beerNameLabel.text = beer.name
            let abv = beer.abv?.toString()
            self.percentageOfAlcoholLabel.text = "\(abv ?? "")% ABV"
            self.beerNameLabel.alpha = 1
            self.percentageOfAlcoholLabel.alpha = 1
            fillImage(with: beer)
        }
    }
    
    func fillImage(with beer: Beer?) {
        guard let urlString = beer?.image_url else {
            DispatchQueue.main.async {
                self.beerImage.image = UIImage(named: Constants.Business.beerBottle)
            }
            self.activityIndicator.stopAnimating()
            return
        }
        self.beerImage.cacheImage(urlString: urlString) { image in
            DispatchQueue.main.async {
                self.beerImage.image = image
                self.activityIndicator.stopAnimating()
            }
        }
    }
}
