//
//  UIFont+Utils.swift
//  ShowMyBeear
//
//  Created by Fabio Souza Morais on 22/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import UIKit

extension UIFont {
    func resize() -> CGFloat {
        let fontDescriptor = self.fontDescriptor
        let screenSize = UIScreen.main.bounds.height
        
        guard let fontSize: CGFloat = fontDescriptor.object(forKey: .size) as? CGFloat else {
            return 17
        }
        
        if screenSize <= 568.0 {
            return fontSize
        } else if screenSize > 568 && screenSize <= 667 {
            return fontSize * 1.17
        } else {
            return fontSize * 1.3
        }
    }
}
