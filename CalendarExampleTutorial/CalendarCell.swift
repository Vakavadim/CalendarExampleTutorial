//
//  CalendarCell.swift
//  CalendarExampleTutorial
//
//  Created by Вадим Гамзаев on 16.08.2022.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    
    @IBOutlet weak var dayOfMonth: UILabel!
    
    func setCell(text: String) {
        dayOfMonth.text = text
    }
    
}
