//
//  MenuViewController.swift
//  FWO Smart Motorways
//
//  Created by Hamza Janjua on 1/24/18.
//  Copyright © 2018 Frontier Works Organization. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {


    @IBOutlet weak var usernameLabel: UILabel!
    
    //Navigation Menu
    let menu_arr = ["Safar ki dua","Recharge","Journey Plan","Smart Motorways","Helpline","FM Transmission","Nearby Places","Change Password","Log out"]
    
    let img_arr = [UIImage(named: "hand.png"),UIImage(named: "recharge.png"),UIImage(named: "journey.png"),UIImage(named: "smartsheild.png"),UIImage(named: "helpline.png"),UIImage(named: "fmradio.png"),UIImage(named: "nearbypin.png"),UIImage(named: "lock.png"),UIImage(named: "logoutcross.png")]
    
    //Rate US Share etc
    
    let title_arr = [""]
    
    
    
    @IBOutlet weak var menu_tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        menu_tableView.delegate = self
        menu_tableView.dataSource = self
        
        //getting values from Login view defaults
        let defaultValues = UserDefaults.standard
        
        if let username = defaultValues.string(forKey: "name"){
            usernameLabel.text = username
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //number of sections in table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    //number of rows int
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0{
            return menu_arr.count
        }
        else{
            return title_arr.count
        }
    }
    
    //contents of each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menu_cell") as! MenuTableViewCell
        
        
        if indexPath.section==0 {
            cell.lavel_title.text = menu_arr[indexPath.row]
            cell.icon.image = img_arr[indexPath.row]
            
        }
        
        if indexPath.section==1 {
            cell.lavel_title.text = title_arr[indexPath.row]
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section==0{
            
            if indexPath.row == 0{
                performSegue(withIdentifier: "showDetails", sender: self)
            }
            if indexPath.row == 1{
                performSegue(withIdentifier: "recharge", sender: self)
            }
            if indexPath.row == 2{
                performSegue(withIdentifier: "journey", sender: self)
                print(2)
            }
            if indexPath.row == 3{
                performSegue(withIdentifier: "smartmm", sender: self)
                print(3)
            }
            if indexPath.row == 4{
                performSegue(withIdentifier: "helpline", sender: self)
                print(4)
            }
            if indexPath.row == 5{
                performSegue(withIdentifier: "fmtransmission", sender: self)
                print(5)
            }
            if indexPath.row == 6{
                performSegue(withIdentifier: "nearby", sender: self)
                print(6)
            }
            if indexPath.row == 7{
                performSegue(withIdentifier: "changepw", sender: self)
                print(7)
            }
            if indexPath.row == 8{
                performSegue(withIdentifier: "logout", sender: self)
                print(8)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SafarViewController{
            print("Ajlala for life!")
        }
    }

}
