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
    @IBOutlet var resetDataButton: UIButton!
    
    let emotionNameList = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "행복해", "깜찍해"]
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
    var count : [Int] = Array(repeating: 0, count: 9)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setEmotionCountData()

    }
    
    func configureUI () {
        labelList.enumerated()
            .forEach{
                $0.element.text = makeLabelText(emotionName: emotionNameList[$0.offset], countString: "0")
            }
        
        buttonList.enumerated()
            .forEach{
                $0.element.setTitle("button\($0.offset)", for: .normal)
                $0.element.setTitleColor(.brown, for: .normal)
                $0.element.setImage(buttonImageList[$0.offset]?.withRenderingMode(.alwaysOriginal), for: .normal)
                //button이 default여야 imageView?.contentMode 적용됨
                $0.element.imageView?.contentMode = .scaleAspectFit
  
            }
        
        resetDataButton.setTitle("횟수 리셋하기", for: .normal)
        resetDataButton.backgroundColor = .blue
        resetDataButton.layer.cornerRadius = 10
        resetDataButton.setTitleColor(.white, for: .normal)
    }
    
    func makeLabelText(emotionName:String, countString : String) -> String{
        return "\(emotionName) \(countString)번"
    }
    
    func setEmotionCountData() {
        if let emotionCountData = UserDefaults.standard.array(forKey: "emotionCount") {

            self.count = emotionCountData as! [Int]
            self.count.enumerated().forEach{
                labelList[$0.offset].text = makeLabelText(emotionName: emotionNameList[$0.offset], countString: String($0.element))
            }
        }

    }
 
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        count[sender.tag] += 1
        labelList[sender.tag].text = makeLabelText(emotionName: emotionNameList[sender.tag], countString: String(count[sender.tag]))
        
        //감정 버튼 각각 몇 번 눌렸는지 저장
        UserDefaults.standard.set(count, forKey: "emotionCount")
    }
    
    @IBAction func resetCountData(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "emotionCount")

        count = Array(repeating: 0, count: 9)
        labelList.enumerated()
            .forEach{
                $0.element.text = makeLabelText(emotionName: emotionNameList[$0.offset], countString: "0")
            }
    }

}

