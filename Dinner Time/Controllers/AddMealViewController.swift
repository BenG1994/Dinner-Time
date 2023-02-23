//
//  AddMealViewController.swift
//  Dinner Time
//
//  Created by Ben Gauger on 2/21/23.
//

import UIKit
import CoreData

class AddMealViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealDisplayTextField: UITextField!
    @IBOutlet weak var addPhotoStack: UIStackView!
    
//    var familyMembers = [FamilyMembers].self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealDisplayTextField.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
registerTablecells()
  
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        fetchCoreData()
        tableView.reloadData()
        print(familyMembers.count)
        
    }
    
    func registerTablecells() {
        tableView.register(UINib(nibName: "AddNewMealCell", bundle: nil), forCellReuseIdentifier: "AddNewMealCell")
    }
    
    
    
    
//MARK: - Camera stuff
    
    func accessCameraAndPhotos() {
        let photoSourceRequestController = UIAlertController(title: "", message: "Choose your photo source", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .camera
                
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        photoSourceRequestController.addAction(cameraAction)
        photoSourceRequestController.addAction(photoLibraryAction)
        
        present(photoSourceRequestController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            mealImageView.image = selectedImage
            mealImageView.contentMode = .scaleAspectFit
            mealImageView.clipsToBounds = true
        }
        dismiss(animated: true)
        
    }
    
    @IBAction func addPhotoButtonPressed(_ sender: Any) {
        accessCameraAndPhotos()
    }
    
    //MARK: - Meal Likes/Dislikes
//    
//    @IBAction func likePressed(_ sender: Any) {
//        let likeButtonImage = UIImage(named: "checkmark")
//        self.dislikebutton.setImage(nil, for: .normal)
//        self.likeButton.setImage(likeButtonImage, for: .normal)
//    }
//    
//    
//    @IBAction func dislikePressed(_ sender: Any) {
//        let dislikeButtonImage = UIImage(named: "xmark")
//        self.dislikebutton.setImage(dislikeButtonImage, for: .normal)
//        self.likeButton.setImage(nil, for: .normal)
//    }
    
    
//    @IBAction func likePressed(_ sender: Any) {
//        let likeButtonImage = UIImage(named: "checkmark")
//        self.dislikeButton.setImage(nil, for: .normal)
//        self.likeButton.setImage(likeButtonImage, for: .normal)
//    }
//
//
//    @IBAction func dislikePressed(_ sender: Any) {
//    }
    
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func addMealPressed(_ sender: Any) {
        dismiss(animated: true)
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


extension AddMealViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return familyMembers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddMealCell") as? AddMealCell else {return UITableViewCell()}
        
        
//        cell.contentView.isUserInteractionEnabled = false
        
        let member = familyMembers[indexPath.row]
        cell.configureCell(member: member)
//        cell.likeBtn = {[unowned self] in
////            let likeButtonImage = UIImage(named: "checkmark")
////            self.setImage(likeButtonImage, for: .normal)
//            print("shit")
//        }
        
        
        return cell
    }
    
    
    
}

