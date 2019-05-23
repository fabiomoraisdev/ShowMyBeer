//
//  Loading.swift
//  ShowMyBeear
//
//  Created by Fabio Souza de Morais on 20/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import UIKit

class Loading: UIView {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    class func instanceFromNib(rect: CGRect) -> Loading? {
        let view = UINib(nibName: Constants.Identifiers.nibNameLoading, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? Loading
        view?.frame = rect
        return view
    }
}
