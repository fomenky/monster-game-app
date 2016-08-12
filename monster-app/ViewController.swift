//
//  ViewController.swift
//  monster-app
//
//  Created by AceGod on 8/11/16.
//  Copyright © 2016 AceGod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImg: MonsterImg!
    @IBOutlet weak var foodImg: DragImg!
    @IBOutlet weak var heartImg: DragImg!
    
    @IBOutlet weak var penalty1Img: UIImageView!
    @IBOutlet weak var penalty2Img: UIImageView!
    @IBOutlet weak var penalty3Img: UIImageView!
    
    let DIM_ALPHA: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    let MAX_PENALTIES = 3
    
    var penalties = 0
    
    var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg
        
        penalty1Img.alpha = DIM_ALPHA
        penalty2Img.alpha = DIM_ALPHA
        penalty3Img.alpha = DIM_ALPHA
        
        //Observe Notification
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.itemDroppedOnCharacter(_:)), name: "onTargetDropped", object: nil)
        
        startTimer()
    }
    
    func itemDroppedOnCharacter(notif: AnyObject) {
        print("Item dropped on character")
    }
    
    func startTimer() {
        if timer != nil{
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.changeGameState), userInfo: nil, repeats: true)
    }
    
    func changeGameState()  {
        penalties += 1
        
        if penalties == 1 {
            penalty1Img.alpha = OPAQUE
        }else if penalties == 2{
            penalty2Img.alpha = OPAQUE
        }else if penalties >= 3{
            penalty3Img.alpha = OPAQUE
        }else{
            penalty1Img.alpha = DIM_ALPHA
            penalty2Img.alpha = DIM_ALPHA
            penalty3Img.alpha = DIM_ALPHA
        }
        
        if penalties >= MAX_PENALTIES{
            gameOver()
        }
    }
    
    func gameOver() {
        timer.invalidate()
        monsterImg.playDeathAnimation()
    }
    
}

