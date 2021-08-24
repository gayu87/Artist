//
//  Coordinator.swft.swift
//  Artist
//
//  Created by gayatri patel on 8/21/21.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}
