//
//  ViewController.swift
//  Project-7-Memory
//
//  Created by g tokman on 4/4/16.
//  Copyright © 2016 garytokman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: Setup

private extension ViewController {
    func setup() {
        view.backgroundColor = .greenSea()
        
        // Add buttons
        buildButtonWithCenter(CGPoint(x: view.center.x, y: view.center.y / 2.0), title: "Easy", color: .emerald(), action: #selector(ViewController.onEasyTapped(_:)))
        buildButtonWithCenter(CGPoint(x: view.center.x, y: view.center.y), title: "Meduim", color: .sunflower(), action: #selector(ViewController.onMediumTapped(_:)))
        buildButtonWithCenter(CGPoint(x: view.center.x, y: view.center.y  * 3.0 / 2.0), title: "Hard", color: .alizarin(), action: #selector(ViewController.onHardTapped(_:)))
    }
    
    func buildButtonWithCenter(center: CGPoint, title: String, color: UIColor, action: Selector) {
        let button = UIButton()
        button.setTitle(title, forState: .Normal)
        button.setTitleColor(.whiteColor(), forState: .Normal)
        
        button.frame = CGRect(origin: CGPoint(x: 0, y:  0), size: CGSize(width: 200, height: 50))
        button.center = center
        button.backgroundColor = color
        
        button.addTarget(self, action: action, forControlEvents: .TouchUpInside)
        
        view.addSubview(button)
    }
}

// MARK: Difficulty

extension ViewController {
    func onEasyTapped(sender: UIButton) {
        newGameDifficulty(.Easy)
    }
    
    func onMediumTapped(sender: UIButton) {
        newGameDifficulty(.Medium)
    }
    
    func onHardTapped(sender: UIButton) {
        newGameDifficulty(.Hard)
    }
    
    func newGameDifficulty(difficulty: Difficulty) {
     
        let gameViewController = MemoryViewController(difficulty: difficulty)
        presentViewController(gameViewController, animated: true, completion: nil)
    }
}