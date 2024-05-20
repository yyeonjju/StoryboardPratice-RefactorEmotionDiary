//
//  SecondEmotionDiaryViewController.swift
//  SesacAssignment0517
//
//  Created by 하연주 on 5/20/24.
//

import UIKit

class SecondEmotionDiaryViewController: UIViewController {
    
    @IBOutlet var buttonList: [UIButton]!
    @IBOutlet var labelList: [UILabel]!
    let emotionNameList = ["행복해", "사랑해", "좋이해", "당황해", "속상해", "우울해", "심심해", "행복해", "깜찍해"]
    let buttonImageList = [
        UIImage(named: "slime1"),
        UIImage(named: "slime2"),
        UIImage(named: "slime3"),
        UIImage(named: "slime4"),
        UIImage(named: "slime5"),
        UIImage(named: "slime6"),
        UIImage(named: "slime7"),
        UIImage(named: "slime8"),
        UIImage(named: "slime9"),
    ]
    var count = Array(repeating: 0, count: 9)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelList.enumerated()
            .forEach{
                $0.element.text = "\(emotionNameList[$0.offset]) 0번"
            }
        
        buttonList.enumerated()
            .forEach{
                $0.element.setTitle("button\($0.offset)", for: .normal)
                $0.element.setTitleColor(.brown, for: .normal)
                $0.element.setImage(buttonImageList[$0.offset]?.withRenderingMode(.alwaysOriginal), for: .normal)
                //button이 default여야 imageView?.contentMode 적용됨
                $0.element.imageView?.contentMode = .scaleAspectFit
  
            }

    }
    

 
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        count[sender.tag] += 1
        labelList[sender.tag].text = "\(emotionNameList[sender.tag]) \(count[sender.tag])번"
    }
}
