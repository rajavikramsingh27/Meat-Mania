//  ManageProfileVC.swift
//  Meat Mania
//  Created by Uttam on 27/12/19.
//  Copyright © 2019 appentus. All rights reserved.


import UIKit


class ManageProfileVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var manageTblView: UITableView!

    let titleLbl = ["Mobile Number","Name","Email"]
    let titleImg = ["phone-call","user","envelope"]
    let profileData = ["9636121212","Ashish","ashkumjad@gmail.com"]
    var imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImg.makeRounded()
        imagePicker.delegate = self
        manageTblView.delegate = self
        manageTblView.dataSource = self
        
//        manageTblView.register(UINib(nibName: "ManageProfileCell", bundle: nil), forCellReuseIdentifier: "ManageProfileCell")
        manageTblView.register(UINib(nibName: "ManageUpdateCell", bundle: nil), forCellReuseIdentifier: "ManageUpdateCell")
        manageTblView.tableFooterView = UIView()
    }
    
    @IBAction func profileBttn(_ sender: UIButton) {
         imageViewPicker()
    }
    
    func imageViewPicker() {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            
            self.present(imagePicker, animated: true, completion: nil)
        }else{
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    func openGallary(){
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if  let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            profileImg.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
  
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated:  true, completion: nil)
    }
    @IBAction func backBttn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension ManageProfileVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ManageUpdateCell", for: indexPath) as! ManageUpdateCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ManageProfileCell", for: indexPath) as! ManageProfileCell
            
            cell.titleNameLbl.text = titleLbl[indexPath.row]
            cell.mobileNumberText.text = profileData[indexPath.row]
            cell.imgg.image = UIImage(named: titleImg[indexPath.row])
            
            if indexPath.row == 0 {
                cell.mobileNumberText.isUserInteractionEnabled = false
            } else {
                 cell.mobileNumberText.isUserInteractionEnabled = true
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 60
        } else {
            return 60
        }
    }
    
}
