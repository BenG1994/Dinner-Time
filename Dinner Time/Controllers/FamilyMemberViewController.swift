//
//  FamilyMemberViewController.swift
//  Dinner Time
//
//  Created by Ben Gauger on 2/21/23.
//

import UIKit
import CoreData


class FamilyMemberViewController: UITableViewController {
    
    @IBOutlet weak var familyMemberLabelText: UILabel!
    
    var familyMembers: [FamilyMembers] = []
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 86
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//            super.viewWillAppear(animated)
//    fetchCoreDataNames()
//    }
    
    
    @IBAction func addFamilyMemberPressed(_ sender: Any) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add family Member", message: "What's your family member's name?", preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        let action = UIAlertAction(title: "Add Family Member", style: .default) {(action) in
            
            self.name = textField.text!
            
            self.saveName { finished in
                if finished {
                    print("finished")
                }
            }
            self.fetchCoreData()
//            print(self.name)
            
        }
        
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = ""
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        alert.addAction(actionCancel)
        
        
        
        present (alert, animated: true, completion: nil)
        
    }
    
    
    func saveName(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let member = FamilyMembers(context: managedContext)
        
        member.name = name
        
        do{
            try managedContext.save()
            print("successfully saved data")
            print("\(self.name!) name")
            completion(true)
        }catch{
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func fetchCoreData(){
        self.fetchName { complete in
            if complete {
                print("view will appear called")
                print("\(familyMembers.count) name fetched")
                
            }
        }
    }
    
    
    func fetchName(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let fetchRequest = NSFetchRequest<FamilyMembers>(entityName: "FamilyMembers")
        
        do{
            familyMembers = try managedContext.fetch(fetchRequest)
            print("Successfully fetched data")
            completion(true)
            
        }catch{
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
}

extension FamilyMemberViewController {
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return familyMembers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "familyMemberCell") as? FamilyMemberCell else {return UITableViewCell()}
        
        
        let member = familyMembers[indexPath.row]
        cell.configureCell(member: member)
//        cell.__dequeueConfiguredReusableCell(with: <#T##__UICollectionViewCellRegistration#>, for: <#T##IndexPath#>, item: <#T##Any#>)
        return cell
    }
    
    
}
