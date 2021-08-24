//
//  Storyboarded.swift
//  Artist
//
//  Created by gayatri patel on 8/21/21.
//

import Foundation
import UIKit


protocol Storyboarded  {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
        
        let className = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
