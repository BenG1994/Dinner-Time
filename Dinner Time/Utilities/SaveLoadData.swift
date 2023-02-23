//
//  SaveLoadData.swift
//  Dinner Time
//
//  Created by Ben Gauger on 2/23/23.
//

import Foundation
import CoreData


var familyMembers: [FamilyMembers] = []
var name: String!


func saveName(completion: (_ finished: Bool) -> ()) {
    guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
    let member = FamilyMembers(context: managedContext)
    
    member.name = name
    
    do{
        try managedContext.save()
        print("successfully saved data")
        print("\(name!) name")
        completion(true)
    }catch{
        debugPrint("Could not save: \(error.localizedDescription)")
        completion(false)
    }
}

func fetchCoreData(){
    fetchName { complete in
        if complete {
            print("view will appear called")
            print("\(familyMembers.count) name fetched")
//            tableView.reloadData()
            
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

