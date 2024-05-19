//
//  NewlyCoinedWordCollectionViewCell.swift
//  SesacAssignment0517
//
//  Created by 하연주 on 5/19/24.
//

import UIKit

class NewlyCoinedWordCollectionViewCell: UICollectionViewCell {
    @IBOutlet var wordButton: UIButton!
    var searchWord : () -> Void = {  }

    override func awakeFromNib() {
        super.awakeFromNib()

        wordButton.layer.cornerRadius = 20
        wordButton.layer.borderWidth = 2
        wordButton.layer.borderColor = UIColor.black.cgColor
        wordButton.setTitleColor(.black, for: .normal)
        
    }
    
    @IBAction func wordButtonTapped(_ sender: UIButton) {
        searchWord()
    }
}
