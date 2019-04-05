//
//  ViewController.swift
//  FWO Smart Motorways
//
//  Created by Hamza Janjua on 1/24/18.
//  Copyright © 2018 Frontier Works Organization. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var menu_vc: MenuViewController!
    
    @IBOutlet weak var Map: MKMapView!
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        
        Map.setRegion(region, animated: true)
        
        self.Map.showsUserLocation = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        menu_vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    
    func respondToGesture(gesture : UISwipeGestureRecognizer){
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            print("swiped Right")
            //show menu
            show_menu()
            
        case UISwipeGestureRecognizerDirection.left:
            print("swiped Left")
            //close menu
            close_on_swipe()
        default:
            break
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func menu_Action(_ sender: UIBarButtonItem) {
        
        if AppDelegate.menu_bool{
            //show the menu
            show_menu()
        }else{
            //close menu
            close_menu()
        }
        
    }
    
    func close_on_swipe(){
        if AppDelegate.menu_bool{
            //show the menu
           // show_menu()
        }else{
            //close menu
            close_menu()
        }

    }
    
    func show_menu(){
        UIView.animate(withDuration: 0.3){ ()->Void in
            
            self.menu_vc.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.menu_vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            self.addChildViewController(self.menu_vc)
            self.view.addSubview(self.menu_vc.view)
            AppDelegate.menu_bool = false
            
        }
        
    }
    
    func close_menu(){
        UIView.animate(withDuration: 0.3, animations: {()->Void in
            self.menu_vc.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: -60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }) { (finished) in
        self.menu_vc.view.removeFromSuperview()
        }
            AppDelegate.menu_bool = true
    }

}

