//
//  ArtistListViewController.swift
//  Artist
//
//  Created by gayatri patel on 8/21/21.
//

import UIKit

class ArtistListViewController: UIViewController, Storyboarded {
    
    //Mark: - Properties

    var artiatInfo = [ArtistResult]()
    var vSpinner: UIView?
    var artistName: String?
    
    @IBOutlet weak var tableView: UITableView!
    
    //Mark: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        setup()
    }
    
    //Mark: - setup
    func setup(){
        registerForCell(tableView: tableView)
        showSpinner(onView: view)
        guard let artistName = artistName else {
            return
        }
        let artistAPIManager = ArtistAPIManager()
        artistAPIManager.getData(for: artistName, completionHandler: { [weak self] info in
            
            switch info {
            case .success(let artistData):
                DispatchQueue.main.async {
                    self?.artiatInfo = artistData.results
                    if self?.artiatInfo.count == 0{
                        self?.showAlert(title: "Alert", message: "No artist data found")
                    }else{
                        self?.tableView.reloadData()
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                self?.showAlert(title: "Alert", message: error.rawValue)
                    
                }
            }
            self?.hideSpinner()
        } )
    }
    
    //Mark: - UI Component - Register Cell, Alert and Spinner
    
    func registerForCell(tableView: UITableView){
        let cell = UINib.init(nibName: "ArtistListTableViewCell", bundle: Bundle.main)
        tableView.register(cell, forCellReuseIdentifier: "ArtistListTableViewCell")
        
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: {_ in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Mark: - Spinner
    func showSpinner(onView: UIView){
        let spinnerView = UIView.init(frame: UIScreen.main.bounds)
        spinnerView.backgroundColor = UIColor.white
        let centerX = UIScreen.main.bounds.width/2
        let centerY = UIScreen.main.bounds.height/2
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = CGPoint(x: centerX, y: centerY)
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            self.navigationController?.view.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }
    
    func hideSpinner(){
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
    
}

//Mark: - Tableview Datasource Methods

extension ArtistListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artiatInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistListTableViewCell") as? ArtistListTableViewCell else {return UITableViewCell()}
        let artistInfo = artiatInfo[indexPath.row]
        cell.setArtistData(artistInfo: artistInfo)
        return cell
    }
}





