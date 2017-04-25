//
//  ViewController.swift
//  BlurEffect
//
//  Created by 01HW934413 on 24/04/17.
//  Copyright © 2017 01HW934413. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    @IBOutlet var addItemView: UIView!
    
    var visualEffect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        visualEffect = visualEffectView.effect
        visualEffectView.effect = nil
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doneTapped(_ sender: UIButton) {
        animateOut()
    }

    
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
        animateIn()
    }
    
    func animateIn(){
        self.view.addSubview(addItemView)
        addItemView.center = self.view.center
        addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        addItemView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.effect = self.visualEffect
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }
        
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.addItemView.alpha = 0
            self.visualEffectView.effect = nil
        }) { (success: Bool) in
            self.addItemView.removeFromSuperview()
        }
    }
    
}

