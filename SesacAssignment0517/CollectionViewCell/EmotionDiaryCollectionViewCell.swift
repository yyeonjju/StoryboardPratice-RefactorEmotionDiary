//
//  EmotionDiaryCollectionViewCell.swift
//  SesacAssignment0517
//
//  Created by 하연주 on 5/19/24.
//

import UIKit

class EmotionDiaryCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet var emotionImageView: UIImageView!
    @IBOutlet var emotionLabel: UILabel!
    
    var addCount: () -> Void = {  }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)
    }

    @objc func handleTap() {
        addCount()
    }
    
    
}
