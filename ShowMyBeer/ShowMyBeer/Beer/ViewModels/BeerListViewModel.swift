//
//  BeerListViewModel.swift
//  ShowMyBeear
//
//  Created by Fabio Souza de Morais on 20/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import UIKit

protocol BeerListViewModelDelegate: class {
    func onFetchCompleted()
    func onFetchFailed(errorMessage: String)
}

class BeerListViewModel {
    weak var delegate: BeerListViewModelDelegate?
    var beers: [Beer] = []
    var currentPage = 1
    var total = 0
    var isFetchInProgress = false
    
    var networking: Networking?
    
    var totalCount: Int {
        return total
    }
    
    var currentCount: Int {
        return beers.count
    }

    func beer(at index: Int) -> Beer {
        return beers[index]
    }
    
    func fetchBeers() {
        if networking == nil {
            networking = Networking()
        }
        
        guard !isFetchInProgress else {
            self.delegate?.onFetchFailed(errorMessage: "Ocorreu um erro")
            return
        }
        
        isFetchInProgress = true
        
        networking?.fetchData(method: Constants.Server.Method.get, page: currentPage, completionSuccess: { responseData in
            //success
            if let data = responseData,
                let beer = Beer.parse(data) {
                DispatchQueue.main.async {
                    self.currentPage += 1
                    self.isFetchInProgress = false
                    
                    self.beers.append(contentsOf: beer)

                    if let noDuplicates = self.beers.noDuplicates() {
                        self.beers = noDuplicates
                    }
                    
                    self.total = self.beers.count
                    self.delegate?.onFetchCompleted()
                }
            }
        }, completionFailure: { error in
            DispatchQueue.main.async {
                self.isFetchInProgress = false
                self.delegate?.onFetchFailed(errorMessage: error)
            }
        })
    }
}
