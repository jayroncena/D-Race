//
//  ViewController.swift
//  DRace
//
//  Created by wonjongpill on 2017. 11. 18..
//  Copyright © 2017년 Jayron Cena. All rights reserved.
//
import UIKit
import FirebaseAuth

class RegisterViewController: CustomTextFieldDelegate{
    @IBOutlet weak var weightInput: UITextField!
    
    let user = Auth.auth().currentUser
    var renewDataModel:RenewDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Data renewing model
        renewDataModel = RenewDataModel()
        
        //Set delegate and keyboard type
        weightInput.delegate = self
        weightInput.keyboardType = .decimalPad
    }
    
    @IBAction func weightSubmit(_ sender: Any) {
        if let newWeightVal = weightInput.text {
            renewDataModel?.registerNewUser(weight: newWeightVal)
            
            performSegue(withIdentifier: "finishRegister", sender: nil)
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        performSegue(withIdentifier: "cancelRegister", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        weightInput.endEditing(true)
    }
}

