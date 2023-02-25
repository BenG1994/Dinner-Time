//
//  PracticeCell.swift
//  CellButtonTest
//
//  Created by Ben Gauger on 2/25/23.
//

import UIKit

class AddNewMealCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    
    @IBOutlet weak var familyMemberLabel: UILabel!

    
    var likeBtn: (() -> ())?
    var dislikeBtn: (() -> ())?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        likeBtn?()
    }
    
    @IBAction func dislikeButtonPressed(_ sender: Any) {
        dislikeBtn?()
    }
    
    func configureCell(member: FamilyMembers) {
        
       
        dislikeButton.tintColor = UIColor.gray
        likeButton.tintColor = UIColor.green
        
        
        self.familyMemberLabel.text = member.name
    }
    

}
