//
//  LoginViewController.swift
//  FWO Smart Motorways
//
//  Created by Hamza Janjua on 1/28/18.
//  Copyright © 2018 Frontier Works Organization. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    
    @IBOutlet weak var labelMessage: UILabel!
    
    let URL_USER_LOGIN = "http://www.fwosmartmotorways.com/server_side_php/login.php"
    
    //defaultValues to store user data
    let defaultValues = UserDefaults.standard
    
    @IBAction func buttonLogin(_ sender: UIButton) {
        let parameters: Parameters=[
        "email":textFieldPhone.text!,
        "password":textFieldPassword.text!
        ]
    
    

    //making a post request
    Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters).responseJSON
    {
    response in
    //printing response
    print(response)
    
    //getting the json value from the server
    if let result = response.result.value {
    let jsonData = result as! NSDictionary
    
    //if there is no error
    if(!(jsonData.value(forKey: "error") as! Bool)){
    
    //getting the user from response
    let user = jsonData.value(forKey: "user") as! NSDictionary
    
    //getting user values
    self.labelMessage.text = user.value(forKey: "messsage") as? String
    let phoneNum = user.value(forKey: "email") as! String
    let name = user.value(forKey: "name") as! String
    let otp = user.value(forKey: "otp") as! String
    let phone = user.value(forKey: "phone") as! String
    let uid = user.value(forKey: "uid") as! String
    let verified = user.value(forKey: "verified") as! String
    let created_at = user.value(forKey: "created_at") as! String
    
    
    //saving user values to defaults
    self.defaultValues.set(phoneNum, forKey: "email")
    self.defaultValues.set(name, forKey: "name")
    self.defaultValues.set(created_at, forKey: "created_at")
    self.defaultValues.set(verified, forKey: "verified")
    self.defaultValues.set(uid, forKey: "uid")
    self.defaultValues.set(otp, forKey: "otp")
    self.defaultValues.set(phone, forKey: "phone")
    
    //switching the screen
    let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
    self.navigationController?.pushViewController(profileViewController, animated: true)
    
    self.dismiss(animated: false, completion: nil)
    }else{
    //error message in case of invalid credential
    self.labelMessage.text = "Invalid username or password"
                    }
                }
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
