//
//  NewlyCoinedWordViewController.swift
//  SesacAssignment0517
//
//  Created by 하연주 on 5/19/24.
//

import UIKit


struct NewlyCoinedWord {
    let word : String
    let desription : String
    let subDescription : String
}

class NewlyCoinedWordViewController: UIViewController {
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    let wordList : [NewlyCoinedWord] = [
        NewlyCoinedWord(word: "억까", desription: "억울하게 까이다", subDescription: "억울하게 비판받는 상황에서 사용"),
        NewlyCoinedWord(word: "가나디", desription: "‘강아지’", subDescription: "‘강아지’를 표현한 단어로 아기가 발음할 법한 귀여운 방식으로 사용"),
        NewlyCoinedWord(word: "캘박", desription: "캘린더에 박제", subDescription: "중요한 일정을 캘린더에 기록하는 행위"),
        NewlyCoinedWord(word: "최최차차", desription: "최애는 최애고 차은우는 차은우", subDescription: "말모..차은우 짱"),
        NewlyCoinedWord(word: "마상", desription: "마음의 상처", subDescription: "마음의 상처를 입었을 경우 사용되는 신조어"),
        
    ]
    
    
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var wordButtonCollectionView: UICollectionView!
    @IBOutlet var searchIconButton: UIButton!
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var subDescriptionLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "신조어"
        
        wordButtonCollectionView.delegate = self
        wordButtonCollectionView.dataSource = self
        
        inputTextField.layer.borderWidth = 2
        inputTextField.layer.borderColor = UIColor.black.cgColor
        inputTextField.placeholder = "신조어를 검색하세요"
        
        searchIconButton.setTitle("", for: .normal)
        searchIconButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchIconButton.tintColor = .white
        searchIconButton.backgroundColor = .black
        
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFill
        
        descriptionLabel.text = "검색어를 입력하세요"
        descriptionLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        descriptionLabel.layer.zPosition = 1
        
        subDescriptionLabel.text = ""
        subDescriptionLabel.numberOfLines = 0
        subDescriptionLabel.font = .systemFont(ofSize: 15, weight: .regular)
        subDescriptionLabel.layer.zPosition = 1
    }
    
    @IBAction func searchTextFieldReturnTapped(_ sender: UITextField) {
        searchWord()
    }
    
    @IBAction func searchIconButtonTapped(_ sender: UIButton) {
        searchWord()
    }
    
    func searchWord () {
        self.view.endEditing(true)
        
        guard let index = wordList.firstIndex(where : {$0.word == inputTextField.text}) else {
            descriptionLabel.text = "검색 결과가 없습니다"
            subDescriptionLabel.text = ""
            return
        }
        
        let wordItem = wordList[index]
        descriptionLabel.text = wordItem.desription
        subDescriptionLabel.text = wordItem.subDescription
    }
}

extension NewlyCoinedWordViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    //cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = wordButtonCollectionView.dequeueReusableCell(withReuseIdentifier: "newlyCoinedWordCollectionViewCell", for: indexPath) as! NewlyCoinedWordCollectionViewCell
        let rowData = wordList[indexPath.row]
        
        cell.wordButton.setTitle(rowData.word, for: .normal)
        cell.searchWord = { [weak self] in
            guard let self else { return }
            self.inputTextField.text = rowData.word
            self.searchWord()
        }
        
        return cell
    }
    
    //numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wordList.count
    }
    
}


extension NewlyCoinedWordViewController : UICollectionViewDelegateFlowLayout {
    
    //특정 item cell의 사이즈를 정함
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 40)
    }
    
    //특정 section의 마진을 정함
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
}
