//
//  AddMealCell.swift
//  Dinner Time
//
//  Created by Ben Gauger on 2/22/23.
//

import UIKit


class AddMealCell: UITableViewCell {

    
    @IBOutlet weak var dislikebutton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var familyMemberLabel: UILabel!
    
    func configureCell(member: FamilyMembers) {
       
        dislikebutton.layer.borderColor = UIColor(ciColor: .gray).cgColor
        dislikebutton.layer.borderWidth = 0.5
        likeButton.layer.borderColor = UIColor(ciColor: .gray).cgColor
        likeButton.layer.borderWidth = 0.5
        
        likeButton.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
        dislikebutton.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
//
//        contentView.addSubview(likeButton)
//        contentView.addSubview(dislikebutton)
        
        
        self.familyMemberLabel.text = member.name
        self.dislikebutton.setImage(nil, for: .normal)
        self.likeButton.setImage(nil, for: .normal)
//        let dislikeButtonImage = UIImage(named: "xmark")
//        let likeButtonImage = UIImage(named: "checkmark")
//
//        self.dislikebutton.setImage(dislikeButtonImage, for: .normal)
//        self.likeButton.setImage(likeButtonImage, for: .normal)
//        self.dislikebutton.isHidden = false
//        self.likeButton.isHidden = false
    }
    
    @objc func connected(sender: UIButton){
        let buttonTag = sender.tag
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
        self.dislikebutton.setImage(nil, for: .normal)
        self.likeButton.setImage(likeButtonImage, for: .normal)
    }
    
    func dislikeButtonTapped() {
        let dislikeButtonImage = UIImage(named: "xmark")
        self.dislikebutton.setImage(dislikeButtonImage, for: .normal)
        self.likeButton.setImage(nil, for: .normal)
    }
    
    
}
