//
//  ArtistListTableViewCell.swift
//  Artist
//
//  Created by gayatri patel on 8/21/21.
//

import UIKit

class ArtistListTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var trackPrice: UILabel!
    @IBOutlet weak var primaryGenreName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Set data to display
    
    func setArtistData(artistInfo: ArtistResult) {
        name.text = artistInfo.artistName
        trackName.text = artistInfo.trackName
        primaryGenreName.text = artistInfo.primaryGenreName
        let date = artistInfo.releaseDate.convertToDate()
        releaseDate.text = getDate(date: date ?? NSDate() as Date)
        trackPrice.text = "\(artistInfo.trackPrice) \(artistInfo.currency)"
    }
    
    // MARK: - Convert Date to String
    
    func getDate(date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: date)
    }
}
