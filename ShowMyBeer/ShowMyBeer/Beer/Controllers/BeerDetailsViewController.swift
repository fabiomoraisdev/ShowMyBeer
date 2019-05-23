//
//  BeerDetailsViewController.swift
//  ShowMyBeear
//
//  Created by Fabio Souza de Morais on 20/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import UIKit

class BeerDetailsViewController: UIViewController {
    
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var ibuLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let viewModel = BeerDetailsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        setupView()
        hideActivityIndicator()
    }
    
    private func setupNavigationItem () {
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupView() {
        self.nameLabel.text = viewModel.beerName()
        self.taglineLabel.text = viewModel.tagline()
        self.abvLabel.text = viewModel.abv()
        self.ibuLabel.text = viewModel.ibu()
        self.descriptionLabel.text = viewModel.description()
        setupImage(urlString: viewModel.beerImage())
    }
    
    private func hideActivityIndicator() {
        self.activityIndicator.hidesWhenStopped = true
    }
    
    private func setupImage(urlString: String) {
        self.activityIndicator.startAnimating()
        self.beerImage.cacheImage(urlString: urlString) { image in
            self.beerImage.image = image
            self.activityIndicator.stopAnimating()
        }
    }
}
