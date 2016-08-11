//
//  ViewController.swift
//  monster-app
//
//  Created by AceGod on 8/11/16.
//  Copyright © 2016 AceGod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imgArray = [UIImage]()
        
        for i in 1...4 {
            let img = UIImage(named: "idle\(i).png")
            imgArray.append(img!)
        }
        monsterImg.animationImages = imgArray
        monsterImg.animationDuration = 0.5
        monsterImg.animationRepeatCount = 0
        monsterImg.startAnimating()
    }

    


}

