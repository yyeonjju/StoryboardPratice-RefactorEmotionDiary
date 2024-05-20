//
//  EmotionDiaryViewController.swift
//  SesacAssignment0517
//
//  Created by 하연주 on 5/19/24.
//

import UIKit

struct Emotion {
    let image : UIImage
    let name : String
    var count : Int
}

// FlowLayout
class EmotionDiaryViewController: UIViewController {
    let itemsPerRow: CGFloat = 3
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    var emotionList : [Emotion] = [
        Emotion(image: UIImage(named: "slime1")!, name: "행복해", count: 0),
        Emotion(image: UIImage(named: "slime2")!, name: "사랑해", count: 0),
        Emotion(image: UIImage(named: "slime3")!, name: "좋이해", count: 0),
        Emotion(image: UIImage(named: "slime4")!, name: "당황해", count: 0),
        Emotion(image: UIImage(named: "slime5")!, name: "속상해", count: 0),
        Emotion(image: UIImage(named: "slime6")!, name: "우울해", count: 0),
        Emotion(image: UIImage(named: "slime7")!, name: "심심해", count: 0),
        Emotion(image: UIImage(named: "slime8")!, name: "행복해", count: 0),
        Emotion(image: UIImage(named: "slime9")!, name: "깜찍해", count: 0),
        
    ]
    
    @IBOutlet var emotionCollectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        emotionCollectionView.backgroundColor = .clear
        
        title = "감정다이어리"
        
        emotionCollectionView.dataSource = self
        emotionCollectionView.delegate = self
    }

}

extension EmotionDiaryViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    //cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = emotionCollectionView.dequeueReusableCell(withReuseIdentifier: "emotionDiaryCollectionViewCell", for: indexPath) as! EmotionDiaryCollectionViewCell
        let rowData = emotionList[indexPath.row]
        
        cell.emotionImageView.image = rowData.image
        cell.emotionLabel.text = rowData.name + " " + String(rowData.count)
        cell.addCount = { [weak self] in
            guard let self else { return }
            self.emotionList[indexPath.row].count += 1
            emotionCollectionView.reloadData()
        }
        
        return cell
    }
    
    //numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emotionList.count
    }
    
}


//더 정밀한 레이아웃을 구성하려면 UICollectionViewDelegateFlowLayout 채택해야함
extension EmotionDiaryViewController : UICollectionViewDelegateFlowLayout {
    
    //특정 item cell의 사이즈를 정함
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let horizontalPaddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - horizontalPaddingSpace
        
        var verticalPaddingSpace : CGFloat = 0
        var column : CGFloat = 0
        if emotionList.count%Int(itemsPerRow) == 0 {
            verticalPaddingSpace = sectionInsets.top * ( (CGFloat(emotionList.count)/itemsPerRow) + 1)
            column = CGFloat(emotionList.count)/itemsPerRow
        }else {
            verticalPaddingSpace = sectionInsets.top * ( CGFloat(emotionList.count)/itemsPerRow + 2)
            column = (CGFloat(emotionList.count)/itemsPerRow) + 1
        }
        let availableHeight = collectionView.frame.height - verticalPaddingSpace
        
        
        let widthPerItem = availableWidth / itemsPerRow
        let heightPerItem = availableHeight / column
        return CGSize(width: widthPerItem, height: heightPerItem)
    }
    
    //특정 section의 마진을 정함
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    //cell의 위아래 간격을 정함
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.top
    }

    //cell의 양 옆 간격을 정함
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
//
//    //header의 사이즈를 정함
//    func collectionView(UICollectionView, layout: UICollectionViewLayout, referenceSizeForHeaderInSection: Int) -> CGSize {
//    }
//
//    //footer의 사이즈를 정함
//    func collectionView(UICollectionView, layout: UICollectionViewLayout, referenceSizeForFooterInSection: Int) -> CGSize {
//    }
}
