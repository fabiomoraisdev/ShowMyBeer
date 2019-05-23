//
//  UILabelComponent.swift
//  ShowMyBeear
//
//  Created by Fabio Souza Morais on 22/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import UIKit

class UILabelComponent: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = self.font.withSize(self.font.resize())
        self.sizeToFit()
    }
}
