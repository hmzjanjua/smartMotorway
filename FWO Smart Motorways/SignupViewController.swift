//
//  SignupViewController.swift
//  FWO Smart Motorways
//
//  Created by Hamza Janjua on 1/27/18.
//  Copyright © 2018 Frontier Works Organization. All rights reserved.
//

import UIKit
import Alamofire

class SignupViewController: UIViewController {

    
    @IBOutlet weak var Fullname: UITextField!
    @IBOutlet weak var Phoneno: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Carnum: UITextField!
    
    @IBOutlet weak var Choice: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    
    let uniqueid = "12345"
    let otp = "123456"
    
    @IBAction func buttonRegister(_ sender: UIButton) {
        let parameters: Parameters=[
            "name":Fullname.text!,
            "email":Phoneno.text!,
            "password":Password.text!,
            "phone":"Traveler",
            "cell":Carnum.text!,
            
        ]
        //Sending http post request
        Alamofire.request("http://www.fwosmartmotorways.com/server_side_php/Registration.php", method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    //displaying the message in label
                    self.labelMessage.text = jsonData.value(forKey: "message") as! String?
                }
        }
    }
    //http://www.fwosmartmotorways.com/server_side_php/Registration.php
    
    @IBAction func `switch`(_ sender: UISwitch) {
        
        if(sender.isOn == true){
            Choice.text = "You are a : Traveller"
            self.Carnum.isHidden = false
        }
        else{
            Choice.text = "You are a : Passenger"
            self.Carnum.isHidden = true
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
