//
//  ClassBVC.swift
//  DelegateTutorial
//
//  Created by James Rochabrun on 2/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

//MARK: step 1 Add Protocol here
protocol ClassBVCDelegate: class {
    func changeBackgroundColor(_ color: UIColor?)
}

class ClassBVC: UIViewController {
    

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    //MARK: step 2 Create a delegate property here, don't forget to make it weak!
    weak var delegate: ClassBVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstView.backgroundColor = .cyan
        firstView.layer.borderColor = UIColor.white.cgColor
        firstView.layer.borderWidth = 2.0
        firstView.layer.cornerRadius = firstView.frame.width / 2
        firstView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        secondView.backgroundColor = .brown
        secondView.layer.borderColor = UIColor.white.cgColor
        secondView.layer.borderWidth = 2.0
        secondView.layer.cornerRadius = secondView.frame.width / 2
        secondView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        
    }
    @IBAction func dismissView(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    @objc func handleTap(_ tapGesture: UITapGestureRecognizer) {
        
//        view.backgroundColor = tapGesture.view?.backgroundColor
//        //MARK: step 3 Add the delegate method call here
//        delegate?.changeBackgroundColor(tapGesture.view?.backgroundColor)
//
//    }
        
        
        UIView.animate(withDuration: 1.0, animations: {
            self.firstView.backgroundColor = UIColor.red
            self.firstView.frame.size.width += 200
             self.firstView.frame.size.height += 200
        }) { _ in
            UIView.animate(withDuration: 1.0, delay: 0.25, options: [.autoreverse , .repeat ], animations: {
                self.firstView.frame.origin.y -= 10
                   self.firstView.frame.origin.x = 100
                self.firstView.frame.size.width = 80
                self.firstView.frame.size.height = 70
                       // self.firstView.isHidden = true
            })
            
            
        }
  
        }
  
}
