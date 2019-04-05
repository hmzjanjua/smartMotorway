//
//  GradientView.swift
//  FSM
//
//  Created by Hamza Janjua on 1/23/18.
//  Copyright © 2018 Frontier Works Organization. All rights reserved.
//

import UIKit

@IBDesignable

class GradientView: UIView {
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [FirstColor.cgColor, SecondColor.cgColor]
        
    }

    @IBInspectable var FirstColor: UIColor = UIColor.clear{
        didSet {
            updateView()
        }
        
    }
    override class var layerClass: AnyClass{
        get {
            return CAGradientLayer.self
        }
    }
    
    @IBInspectable var SecondColor: UIColor = UIColor.clear{
        didSet {
            updateView()
        }
    }
    
    
    
    
}
