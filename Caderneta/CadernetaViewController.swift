//
//  CadernetaViewController.swift
//  Caderneta
//
//  Created by Jorge Mota on 06/05/17.
//  Copyright © 2017 Jorge Mota. All rights reserved.
//

import UIKit

class CadernetaViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var cadernetaImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
    }


  

    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        cadernetaImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func cameraTapped(_ sender: Any) {
    }
    

    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let caderneta = Caderneta(context: context)
        caderneta.title = nomeTextField.text
        caderneta.image = UIImagePNGRepresentation(cadernetaImageView.image!)
              (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
}
