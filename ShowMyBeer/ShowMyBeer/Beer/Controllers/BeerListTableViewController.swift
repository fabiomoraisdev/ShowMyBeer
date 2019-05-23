//
//  BeerListTableViewController.swift
//  ShowMyBeear
//
//  Created by Fabio Souza de Morais on 20/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import UIKit

class BeerListTableViewController: UITableViewController {

    var loadingView: Loading?
    
    var viewModel: BeerListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLoadingView()
        
        tableView.prefetchDataSource = self
        
        viewModel = BeerListViewModel()
        viewModel.networking = Networking()
        viewModel.delegate = self
        viewModel.fetchBeers()
    }
    
    private func setupLoadingView() {
        loadingView = Loading.instanceFromNib(rect: self.view.frame)
    }
    
    private func startLoadingView() {
        guard let loading = loadingView else { return }
        loading.activityIndicator.startAnimating()
        self.view.addSubview(loading)
    }
    
    private func removeLoadingView() {
        self.loadingView?.activityIndicator.stopAnimating()
        self.loadingView?.removeFromSuperview()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Identifiers.showBeerSegueIdentifier {
            guard let vc = segue.destination as? BeerDetailsViewController else { return }
            if let beer =  sender as? Beer {
                vc.viewModel.beer = beer
            }
        }
    }
}

extension BeerListTableViewController {
    //MARK: UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.totalCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.beerCellIdentifier, for: indexPath) as? BeerTableViewCell else { return UITableViewCell() }
        
        if isLoadingCell(for: indexPath) {
            cell.fillCell(with: .none)
        }else {
            cell.fillCell(with: viewModel.beer(at: indexPath.row))
        }
        
        return cell
    }
}

extension BeerListTableViewController {
    //MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: Constants.Identifiers.showBeerSegueIdentifier, sender: viewModel.beer(at: indexPath.row))
    }
}

extension BeerListTableViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            viewModel.fetchBeers()
        }
    }
}

extension BeerListTableViewController: BeerListViewModelDelegate {
    func onFetchCompleted() {
        removeLoadingView()
        tableView.reloadData()
    }

    func onFetchFailed(errorMessage: String) {
        removeLoadingView()
    }
}

private extension BeerListTableViewController {
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
       
        return indexPath.row >= viewModel.currentCount - 1
    }
    
    func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
        let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows ?? []
        let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
        return Array(indexPathsIntersection)
    }
}
