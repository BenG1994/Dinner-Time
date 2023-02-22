//
//  FamilyMemberCell.swift
//  Dinner Time
//
//  Created by Ben Gauger on 2/22/23.
//

import UIKit

class FamilyMemberCell: UITableViewCell {
    
    
    @IBOutlet weak var familyMemberTextLabel: UILabel!
    

    func configureCell(member: FamilyMembers) {
        
        self.familyMemberTextLabel.text = member.name

        
    }

}
