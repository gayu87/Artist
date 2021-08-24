//
//  extension.swift
//  Artist
//
//  Created by gayatri patel on 8/23/21.
//

import Foundation
import UIKit

extension UIButton {
    func setButtonBorder(button: UIButton, title: String){
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 4
    }
}


extension UITextField{
    func setBorder(textField: UITextField){
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 4.0
        textField.layer.borderColor = UIColor.blue.cgColor
    }
}


extension String {
 
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = .current
        return dateFormatter.date(from: self)
    }
}
