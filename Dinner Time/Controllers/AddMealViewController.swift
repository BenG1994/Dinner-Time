//
//  AddMealViewController.swift
//  Dinner Time
//
//  Created by Ben Gauger on 2/21/23.
//

import UIKit

class AddMealViewController: UIViewController {


    @IBOutlet weak var mealDisplayTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealDisplayTextField.delegate = self

  
    }
    
    @IBAction func addPhotoButtonPressed(_ sender: Any) {
        //Add camera and camera roll stuff here
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func addMealPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func likePressed(_ sender: Any) {
        
    }
    
    
    @IBAction func dislikePressed(_ sender: Any) {
    }
}


extension AddMealViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return false
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        textField.endEditing(true)
//        
////        return true
//    }
//    
    
    
}
