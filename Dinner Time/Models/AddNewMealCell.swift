//
//  AddMealCell.swift
//  Dinner Time
//
//  Created by Ben Gauger on 2/22/23.
//

import UIKit


class AddNewMealCell: UITableViewCell {

    
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var familyMemberLabel: UILabel!

    
    func configureCell(member: FamilyMembers) {
        
       
        dislikeButton.layer.borderColor = UIColor(ciColor: .gray).cgColor
        dislikeButton.layer.borderWidth = 0.5
        likeButton.layer.borderColor = UIColor(ciColor: .gray).cgColor
        likeButton.layer.borderWidth = 0.5
        
//
//        contentView.addSubview(likeButton)
//        contentView.addSubview(dislikebutton)
        
        
        self.familyMemberLabel.text = member.name
        self.dislikeButton.setImage(nil, for: .normal)
        self.likeButton.setImage(nil, for: .normal)
//        let dislikeButtonImage = UIImage(named: "xmark")
//        let likeButtonImage = UIImage(named: "checkmark")
//
//        self.dislikebutton.setImage(dislikeButtonImage, for: .normal)
//        self.likeButton.setImage(likeButtonImage, for: .normal)
//        self.dislikebutton.isHidden = false
//        self.likeButton.isHidden = false
    }
    

    @IBAction func likePressed(_ sender: Any) {
        likeButtonTapped()
        print("like tapped")
    }
    
    
    @IBAction func dislikePressed(_ sender: Any) {
        dislikeButtonTapped()
        print("dislike tapped")
    }
    
    func likeButtonTapped() {
        let likeButtonImage = UIImage(named: "checkmark")
        self.dislikeButton.setImage(nil, for: .normal)
        self.likeButton.setImage(likeButtonImage, for: .normal)
    }
    
    func dislikeButtonTapped() {
        let dislikeButtonImage = UIImage(named: "xmark")
        self.dislikeButton.setImage(dislikeButtonImage, for: .normal)
        self.likeButton.setImage(nil, for: .normal)
    }
    
    
}
