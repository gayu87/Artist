//
//  ViewController.swift
//  Artist
//
//  Created by gayatri patel on 8/21/21.
//

import UIKit

class SearchArtistViewController: UIViewController,Storyboarded {
    
    // MARK: - Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    var mainCoordinator: MainCoordinator?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.setButtonBorder(button: button, title: "Search Artist")
        textField.setBorder(textField: textField)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Action Event
    @IBAction func searchButtonPressed(_ sender: Any) {
        
        guard let artistName = textField.text else { return }
        if artistName.count == 0 {
            let alert = UIAlertController(title: "Alert", message: "Artist name is required", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        mainCoordinator?.navigateArtistListViewController(artistName: artistName)
    }
}


