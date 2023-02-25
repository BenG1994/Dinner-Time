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
    
//        var familyMembers = [FamilyMembers].self
    var like: Bool = true
    var dislike: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealDisplayTextField.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        registerTableCells()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        fetchCoreData()
        tableView.reloadData()
  
        
    }
    
    func registerTableCells() {
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
    
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func addMealPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let member = FamilyMembers(context: managedContext)
        
        member.like = like
        member.dislike = dislike
        do{
            try managedContext.save()
            print("successfully saved data")
//            print("\(self.like) name")
            completion(true)
        }catch{
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    
    
}


extension AddMealViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return false
    }
    
    
}


extension AddMealViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return familyMembers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddNewMealCell", for: indexPath) as? AddNewMealCell else {return UITableViewCell()}
        

        let member = familyMembers[indexPath.row]
        cell.configureCell(member: member)
        
        
        cell.likeBtn = {[unowned self] in
            
            cell.dislikeButton.tintColor = UIColor.gray
            cell.likeButton.tintColor = UIColor.green
            member.dislike = false
            member.like = true
            self.save { finished in
                if finished {
                    print("finished")
                    print(member)
                }
            }
        }
        
        cell.dislikeBtn = {[unowned self] in
            
            cell.dislikeButton.tintColor = UIColor.red
            cell.likeButton.tintColor = UIColor.gray
            member.dislike = true
            member.like = false
            self.save { finished in
                if finished {
                    print("finished")
                    print(member)
                }
            }
        }
        
        return cell
    }

    
}


