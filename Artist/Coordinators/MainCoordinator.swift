//
//  MainCoordinator.swift
//  Artist
//
//  Created by gayatri patel on 8/21/21.
//

import Foundation
import UIKit
class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        
        let vc = SearchArtistViewController.instantiate()
        vc.mainCoordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateArtistListViewController(artistName: String) {
        let vc = ArtistListViewController.instantiate()
        vc.artistName = artistName
        navigationController.pushViewController(vc, animated: false)
        

    }
    
}

